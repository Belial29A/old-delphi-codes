program Amoba;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  CliBmp in 'CliBmp.pas' {CliBmp},
  Unit2 in 'Unit2.pas' {Form2};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Putra Net�d�l�';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
