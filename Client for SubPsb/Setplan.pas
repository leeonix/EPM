unit Setplan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ComCtrls;

type
  TFrm_SetPlan = class(TForm)
    edt_nodename: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    dtp_start: TDateTimePicker;
    dtp_end: TDateTimePicker;
    Label4: TLabel;
    SpinEdit1: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure dtp_startChange(Sender: TObject);
  private
    { Private declarations }
  public
    //procedure Inivalue();
    { Public declarations }
  end;

var
  Frm_SetPlan: TFrm_SetPlan;

implementation



{$R *.dfm}

procedure TFrm_SetPlan.FormCreate(Sender: TObject);
begin
  //edt_nodename.Text:=frm_node.ADOQry_nodeplantaskname.Text;
  //dtp_start.Datetime:=frm_node.ADOQry_nodeplanPLANSTART.Value;
  //dtp_end.Datetime:=frm_node.ADOQry_nodeplanPLANend.Value;
 // SpinEdit1.Value:= round(dtp_end.Date-dtp_start.Date);

end;

procedure TFrm_SetPlan.SpinEdit1Change(Sender: TObject);
begin
   dtp_end.DateTime:=dtp_start.DateTime+SpinEdit1.Value;
end;

procedure TFrm_SetPlan.dtp_startChange(Sender: TObject);
begin
  dtp_end.DateTime:=dtp_start.DateTime+SpinEdit1.Value;
end;

end.
