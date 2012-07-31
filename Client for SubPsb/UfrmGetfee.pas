unit UfrmGetfee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, RzSpnEdt, UGetFee, ExtCtrls, RzPanel;

type
  Tfrm_Getfee = class(TForm)
    RzPanel1: TRzPanel;
    Fram_GetFee1: TFram_GetFee;
    RzRapidFireButton1: TRzRapidFireButton;
    RzRapidFireButton2: TRzRapidFireButton;
    RzRapidFireButton3: TRzRapidFireButton;
    RzRapidFireButton4: TRzRapidFireButton;
    procedure RzRapidFireButton4Click(Sender: TObject);
  private
    Fprjcode:string;
    { Private declarations }
  public


    { Public declarations }
  end;

var
  frm_Getfee: Tfrm_Getfee;

implementation

{$R *.dfm}



procedure Tfrm_Getfee.RzRapidFireButton4Click(Sender: TObject);
var temp:String;
begin
   temp:= Fram_GetFee1.prjaccount.Text;
   Fram_GetFee1.prjaccount.Text:= '';
   Fram_GetFee1.prjaccount.Text:=temp;
end;

end.
