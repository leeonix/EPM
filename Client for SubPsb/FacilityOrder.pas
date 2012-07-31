unit FacilityOrder;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls,dm,pubvar, Grids, DBGrids, StdCtrls, Menus, DB, ADODB;

type
  TFram_Facility = class(TFrame)
    DBGrid3: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Panel2: TPanel;
    StaticText1: TStaticText;
    ADOQry_equipment: TADOQuery;
    ADOQry_equipmentsblb: TStringField;
    ADOQry_equipmentsbxh: TStringField;
    ADOQry_equipmentsbsl: TStringField;
    ADOQry_equipmentghcj: TStringField;
    ADOQry_equipmentdgrq: TDateTimeField;
    ADOQry_equipmentdhrq: TDateTimeField;
    ADOQry_equipmentxh: TBCDField;
    ds_equipment: TDataSource;
    ADOQry_equipmentprjcode: TStringField;
    procedure ADOQry_equipmentBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    projectid:string;
    procedure Init(const Prjcode:string);
    procedure AddOrderItem();
    function  DelOrderItem():Boolean;
    procedure UpdateOrderItem();
    procedure SaveOrder;
    procedure Cacacel;
    { Public declarations }
  end;

implementation

uses Prj_Design;



{$R *.dfm}

{ TFraM_PLAN }

procedure TFram_Facility.Init(const Prjcode: string);
begin
  projectid:=prjcode;
  with ADOQry_equipment do
  begin
    active:=false;
    parameters.ParamByName('mycode').Value:=prjcode;
    active:=true;
  end;
end;

procedure TFram_Facility.AddOrderItem;
begin
  with ADOQry_equipment do
  begin
    Append;

  end;
end;

function TFram_Facility.DelOrderItem: Boolean;
begin
  if application.MessageBox('您确定要删除？','警告',MB_YESNO)= IDYES then
  with ADOQry_equipment do
  begin
    delete;
  end;
end;

procedure TFram_Facility.UpdateOrderItem;
begin
  with ADOQry_equipment do
  begin
    edit;
    //fieldbyname('prjcode').AsString := projectid;
  end;
end;

procedure TFram_Facility.Cacacel;
begin
  with ADOQry_equipment do
  begin
    cancel;
  end;
end;

procedure TFram_Facility.SaveOrder;
begin
  with ADOQry_equipment do
   begin

     post;
   end;
end;

procedure TFram_Facility.ADOQry_equipmentBeforePost(DataSet: TDataSet);
begin
  DATASET.fieldbyname('prjcode').AsString := projectid;
end;

end.
