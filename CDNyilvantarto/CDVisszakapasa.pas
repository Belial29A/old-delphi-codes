unit CDVisszakapasa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IniFiles, ExtCtrls, Printers, ButtonWithColor, CDNyDataFile2,
  Toltes;

type
  TfrmCDVisszakapasa = class(TForm)
    lstKolcsonadottCDk: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txtKolcsonkero: TEdit;
    txtKolcsonadasDatuma: TEdit;
    btnVisszakapas: TBitBtnWithColor;
    btnBezaras: TBitBtnWithColor;
    Label4: TLabel;
    txtHanyNapjaVanNala: TEdit;
    Label5: TLabel;
    txtKesesiDij: TEdit;
    CDNyDataFile_CDk1: TCDNyCDk;
    CDNyDataFile_Kolcsonkerok1: TCDNyKolcsonkerok;
    procedure FormCreate(Sender: TObject);
    procedure btnBezarasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisszakapasClick(Sender: TObject);
    procedure lstKolcsonadottCDkClick(Sender: TObject);
    function  NalNel(Kinel: string): string;
    procedure LoadData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCDVisszakapasa: TfrmCDVisszakapasa;

implementation

uses MainForm;

{$R *.DFM}

procedure TfrmCDVisszakapasa.FormCreate(Sender: TObject);
begin
 Self.Color := frmMainForm.HatterSzin;
 btnVisszakapas.Color := frmMainForm.Gombok;
 btnBezaras.Color := frmMainForm.Gombok;

 lstKolcsonadottCDk.Font.Color := frmMainForm.Betuk;
 lstKolcsonadottCDk.Canvas.Font.Color := frmMainForm.Betuk;
 Label1.Font.Color := frmMainForm.Betuk;
 Label1.Canvas.Font.Color := frmMainForm.Betuk;
 Label2.Font.Color := frmMainForm.Betuk;
 Label2.Canvas.Font.Color := frmMainForm.Betuk;
 Label3.Font.Color := frmMainForm.Betuk;
 Label3.Canvas.Font.Color := frmMainForm.Betuk;
 txtKolcsonkero.Font.Color := frmMainForm.Betuk;
 txtKolcsonadasDatuma.Font.Color := frmMainForm.Betuk;
 btnVisszakapas.Font.Color := frmMainForm.Betuk;
 btnBezaras.FOnt.Color := frmMainForm.Betuk;
 Label4.Font.Color := frmMainForm.Betuk;
 Label5.Font.Color := frmMainForm.Betuk;
 txtHanyNapjaVanNala.Font.Color := frmMainForm.Betuk;
 txtKesesiDij.Font.Color := frmMainForm.Betuk;

// CDNyDataFile_CDk1.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\Data\CDk.cdny');

// lstKolcsonadottCDk.Items.Clear;
// for i := 1 to CDNyDataFile_CDk1.Count do
//  if CDNyDataFile_CDk1.GetIndex(i).KolcsonVanEKerve then
//   lstKolcsonadottCDk.Items.Add(CDNyDataFile_CDk1.GetIndex(i).CDNeve);

 LoadData;
end;

procedure TfrmCDVisszakapasa.btnBezarasClick(Sender: TObject);
begin
 Self.Close;
end;

procedure TfrmCDVisszakapasa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
 frmCDVisszakapasa := nil;
 frmMainForm.RemoveWindow((Self as TForm).Handle,(Self as TForm));
end;

procedure TfrmCDVisszakapasa.btnVisszakapasClick(Sender: TObject);
var i, j, NapokSzama, ForintPerNap: integer;
    CDNeve, temp: string;
    Cfg: TIniFile;
    TempDate: TDate;
    tmp: string;
    KolcsonkeroNeve, KolcsonkeroCime: string;
    Ev,Honap,Nap: word;
    HanyNapotKesett, KesesiDijPerNap, KesesiDij: integer;
    Neved,Cimed: string;
