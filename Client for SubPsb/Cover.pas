unit cover;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, ExtCtrls, StdCtrls;

type
  TFrm_Cover = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Cover: TFrm_Cover;

implementation

{$R *.DFM}

procedure TFrm_Cover.Image1Click(Sender: TObject);
begin
  self.ModalResult:=mrok;
end;

end.
