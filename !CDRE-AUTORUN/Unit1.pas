unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const
  Betuk: array[1..26] of string = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var i: integer;
    megvan: boolean;
begin
 MessageDlg('�dv�z�llek!'#13#10'M�solj annyi file-t, amennyit csak akarsz, de 1 k�r�sem lenne:'#13#10'A programokat ne m�dos�tsd, vagy add tov�bb a saj�t neveden!'#13#10'K�sz:'#13#10'     A CD k�sz�t�je',mtInformation,[mbOk],0);

 megvan := false;
 for i := 1 to 26 do
  if FileExists(Betuk[i] + ':\Autorun.exe') then
   if FileExists(Betuk[i] + ':\icon.ico') then
    if FileExists(Betuk[i] + ':\Autorun.inf') then
     begin
     WinExec(PChar('explorer ' + Betuk[i] + ':'),sw_ShowNormal);
     megvan := true;
     end;
 if not megvan then
   Application.MessageBox('Nem tal�lom a CDt amire ezt a prg-t �rt�k!','Hiba',mb_Ok + mb_IconHand);

 Application.Terminate;
end;

end.

