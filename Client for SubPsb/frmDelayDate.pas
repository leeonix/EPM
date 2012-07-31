unit frmDelayDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, Mask, RzEdit, RzButton;

type
  Tfrm_DateRange = class(TForm)
    startdate: TRzDateTimeEdit;
    enddate: TRzDateTimeEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_DateRange: Tfrm_DateRange;

implementation

{$R *.dfm}

end.
