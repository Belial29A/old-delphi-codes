program Suti2;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.ShowMainForm := false;
  Application.Title := 'S�ti';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