//    SzamlaKep: TBitmap;
//    Negyzet: TRect;
    Lamda: double;
begin
 if lstKolcsonadottCDk.ItemIndex >= 0 then
  CDNeve := lstKolcsonadottCDk.Items[lstKolcsonadottCDk.ItemIndex]
 else
  begin
   Application.MessageBox('Ki kell v�lasztani, hogy melyik CDt kaptad vissza!','CD-nyilv�ntart�',mb_Ok + mb_IconExclamation);
   Exit;
  end;

 lstKolcsonadottCDk.Enabled := false;
 txtKolcsonkero.Enabled := false;
 txtKolcsonadasDatuma.Enabled := false;
 btnVisszakapas.Enabled := false;
 btnBezaras.Enabled := false;

 j := CDNyDataFile_CDk1.IndexOfItem(CDNeve);
 CDNyDataFile_CDk1.SetBorrower(j,false,Now,'');

 Cfg := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'CDNyilvantarto.ini');
 NapokSzama := Cfg.ReadInteger('TurelmiIdo','Napok',30);
 ForintPerNap := Cfg.ReadInteger('TurelmiIdo','ForintPerNap',5);
 Cfg.Free;
 TempDate := CDNyDataFile_CDk1.GetIndex(j).KolcsonkeresDatuma;
 TempDate := int(TempDate + NapokSzama);
