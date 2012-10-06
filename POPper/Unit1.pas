unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Buttons, Unit2, ExtCtrls, Unit3, Unit4, Unit5,
  NMsmtp, Psock, NMpop3, IniFiles, Egyenlo, About, POPperData;

type
  TfrmMainForm = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    cmdBeallitasok: TSpeedButton;
    cmdEmailkuldese: TSpeedButton;
    Bevel1: TBevel;
    cmdKilepes: TSpeedButton;
    Bevel2: TBevel;
    cmdKuldendoleveleklistaja: TSpeedButton;
    cmdLevellista: TSpeedButton;
    Bevel3: TBevel;
    Bevel4: TBevel;
    cmdElkuldes: TSpeedButton;
    cmdLetoltes: TSpeedButton;
    cmdElkuldesesletoltes: TSpeedButton;
    Bevel5: TBevel;
    Bevel6: TBevel;
    POPperData1: TPOPperData;
    POPperData21: TPOPperData2;
    NMPOP31: TNMPOP3;
    NMSMTP1: TNMSMTP;
    POPperData22: TPOPperData2;
    cmdElkuldottleveleklistaja: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure cmdBeallitasokClick(Sender: TObject);
    procedure cmdEmailkuldeseClick(Sender: TObject);
    procedure cmdKilepesClick(Sender: TObject);
    procedure cmdKuldendoleveleklistajaClick(Sender: TObject);
    procedure cmdLevellistaClick(Sender: TObject);
    procedure cmdElkuldesClick(Sender: TObject);
    procedure cmdLetoltesClick(Sender: TObject);
    procedure NMPOP31List(Msg, Size: Integer);
    procedure NMSMTP1AttachmentNotFound(Filename: String);
    procedure NMSMTP1AuthenticationFailed(var Handled: Boolean);
    procedure NMSMTP1Connect(Sender: TObject);
    procedure Status(s: string);
    procedure NMSMTP1ConnectionFailed(Sender: TObject);
    procedure NMSMTP1Disconnect(Sender: TObject);
    procedure NMSMTP1Failure(Sender: TObject);
    procedure NMSMTP1HeaderIncomplete(var handled: Boolean; hiType: Integer);
    procedure NMSMTP1InvalidHost(var Handled: Boolean);
    procedure NMSMTP1PacketSent(Sender: TObject);
    procedure NMSMTP1RecipientNotFound(Recipient: String);
    procedure NMSMTP1SendStart(Sender: TObject);
    procedure NMSMTP1Success(Sender: TObject);
    procedure NMPOP31AuthenticationFailed(var Handled: Boolean);
    procedure NMPOP31AuthenticationNeeded(var Handled: Boolean);
    procedure NMPOP31Connect(Sender: TObject);
    procedure NMPOP31ConnectionFailed(Sender: TObject);
    procedure NMPOP31InvalidHost(var Handled: Boolean);
    procedure NMPOP31PacketRecvd(Sender: TObject);
    procedure cmdElkuldesesletoltesClick(Sender: TObject);
    procedure cmdElkuldottleveleklistajaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure LogDebugInfo(s: string);
   private
    OldWinProc, NewWinProc: pointer;
    OutCanvas: TCanvas;
    EmailCount, CurrentlyDownloaded: integer;
    SendCount, CurrentSent: integer;
    procedure NewWinProcedure(var Msg: TMessage);
  public
    { Public declarations }
  end;

  TPOP3Thread = class(TThread)
  protected
    procedure Execute;override;
    procedure LogDebugInfo(s: string);
  end;

var
  frmMainForm: TfrmMainForm;
  hSysMenu, nCnt: longint;
  MailSizes: array[1..1024] of integer;
  levelszam: integer;
  dinfo: TStringList;
  POP3Thread: TPOP3Thread;

const mf_ByPosition = $400;
      mf_Remove = $1000;

implementation

{$R *.DFM}
{$R kepek.res}

