unit GetClendar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TFrm_GetClendar = class(TForm)
    MonthCalendar1: TMonthCalendar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_GetClendar: TFrm_GetClendar;

implementation

{$R *.dfm}

procedure TFrm_GetClendar.FormShow(Sender: TObject);
begin
  MonthCalendar1.Date:= date;
end;

end.