// ADOTable1.Close;
 if TempDate <= Now then
 begin
  CDNeve := CDNyDataFile_CDk1.GetIndex(j).CDNeve;
  temp := 'A ''' + CDNeve + ''' CD ' + IntToStr(NapokSzama);
  KolcsonkeroNeve := CDNyDataFile_CDk1.GetIndex(j).Kolcsonkero;
  temp := temp + ' napn�l tov�bb volt ' + NalNel(KolcsonkeroNeve) + ' ';
  temp := temp + '(' + IntToStr(trunc(Now - TempDate)) + ' nappal = ' + IntToStr(trunc(Now - TempDate) * ForintPerNap) + ' forint).';
  HanyNapotKesett := trunc(Now - TempDate);
  Application.MessageBox(PChar(temp),'K�s�s',mb_Ok + mb_IconInformation);

  temp := 'Akarsz ''sz�ml�t'' nyomtatni?';
  i := Application.MessageBox(PChar(temp),'K�rd�s',mb_YesNo + mb_IconQuestion);
  if i = id_Yes then
  begin
//   if FileExists(ExtractFilePath(ParamStr(0)) + 'szamla.bmp') then
//   begin
    Cfg := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'CDNyilvantarto.ini');
    if trim(Cfg.ReadString('Szamla','Neved','')) = '' then
    begin
     Application.MessageBox('K�rlek, el�bb add meg a neved a Be�ll�t�sok ablak(F8)'#13#10'Sz�mla f�l�n!','CD-Nyilv�ntart�',mb_Ok + mb_IconWarning);
     Abort;
    end;
    Neved := Cfg.ReadString('Szamla','Neved','');
    if trim(Cfg.ReadString('Szamla','Cimed','')) = '' then
    begin
     Application.MessageBox('K�rlek, el�bb add meg a c�med a Be�ll�t�sok ablak(F8)'#13#10'Sz�mla f�l�n!','CD-Nyilv�ntart�',mb_Ok + mb_IconWarning);
     Abort;
    end;
    Cimed := Cfg.ReadString('Szamla','Cimed','');
    Cfg.Free;
//    SzamlaKep := TBitmap.Create;
//    SzamlaKep.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'szamla.bmp');
    KesesiDijPerNap := ForintPerNap;
    KesesiDij := KesesiDijPerNap * HanyNapotKesett;
//    Image1.Picture.Bitmap.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'szamla.bmp');
    frmToltes.Label1.Caption := 'K�lcs�nk�r�k bet�lt�se';
    frmToltes.Show;
    CDNyDataFile_Kolcsonkerok1.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\Data\Kolcsonkerok.cdny',frmToltes.Gauge1);
    frmToltes.Hide;
    for j := 1 to CDNyDataFile_Kolcsonkerok1.Count do
     if CDNyDataFile_Kolcsonkerok1.GetIndex(j).Nev = KolcsonkeroNeve then
      KolcsonkeroCime := CDNyDataFile_Kolcsonkerok1.GetIndex(j).Cim;
//    with Image1.Picture.Bitmap.Canvas do
    Printer.BeginDoc;
    with Printer.Canvas do
    begin
     Font.Name := 'Arial';
     Font.Size := 12;
//     Draw(0,0,SzamlaKep);
//     Negyzet.Left := 0;
//     Negyzet.Top := 0;
//     Negyzet.Right := Printer.PageWidth;
     Lamda := Printer.PageWidth / 595;  //SzamlaKep.Width;
//     Negyzet.Bottom := trunc(Lamda * SzamlaKep.Height);
//     StretchDraw(Negyzet,SzamlaKep);
 Printer.Canvas.Pen.Style := psSolid;
 Printer.Canvas.Pen.Color := clBlack;
 Printer.Canvas.Brush.Style := bsSolid;
 Printer.Canvas.MoveTo(trunc(Lamda*3),trunc(Lamda*93));       //bal f�l�l
 Printer.Canvas.LineTo(trunc(Lamda*592),trunc(Lamda*93));     //jobb f�l�l
 Printer.Canvas.LineTo(trunc(Lamda*592),trunc(Lamda*301));    //jobb lent
 Printer.Canvas.LineTo(trunc(Lamda*3),trunc(Lamda*301));      //bal lent
 Printer.Canvas.LineTo(trunc(Lamda*3),trunc(Lamda*93));	      //bal fent
 Printer.Canvas.MoveTo(trunc(Lamda*3),trunc(Lamda*220));      //1.vsz. cs�k bal
 Printer.Canvas.LineTo(trunc(Lamda*592),trunc(Lamda*220));    //1.vsz. cs�k jobb
 Printer.Canvas.MoveTo(trunc(Lamda*3),trunc(Lamda*244));      //2.vsz. cs�k bal
 Printer.Canvas.LineTo(trunc(Lamda*592),trunc(Lamda*244));    //2.vsz. cs�k jobb
 Printer.Canvas.MoveTo(trunc(Lamda*3),trunc(Lamda*276));      //3.vsz. cs�k bal
 Printer.Canvas.LineTo(trunc(Lamda*592),trunc(Lamda*276));    //3.vsz. cs�k jobb
 Printer.Canvas.MoveTo(trunc(Lamda*260),trunc(Lamda*93));     //1.f�gg. cs�k fenn
 Printer.Canvas.LineTo(trunc(Lamda*260),trunc(Lamda*276));    //1.f�gg. cs�k lenn
 Printer.Canvas.MoveTo(trunc(Lamda*352),trunc(Lamda*220));    //2.f�gg. cs�k fenn
 Printer.Canvas.LineTo(trunc(Lamda*352),trunc(Lamda*276));    //2.f�gg. cs�k lenn
 Printer.Canvas.MoveTo(trunc(Lamda*482),trunc(Lamda*220));    //3.f�gg. cs�k fenn
 Printer.Canvas.LineTo(trunc(Lamda*482),trunc(Lamda*301));    //3.f�gg. cs�k lenn
 Printer.Canvas.MoveTo(trunc(Lamda*260),trunc(Lamda*174));    //"A sz�mla kelte" f�l�tti cs�k bal
 Printer.Canvas.LineTo(trunc(Lamda*592),trunc(Lamda*174));    // - || - jobb
 Printer.Canvas.Font.Color := clBlack;
 Printer.Canvas.Font.Style := [fsBold];
 Printer.Canvas.Font.Size := 8;
 Printer.Canvas.TextOut(trunc(Lamda*214),trunc(Lamda*8),'Ez a sz�mla a CD-Nyilv�ntart�val k�sz�lt');
// Printer.Canvas.TextOut(225,23,'Hivatalos igazol�sra nem haszn�lhat�');
 Printer.Canvas.Font.Style := [fsBold,fsItalic];
 Printer.Canvas.Font.Size := 36;
 Printer.Canvas.TextOut(trunc(Lamda*233),trunc(Lamda*48),'Sz�mla');
 Printer.Canvas.Font.Style := [fsBold];
 Printer.Canvas.Font.Size := 14;
 Printer.Canvas.TextOut(trunc(Lamda*8),trunc(Lamda*95),'A sz�mlakibocs�t� neve, c�me:');
 Printer.Canvas.TextOut(trunc(Lamda*270),trunc(Lamda*95),'A vev� neve, c�me:');
 Printer.Canvas.TextOut(trunc(Lamda*10),trunc(Lamda*221),'CD neve');
 Printer.Canvas.TextOut(trunc(Lamda*9),trunc(Lamda*278),'A sz�mla fizetend� v�g�sszege:');
 Printer.Canvas.TextOut(trunc(Lamda*264),trunc(Lamda*221),'K�s�s');
 Printer.Canvas.TextOut(trunc(Lamda*355),trunc(Lamda*221),'K�s�si d�j/nap');
 Printer.Canvas.TextOut(trunc(Lamda*486),trunc(Lamda*221),'K�s�si D�j');
 Printer.Canvas.Font.Size := 10;
 Printer.Canvas.TextOut(trunc(Lamda*186),trunc(Lamda*201),'Al��r�sa');
 Printer.Canvas.Pen.Style := psDot;
 Printer.Canvas.MoveTo(trunc(Lamda*178),trunc(Lamda*202));
 Printer.Canvas.LineTo(trunc(Lamda*232),trunc(Lamda*202));

 Printer.Canvas.Font.Style := [];
 Printer.Canvas.Font.Size := 12;

     TextOut(trunc(20*Lamda),trunc(128*Lamda),Neved);
     TextOut(trunc(20*Lamda),trunc(157*Lamda),Cimed);
     TextOut(trunc(276*Lamda),trunc(116*Lamda),KolcsonkeroNeve);
     TextOut(trunc(276*Lamda),trunc(145*Lamda),KolcsonkeroCime);
     DecodeDate(Now,Ev,Honap,Nap);
     tmp := IntToStr(Ev) + '.';
     if Length(IntToStr(Honap)) = 1 then
      tmp := tmp + '0' + IntToStr(Honap) + '.'
     else
      temp := temp + IntToStr(Honap) + '.';
     if Length(IntToStr(Nap)) = 1 then
      tmp := tmp + '0' + IntToStr(Nap) + '.'
     else
      tmp := tmp + IntToStr(Nap) + '.';
     TextOut(trunc(276*Lamda),trunc(198*Lamda),tmp);
     while TextWidth(CDNeve) > trunc(Lamda*249) do
     begin
      Delete(CDNeve,Length(CDNeve) - 4,Length(CDNeve));
      CDNeve := CDNeve + '...';
     end;
     TextOut(trunc(8*Lamda),trunc(258*Lamda),CDNeve);
     TextOut(trunc(264*Lamda),trunc(258*Lamda),IntToStr(HanyNapotKesett) + ' nap');
     TextOut(trunc(358*Lamda),trunc(258*Lamda),IntToStr(KesesiDijPerNap) + ' Ft.');
     TextOut(trunc(485*Lamda),trunc(258*Lamda),IntToStr(KesesiDij) + ' Ft.');
     Font.Style := Font.Style + [fsBold];
     TextOut(trunc(485*Lamda),trunc(280*Lamda),IntToStr(KesesiDij) + ' Ft.');
     Font.Style := Font.Style - [fsBold];
//     Image1.Picture.Bitmap.SaveToFile(ExtractFilePath(ParamStr(0)) + 'szamla1.bmp');
{     Printer.BeginDoc;
     Printer.Canvas.Assign(Image1.Canvas);
     Printer.EndDoc;}
    end;
    Printer.EndDoc;
//   end
//   else
//    Application.MessageBox('A ''sz�mla'' nyomtat�sa nem lehets�ges,'#13#10'hi�nyzik a ''szamla.bmp'' file.','Hiba',mb_Ok + mb_IconAsterisk);
  end;
 end;

// Application.MessageBox('K�sz.','CD-nyilv�ntart�',mb_Ok + mb_IconInformation);

 lstKolcsonadottCDk.Items.Delete(lstKolcsonadottCDk.Items.IndexOf(CDNeve));

 lstKolcsonadottCDk.Enabled := true;
 txtKolcsonkero.Enabled := true;
 txtKolcsonadasDatuma.Enabled := true;
 btnVisszakapas.Enabled := true;
 btnBezaras.Enabled := true;
end;

procedure TfrmCDVisszakapasa.lstKolcsonadottCDkClick(Sender: TObject);
var CDNeve: string;
    i, j: integer;
    Hatarido: integer;
    Cfg: TIniFile;
begin
 CDNeve := lstKolcsonadottCDk.Items[lstKolcsonadottCDk.ItemIndex];

 j := CDNyDataFile_CDk1.IndexOfItem(CDNeve);

 txtKolcsonkero.Text := CDNyDataFile_CDk1.GetIndex(j).Kolcsonkero;
 txtKolcsonadasDatuma.Text := DateToStr(CDNyDataFile_CDk1.GetIndex(j).KolcsonkeresDatuma);
 txtHanyNapjaVanNala.Text := IntToStr(trunc(Now)-trunc(CDNyDataFile_CDk1.GetIndex(j).KolcsonkeresDatuma));
 Cfg := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'CDNyilvantarto.ini');
 Hatarido := Cfg.ReadInteger('TurelmiIdo','Napok',30);
 i := Cfg.ReadInteger('TurelmiIdo','ForintPerNap',5);
 if StrToInt(txtHanyNapjaVanNala.Text) > 30 then
  txtKesesiDij.Text := IntToStr((StrToInt(txtHanyNapjaVanNala.Text)-Hatarido)*i) + ' Ft'
 else
  txtKesesiDij.Text := '0 Ft';
 Cfg.Free;
end;

function TfrmCDVisszakapasa.NalNel(Kinel: string): string;
var temp: string;
    i: integer;
begin
 temp := 'n�l';
 for i := 1 to Length(Kinel) do
  if Kinel[i] in ['a','A','�','�','o','O','�','�','u','U'] then
   temp := 'n�l';
 Result := Kinel + temp;
end;

procedure TfrmCDVisszakapasa.LoadData;
var i: integer;
begin
 frmToltes.Label1.Caption := 'CDk bet�lt�se';
 frmToltes.Show;
 Sleep(5);
 CDNyDataFile_CDk1.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\Data\CDk.cdny',frmToltes.Gauge1);
 Sleep(5);
 frmToltes.Label1.Caption := 'K�lcs�nadott CDk szalakt�l�sa';
 frmToltes.Gauge1.Progress := 0;
 frmToltes.Gauge1.MaxValue := CDNyDataFile_CDk1.Count;
 lstKolcsonadottCDk.Items.Clear;
 Sleep(5);
 for i := 1 to CDNyDataFile_CDk1.Count do
 begin
  if CDNyDataFile_CDk1.GetIndex(i).KolcsonVanEKerve then
   lstKolcsonadottCDk.Items.Add(CDNyDataFile_CDk1.GetIndex(i).CDNeve);
  frmToltes.Gauge1.Progress := i; 
 end;
 Sleep(5);
 frmToltes.Hide;
end;

end.