procedure TfrmMainForm.FormCreate(Sender: TObject);
var VInfoSize, DetSize: dword;
    pVInfo, pDetail: pointer;
    MajorVer, MinorVer: integer;
    FileDescription: string;
    pLangInfo: ^TLangInfoBuffer;
    strLangID: string;
begin
 StatusBar1.Panels.Items[0].Width := StatusBar1.Width;

 hSysMenu := GetSystemMenu(Handle,false);
 if hSysMenu <> 0 then
 begin
  nCnt := GetMenuItemCount(hSysMenu);
  if nCnt <> 0 then
  begin
   RemoveMenu(hSysMenu,nCnt-1,mf_ByPosition + mf_Remove);
   RemoveMenu(hSysMenu,nCnt-2,mf_ByPosition + mf_Remove);
   DrawMenuBar(Handle);
  end;
 end;

 NewWinProc := MakeObjectInstance(NewWinProcedure);
 OldWinProc := pointer(SetWindowLong(ClientHandle,gwl_WndProc,cardinal(NewWinProc)));
 OutCanvas := TCanvas.Create;

 MajorVer := 0;
 MinorVer := 0;

 VInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)),DetSize);
 if VInfoSize > 0 then
 begin
  GetMem(pVInfo,VInfoSize);
  try
   GetFileVersionInfo(PChar(ParamStr(0)),0,VInfoSize,pVInfo);
   VerQueryValue(PVInfo,'\',pDetail,DetSize);
   with TVSFixedFileInfo(pDetail^) do
   begin
    MajorVer := HiWord(dwFileVersionMS);
    MinorVer := LoWord(dwFileVersionMS);
    VerQueryValue(pVInfo,'\VarFileInfo\Translation',pointer(pLangInfo),DetSize);
    strLangID := IntToHex(smallint(pLangInfo^[1]),4) + IntToHex(smallint(pLangInfo^[2]),4);
    strLangID := 'StringFileInfo\' + strLangID;
    VerQueryValue(pVInfo,PChar(strLangID + '\FileDescription'),pDetail,DetSize);
    FileDescription := PChar(pDetail);
   end;
  finally
   FreeMem(PVInfo);
  end;
 end;

 frmMainForm.Caption := 'Putra POPper v' + IntToStr(MajorVer) + '.' + IntToStr(MinorVer) + #32 + FileDescription;

 dinfo := TStringList.Create;
 dinfo.Text := '';
 LogDebugInfo('Napl� megnyitva - ' + frmMainForm.Caption);

 POP3Thread := TPOP3Thread.Create(true);
end;

procedure TfrmMainForm.cmdBeallitasokClick(Sender: TObject);
var bf: TfrmBeallitasok;
begin
 bf := TfrmBeallitasok.Create(frmMainForm);
 bf.Show;
end;

procedure TfrmMainForm.cmdEmailkuldeseClick(Sender: TObject);
var ekf: TfrmEmailkuldes;
begin
 ekf := TfrmEmailkuldes.Create(frmMainForm);
 ekf.Show;
end;

procedure TfrmMainForm.cmdKilepesClick(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TfrmMainForm.cmdKuldendoleveleklistajaClick(Sender: TObject);
var kll: TfrmKuldendoleveleklistaja;
begin
 kll := TfrmKuldendoleveleklistaja.Create(frmMainForm);;
 kll.Show;
end;

procedure TfrmMainForm.cmdLevellistaClick(Sender: TObject);
var ull: TfrmUjleveleklistaja;
begin
 ull := TfrmUjleveleklistaja.Create(frmMainForm);
 ull.Show;
end;

procedure TfrmMainForm.NewWinProcedure(var Msg: TMessage);
var BmpWidth, BmpHeight: integer;
    Bitmap: TBitmap;
    i,j: integer;
begin
 Msg.Result := CallWindowProc(OldWinProc,ClientHandle,Msg.Msg,Msg.wParam,Msg.lParam);
 if Msg.Msg = wm_EraseBkgnd then
 begin
  Bitmap := TBitmap.Create;
  Bitmap.Handle := LoadBitmap(hInstance,'pwlogo');
  BmpWidth := Bitmap.Width;
  BmpHeight := Bitmap.Height;

  if (BmpWidth <> 0) and (BmpHeight <> 0) then
  begin
   OutCanvas.Handle := Msg.wParam;
   for i := 0 to frmMainForm.ClientWidth div BmpWidth do
    for j := 0 to frmMainForm.ClientHeight div BmpHeight do
     OutCanvas.Draw(i*BmpWidth,j*BmpHeight,Bitmap);
  end;
 end;
end;

procedure TfrmMainForm.cmdElkuldesClick(Sender: TObject);
var cfg: TIniFile;
    i: integer;
begin
 POPperData21.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'tobesent.pop');
 POPperData22.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'sent.pop');

 if POPperData21.Count = 0 then
  Abort;

 cfg := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'popper.ini');

 nmSMTP1.Host := cfg.ReadString('smtp','host','');
 nmSMTP1.UserID := cfg.ReadString('smtp','userid','');

 SendCount := POPperData21.Count;

 Status('Levelek el�k�sz�t�se a k�ld�sre');

 for i := 1 to POPperData21.Count do
 begin
  try
   nmSMTP1.Connect;

   CurrentSent := i;

   if cfg.ReadInteger('smtp','format',0) = 0 then
    nmSMTP1.SubType := mtPlain
   else
    nmSMTP1.SubType := mtHtml;
    
   nmSMTP1.EncodeType := uuMime;

   nmSMTP1.PostMessage.FromAddress := cfg.ReadString('sender','email','');
   nmSMTP1.PostMessage.FromName := cfg.ReadString('sender','name','');
   nmSMTP1.PostMessage.ReplyTo := cfg.ReadString('sender','replyto','');
   nmSMTP1.PostMessage.LocalProgram := 'Putra POPper';
   nmSMTP1.PostMessage.Date := DateToStr(Now);

   nmSMTP1.PostMessage.ToAddress.Text := POPperData21.GetIndex(i,sit2To);
   nmSMTP1.PostMessage.ToCarbonCopy.Text := POPperData21.GetIndex(i,sit2CC);
   nmSMTP1.PostMessage.ToBlindCarbonCopy.Text := POPperData21.GetIndex(i,sit2BCC);
   nmSMTP1.PostMessage.Subject := POPperData21.GetIndex(i,sit2Subject);
   nmSMTP1.PostMessage.Attachments.Text := POPperData21.GetIndex(i,sit2Attach);
   nmSMTP1.PostMessage.Body.Text := POPperData21.GetIndex(i,sit2Body);

   nmSMTP1.SendMail;
   Status('');

   if cfg.ReadBool('smtp','save',true) = true then
    POPperData22.AddNew(POPperData21.GetIndex(i,sit2To),
                        POPperData21.GetIndex(i,sit2CC),
                        POPperData21.GetIndex(i,sit2BCC),
                        POPperData21.GetIndex(i,sit2Subject),
                        POPperData21.GetIndex(i,sit2Attach),
                        POPperData21.GetIndex(i,sit2Body));

  finally
   nmSMTP1.Disconnect;
  end;
 end;


 if cfg.ReadBool('smtp','delete',true) = true then
  while POPperData21.Count > 0 do
   POPperData21.Delete(1);

 POPperData21.SaveToFile(ExtractFilePath(ParamStr(0)) + 'tobesent.pop');
 POPperData22.SaveToFile(ExtractFilePath(ParamStr(0)) + 'sent.pop');

 cfg.Free;
