program Vagolapkezelo;

uses
  Forms,
  Windows,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2};

var Hwnd: THandle;

{$R *.RES}

begin
 Hwnd := FindWindow('TForm1',nil);
 if Hwnd=0 then
  begin
  Application.Initialize;
  Application.Title := 'V�g�lapkezel�';
  Application.ShowMainForm := False;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm1, Form1);
  Form1.Icon := Application.Icon;
  //Form2.Icon := Application.Icon;
  Application.Run;
  end
 else
  begin
  Application.MessageBox('Ebb�l a programb�l egyszerre csak egy futhat!','V�g�lapkezel�',MB_OK+MB_ICONHAND);
  Application.Terminate;
  end;
end.
