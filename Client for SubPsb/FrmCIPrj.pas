unit frmCIPrj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomerPrj, StdCtrls, ExtCtrls;

type
  Tfrm_Ciprj = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Fram_CustmerPrj1: TFram_CustmerPrj;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Ciprj: Tfrm_Ciprj;

implementation

{$R *.dfm}

procedure Tfrm_Ciprj.Button1Click(Sender: TObject);
begin
  Fram_CustmerPrj1.Saveinfo;
end;

end.