end;

procedure TfrmMainForm.cmdLetoltesClick(Sender: TObject);
var cfg: TIniFile;
//    i: integer;
//    tempstr: string;
//    tsl: TStringList;
//    s: string;
begin
 cfg := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'popper.ini');
 POPperData1.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'newmail.pop');
                                                                                LogDebugInfo('popper.ini �s newmail.pop sikeresen megnyitva');
 nmPOP31.Host := cfg.ReadString('pop3','host','');
 nmPOP31.UserID := cfg.ReadString('pop3','userid','');
 nmPOP31.Password := cfg.ReadString('pop3','password','');                      LogDebugInfo('pop3 kapcsolat be�ll�tva');

 POP3Thread.Execute;

 LogDebugInfo('POP3 let�lt� sz�l elind�tva');

{ try
  nmPOP31.Connect;                                                              LogDebugInfo('pop3 csatlakoz�s megnyitva');
  levelszam := nmPOP31.MailCount;                                               LogDebugInfo('a szerveren ' + IntToStr(levelszam) + 'db lev�l van');
  if levelszam = 0 then
  begin
   Status('Nincs �j lev�l!');
   nmPOP31.Disconnect;                                                          LogDebugInfo('nincs �j lev�l - kapcsolat bontva');
   Abort;
  end;

  nmPOP31.AttachFilePath := ExtractFilePath(ParamStr(0)) + 'AttachFiles';
  EmailCount := levelszam;

  nmPOP31.List;                                                                 LogDebugInfo('pop3 - list sikeresen v�grehajtva');

  for i := 1 to levelszam do
  begin
   CurrentlyDownloaded := i;
   nmPOP31.GetMailMessage(i);                                                   LogDebugInfo('lev�l #' + IntToStr(i) + ' lek�rve a szerverr�l');
   POPperData1.AddNew(nmPOP31.MailMessage.From,
                      false,
                      MailSizes[i],
                      Now,
                      TargyAtalakitas(nmPOP31.MailMessage.Subject),
                      nmPOP31.MailMessage.Attachments.Text,
                      EgyenlosegTorles(nmPOP31.MailMessage.Body.Text));

   LogDebugInfo('lev�l #' + IntToStr(i) + ' hozz�adva az adatb�zishoz');

   if cfg.ReadBool('pop3','delete',false) = true then
   begin
    nmPOP31.DeleteMailMessage(i);
    LogDebugInfo('lev�l #' + IntToStr(i) + ' t�r�lve a szerverr�l');
   end;
  end;
 finally
  nmPOP31.Disconnect;                                                           LogDebugInfo('lecsatlakozva a szerverr�l');
 end;

 tempstr := StatusBar1.Panels[0].Text;
// Status('Ut�munk�latok a let�lt�tt leveleken');        }

{ tsl := TStringList.Create;
 for i := 1 to levelszam do
 begin
  tsl.Text := POPperData1.GetIndex(i,sitBody);
  s := tsl[tsl.Count-1];
  if (pos('File',s)=1) and (pos('extracted',s)>1) then
  begin
   delete(s,1,length('File "'));
   delete(s,length(s)-length('" extracted'),length(s));
   POPperData1.SetIndex(i,sitAttach,POPperData1.GetIndex(i,sitAttach) + #13#10 + s);
  end;
 end;
 tsl.Free;}

// Status(tempstr);

// POPperData1.SaveToFile(ExtractFilePath(ParamStr(0)) + 'newmail.pop');          LogDebugInfo('adatb�zis elmentve');

 cfg.Free;
end;

procedure TfrmMainForm.NMPOP31List(Msg, Size: Integer);
begin
 MailSizes[Msg] := Size;                                                        LogDebugInfo('lev�l #' + IntToStr(Msg) + ' m�rete ' + IntToStr(Size) + ' byte');
end;

procedure TfrmMainForm.NMSMTP1AttachmentNotFound(Filename: String);
begin
 Application.MessageBox(PChar('Nem tal�lhat� a k�vetkez� csatolt file: ' + Filename),'Putra POPper',mb_Ok + mb_IconError);
 LogDebugInfo('smtp: nem tal�lhat� csatolt file: ' + Filename);
end;

procedure TfrmMainForm.NMSMTP1AuthenticationFailed(var Handled: Boolean);
var s: string;
begin
 LogDebugInfo('smtp: AuthenticationFailed');
 if Application.MessageBox('Hib�s felhaszn�l�i n�v. Jav�tod?','Putra POPper',mb_YesNo + mb_IconError) = id_No then
 begin
  Handled := false;
  Abort;
 end;

 s := nmSMTP1.UserID;
 if not InputQuery('Putra POPper','�j felhaszn�l�i n�v:',s) then
 begin
  Handled := false;
  Abort;
 end;

 nmSMTP1.UserID := s;
end;

procedure TfrmMainForm.NMSMTP1Connect(Sender: TObject);
begin
 Status('Csatlakoztatva az SMTP szerverre');
end;

procedure TfrmMainForm.Status(s: string);
begin
 StatusBar1.Panels[0].Text := s;
 LogDebugInfo('Status: ' + s);
end;

procedure TfrmMainForm.NMSMTP1ConnectionFailed(Sender: TObject);
begin
 LogDebugInfo('smtp: ConnectionFailed');
 Application.MessageBox('Nem siker�lt csatlakozni az SMTP szerverre!','Putra POPper',mb_OK + mb_IconError);
end;

procedure TfrmMainForm.NMSMTP1Disconnect(Sender: TObject);
begin
 Status('Lecsatlakozva az SMTP szerverr�l');
end;

procedure TfrmMainForm.NMSMTP1Failure(Sender: TObject);
begin
 LogDebugInfo('smtp: nem lehets�ges a lev�lk�ld�s');
 Application.MessageBox('A lev�lk�ld�s nem lehets�ges!','Putra POPper',mb_OK + mb_IconError);
end;

procedure TfrmMainForm.NMSMTP1HeaderIncomplete(var handled: Boolean; hiType: Integer);
var s: string;
begin
 if hiType = hiFromAddress then
 begin
  LogDebugInfo('smtp: nincs kit�ltve a felad� c�me');
  if Application.MessageBox('Nincs kit�ltve a felad� c�me. Megadod most?','Putra POPper',mb_YesNo + mb_IconQuestion) = id_No then
  begin
   Handled := false;
   Abort;
  end;
  s := nmSMTP1.PostMessage.FromAddress;
  if not InputQuery('Putra POPper','Felad� c�me:',s) then
  begin
   Handled := false;
   Abort;
  end;
  nmSMTP1.PostMessage.FromAddress := s;
  Handled := true;
 end else
 if hiType = hiToAddress then
 begin
  LogDebugInfo('smtp: nincs megadva a c�mzett e-mail c�me');
  if Application.MessageBox('Nincs megadva a c�mzett e-mail c�me! Megadod most?','Putra POPper',mb_YesNo + mb_IconQuestion) = id_No then
  begin
   Handled := false;
   Abort;
  end;
  s := nmSMTP1.PostMessage.ToAddress.Text;
  if not InputQuery('Putra POPper','C�mzett:',s) then
  begin
   Handled := false;
   Abort;
  end;
  nmSMTP1.PostMessage.ToAddress.Text := s;
  Handled := true;
 end;
end;

procedure TfrmMainForm.NMSMTP1InvalidHost(var Handled: Boolean);
var s: string;
begin
 LogDebugInfo('smtp: nem lehet csatlakozni a szerverre');
 if Application.MessageBox('Nem lehet csatlakozni az SMTP szerverre. Jav�tod a hib�s c�met?','Putra POPper',mb_YesNo + mb_IconQuestion) = id_No then
 begin
  Handled := false;
  Abort;
 end;
 s := nmSMTP1.Host;
 if not InputQuery('Putra POPper','SMTP szerver c�me:',s) then
 begin
  Handled := false;
  Abort;
 end;
 nmSMTP1.Host := s;
 Handled := true;
end;

procedure TfrmMainForm.NMSMTP1PacketSent(Sender: TObject);
var i: integer;
begin
 i := trunc((nmSMTP1.BytesSent / nmSMTP1.BytesTotal)*100);

 Status('Lev�l k�ld�se: lev�l' + IntToStr(CurrentSent) + '/' + IntToStr(SendCount) + ': ' + IntToStr(i) + '%...');
end;

procedure TfrmMainForm.NMSMTP1RecipientNotFound(Recipient: String);
begin
 LogDebugInfo('nem l�tez� e-mail c�m: ' + Recipient);
 Application.MessageBox(PChar('Nem l�tezik ilyen e-mail c�m: ' + Recipient),'Putra POPper',mb_OK + mb_IconError);
end;

procedure TfrmMainForm.NMSMTP1SendStart(Sender: TObject);
begin
 Status('Lev�l k�ld�s�nek kezd�se');
end;

procedure TfrmMainForm.NMSMTP1Success(Sender: TObject);
begin
 Status('Lev�l sikeresen elk�ldve');
end;

procedure TfrmMainForm.NMPOP31AuthenticationFailed(var Handled: Boolean);
var s: string;
begin
 LogDebugInfo('pop3: AuthenticationFalied');
 if Application.MessageBox('Nem megfelel� felhaszn�l�n�v/jelsz� p�ros. Jav�tod?','Putra POPper',mb_YesNo + mb_IconQuestion) = id_No then
 begin
  Handled := false;
  Abort;
 end;
 s := nmPOP31.UserID;
 if not InputQuery('Putra POPper','�j felhaszn�l�n�v:',s) then
 begin
  Handled := false;
  Abort;
 end;
 nmPOP31.UserID := s;
 s := nmPOP31.Password;
 if not InputQuery('Putra POPper','�j jelsz�:',s) then
 begin
  Handled := false;
  Abort;
 end;
 nmPOP31.Password := s;
 Handled := true;
end;

procedure TfrmMainForm.NMPOP31AuthenticationNeeded(var Handled: Boolean);
var s: string;
begin
 LogDebugInfo('pop3: AuthenticationNeeded');
 s := nmPOP31.UserID;
 if not InputQuery('Putra POPper','Felhaszn�l�n�v:',s) then
 begin
  Handled := false;
  Abort;
 end;
 nmPOP31.UserID := s;
 s := nmPOP31.Password;
 if not InputQuery('Putra POPper','Jelsz�:',s) then
 begin
  Handled := false;
  Abort;
 end;
 nmPOP31.Password := s;
 Handled := true;
end;

procedure TfrmMainForm.NMPOP31Connect(Sender: TObject);
begin
 Status('Csatlakoztatva a POP3 szerverre');
end;

procedure TfrmMainForm.NMPOP31ConnectionFailed(Sender: TObject);
begin
 Application.MessageBox('Nem siker�lt kapcsolatot teremteni a POP3 szerverrel!','Putra POPper',mb_OK + mb_IconError);
 LogDebugInfo('nem siker�lt a pop3 kapcsolat');
end;

procedure TfrmMainForm.NMPOP31InvalidHost(var Handled: Boolean);
var s: string;
begin
 LogDebugInfo('pop3: nem megfelel� szerverc�m');
 if Application.MessageBox('Nem megfelel� szerverc�m. Jav�tod?','Putra POPer',mb_YesNo + mb_IconQuestion) = id_No then
 begin
  Handled := false;
  Abort;
 end;
 s := nmPOP31.Host;
 if not InputQuery('Putra POPper','�j szerverc�m:',s) then
 begin
  Handled := false;
  Abort;
 end;
 nmPOP31.Host := s;
end;

procedure TfrmMainForm.NMPOP31PacketRecvd(Sender: TObject);
var i: integer;
begin
 if nmPOP31.BytesTotal <> 0 then
  i := trunc((nmPOP31.BytesRecvd / MailSizes[CurrentlyDownloaded])*100)
 else
  i := 999; 

 Status('Lev�l let�t�se: lev�l' + IntToStr(CurrentlyDownloaded) + '/' + IntToStr(EmailCount) + ': ' + IntToStr(i) + '%...');
end;

procedure TfrmMainForm.cmdElkuldesesletoltesClick(Sender: TObject);
begin
 cmdElkuldesClick(Sender);
 cmdLetoltesClick(Sender);
end;

procedure TfrmMainForm.cmdElkuldottleveleklistajaClick(Sender: TObject);
var kll: TfrmKuldendoleveleklistaja;
begin
 kll := TfrmKuldendoleveleklistaja.Create(frmMainForm);
 kll.ShowSentEmails;
 kll.Show;
end;

procedure TfrmMainForm.SpeedButton1Click(Sender: TObject);
var about: TfrmAbout;
begin
 about := TfrmAbout.Create(frmMainForm);
 about.Show;
end;

procedure TfrmMainForm.LogDebugInfo(s: string);
begin
 if pos('Status: Lev�l let�t�se',s) <> 1 then
  if pos('Status: Lev�l k�ld�se',s) <> 1 then
   dinfo.Add(DateTimeToStr(Now) + ': ' + s);
end;

procedure TfrmMainForm.FormDestroy(Sender: TObject);
var f: TextFile;
begin
 LogDebugInfo('Napl� lez�rva');
 dinfo.Add('--------------------------------------------------------------------------------');
 AssignFile(f,ExtractFilePath(ParamStr(0)) + 'debug.log');
 Append(f);
 write(f,dinfo.Text);
 CloseFile(f);
end;

{ TPOP3Thread }

procedure TPOP3Thread.Execute;
var cfg: TIniFile;
    i: integer;
    s: string;
begin
 frmMainForm.cmdLetoltes.Enabled := false;

 cfg := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'popper.ini');

 try
  frmMainForm.nmPOP31.Connect;                                                  LogDebugInfo('pop3 csatlakoz�s megnyitva');
  levelszam := frmMainForm.nmPOP31.MailCount;                                   LogDebugInfo('a szerveren ' + IntToStr(levelszam) + 'db lev�l van');
  if levelszam = 0 then
  begin
   frmMainForm.Status('Nincs �j lev�l!');
   frmMainForm.nmPOP31.Disconnect;                                              LogDebugInfo('nincs �j lev�l - kapcsolat bontva');
   Abort;
  end;

  frmMainForm.nmPOP31.AttachFilePath := ExtractFilePath(ParamStr(0)) + 'AttachFiles';
  frmMainForm.EmailCount := levelszam;

  frmMainForm.nmPOP31.List;                                                     LogDebugInfo('pop3 - list sikeresen v�grehajtva');

  for i := 1 to levelszam do
  begin
   frmMainForm.CurrentlyDownloaded := i;
   frmMainForm.nmPOP31.GetMailMessage(i);                                       LogDebugInfo('lev�l #' + IntToStr(i) + ' lek�rve a szerverr�l');
   frmMainForm.POPperData1.AddNew(frmMainForm.nmPOP31.MailMessage.From,
                                  false,
                                  MailSizes[i],
                                  Now,
                                  TargyAtalakitas(frmMainForm.nmPOP31.MailMessage.Subject),
                                  frmMainForm.nmPOP31.MailMessage.Attachments.Text,
                                  EgyenlosegTorles(trim(frmMainForm.nmPOP31.MailMessage.Body.Text)));

   LogDebugInfo('lev�l #' + IntToStr(i) + ' hozz�adva az adatb�zishoz');

   if cfg.ReadBool('pop3','delete',false) = true then
   begin
    frmMainForm.nmPOP31.DeleteMailMessage(i);
    LogDebugInfo('lev�l #' + IntToStr(i) + ' t�r�lve a szerverr�l');
   end;
  end;
 finally
  frmMainForm.nmPOP31.Disconnect;                                               LogDebugInfo('lecsatlakozva a szerverr�l');
  frmMainForm.cmdLetoltes.Enabled := true;
 end;

 frmMainForm.POPperData1.SaveToFile(ExtractFilePath(ParamStr(0)) + 'newmail.pop');          LogDebugInfo('adatb�zis elmentve');

 s := 'Lecsatlakozva a POP3 szerverr�l';
 if levelszam = 0 then
  s := s +  ' - nincs �j lev�l'
 else
  s := s + ' - ' + IntToStr(levelszam) + 'db �j lev�l';

 frmMainForm.Status(s);       

 LogDebugInfo('POP3 let�lt� sz�l befejezve');
end;

procedure TPOP3Thread.LogDebugInfo(s: string);
begin
 frmMainForm.LogDebugInfo(s);
end;

end.
