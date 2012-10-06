unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TfrmEmailBForm = class(TForm)
    txtServer: TEdit;
    txtUserID: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmailBForm: TfrmEmailBForm;

implementation

{$R *.DFM}

procedure TfrmEmailBForm.FormCreate(Sender: TObject);
var hSysMenu, nCnt: longint;
begin
//az 'X' gomb kikapcsol�sa
 hSysMenu := GetSystemMenu(frmEmailBForm.Handle,false); //a rendszermen� lek�rdez�se
 if hSysMenu <> 0 then //ha van, akkor
 begin
  nCnt := GetMenuItemCount(hSysMenu); //h�ny eleme van,
  if nCnt <> 0 then //ha van eleme, akkor
  begin
   RemoveMenu(hSysMenu,nCnt - 1,mf_ByPosition + mf_Remove); //leszedj�k a Bez�r�st, ezzel a gombor is kikapcsoljuk,
   RemoveMenu(hSysMenu,nCnt - 2,mf_ByPosition + mf_Remove); //de el�tte van egy elv�laszt� is
   DrawMenuBar(frmEmailBForm.Handle); //er�ltetj�k az �jrarajzol�st, ezzel l�tszik is a m�v�nk.
  end;
 end;
//k�sz

end;

end.
