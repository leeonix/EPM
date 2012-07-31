unit Ufrm_Print;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, OleCtrls,  RzButton, ExtCtrls, RzPanel;

type
  Tfrm_Print = class(TForm)
    RzToolbar1: TRzToolbar;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    ImageList1: TImageList;
    procedure RzToolButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Print: Tfrm_Print;

implementation

{$R *.dfm}

procedure Tfrm_Print.RzToolButton2Click(Sender: TObject);
begin
  {PrnFlow1.PrinterSettings :=true;
  PrnFlow1.Preview := true  ;
  PrnFlow1.PrintDoc;  }
end;

end.
