program CDNyilvantarto;

uses
  Forms,
  SysUtils,
  Windows,
  MainForm in 'MainForm.pas' {MainForm},
  Kolcsonkerok in 'Kolcsonkerok.pas' {Kolcsonkerok},
  CDk in 'CDk.pas' {CDk},
  About in 'About.pas' {About},
  CDKolcsonadasa in 'CDKolcsonadasa.pas' {CDKolcsonadasa},
  CDVisszakapasa in 'CDVisszakapasa.pas' {CDVisszakapasa},
  Beallitasok in 'Beallitasok.pas' {Beallitasok},
  Kereses in 'Kereses.pas' {Kereses};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'CD-Nyilv�ntart�';
  Application.HelpFile := 'CDNyilvantarto.hlp';

  if not FileExists(ExtractFilePath(ParamStr(0)) + '\Data\CDk.cdny') then
  begin
   Application.MessageBox('Hi�nyzik az egyik f� adatfile (CDk.cdny)!','CD-Nyilv�ntart�',mb_Ok + mb_IconAsterisk);
   Halt;
  end;
  if not FileExists(ExtractFilePath(ParamStr(0)) + '\Data\Kolcsonkerok.cdny') then
  begin
   Application.MessageBox('Hi�nyzik az egyik f� adatfile (Kolcsonkerok.cdny)!','CD-Nyilv�ntart�',mb_Ok + mb_IconAsterisk);
   Halt;
  end;

  Application.CreateForm(TfrmMainForm, frmMainForm);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.Run;
end.
