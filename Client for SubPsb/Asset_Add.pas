unit Asset_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,pubvar,dm;

type
  TFrm_AddAssets = class(TForm)
    Label1: TLabel;
    cb_type: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    edt_tbr: TEdit;
    edt_tbrq: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_AddAssets: TFrm_AddAssets;

implementation

{$R *.dfm}

procedure TFrm_AddAssets.FormCreate(Sender: TObject);
begin
  Edt_tbr.Text:=Loginuser;
  Edt_tbrq.Text:=DatetimeTostr(GetTime);
end;

end.
