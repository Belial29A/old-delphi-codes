unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure HotKey(var Msg: TMessage);message wm_HotKey;
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  id_F12: integer;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
 id_F12 := GlobalAddAtom('jelszomutatas');
 RegisterHotkey(Handle,id_F12,mod_Control,vk_F12);
end;

procedure TForm1.HotKey(var Msg: TMessage);
var Pt: TPoint;
    h: HWND;
begin
{ if Msg.LParamHi <> vk_F12 then
  Abort;}

 GetCursorPos(Pt);

 h := WindowFromPoint(Pt);

 SendMessage(h,em_SetPasswordChar,0,0);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
 UnRegisterHotkey(Handle,id_F12);
end;

procedure TForm1.Button1Click(Sender: TObject);
var Pt: TPoint;
    h: hwnd;
    x,y: integer;
begin
 for x := 1 to Screen.Width do
  for y := 1 to Screen.Height do
  begin
   Pt.x := x;
   Pt.y := y;
   label1.Caption := inttostr(x)+','+inttostr(y);
   application.ProcessMessages;
   h := WindowFromPoint(Pt);
   SendMessage(h,em_SetPasswordChar,0,0);
//   SendMessage(h,WM_
  end;

  label1.Caption := 'k�sz';
end;

procedure TForm1.Button2Click(Sender: TObject);
var s: string;
begin
 s := 'Szia Noa!'#13#10#13#10;
 s := s + 'A programot �gy haszn�ld:'#13#10;
 s := s + 'Rendezd �gy az ablakokat, hogy l�tsz�djon a jelsz�mez�,'#13#10;
 s := s + 'majd a programot aktiv�lva kattints a ''dolgozz'' felirat� gombra'#13#10;
 s := s + 'Ezut�n csak meg kell v�rni, am�g a program ki�rja, hogy ''k�sz'''#13#10;
 s := s + 'V�g�l kattints a jelsz�mez�be, �s l�ss csod�t :)'#13#10#13#10;
 s := s + 'Maerlyn';

 Application.MessageBox(Pchar(s),'',mb_OK);
end;

end.
