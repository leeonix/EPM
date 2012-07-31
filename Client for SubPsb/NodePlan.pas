unit NodePlan;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DB, ADODB, Grids, DBGrids,OleCtrls,ComObj,dm,pubvar,
  Buttons;

type
  TFram_Nodeplan = class(TFrame)
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Panel2: TPanel;
    StaticText1: TStaticText;
    DBGrid2: TDBGrid;
    ADOQry_nodeplan: TADOQuery;
    ADOQry_nodeplanPLANSTART: TDateTimeField;
    ADOQry_nodeplanPLANEND: TDateTimeField;
    ADOQry_nodeplantaskname: TStringField;
    ADOQry_nodeplantasktip: TStringField;
    ADOQry_nodeplanNODECODE: TStringField;
    Ds_plan: TDataSource;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GetNodeplan(const prjcode:string);
    procedure ExportToMsProject;
    Procedure SetPlan;
    { Public declarations }
  end;

implementation

uses setplan;

{$R *.dfm}

{ TFrame1 }

procedure TFram_Nodeplan.ExportToMsProject;
var app:olevariant;
    I:integer;
    flag:boolean;
begin
  screen.Cursor := crHourGlass;
  try
    app:=CreateOleObject('msproject.application');
    app.projects.add(false);
    with ADOQry_nodeplan do
    begin
      DisableControls;
      first;
      flag:=false;
      try
        for I:=1 to Recordcount do
        begin
         app.ActiveProject.Tasks.Add(fieldbyname('taskname').asstring);
         app.ActiveProject.Tasks[I].Start:=
             fieldbyname('planstart').AsDateTime;
         app.ActiveProject.Tasks[I].finish:=
             fieldbyname('planend').AsDateTime;
         if copy(fieldbyname('NODECODE').asstring,6,1)<>'0' then
         begin
           if not flag then
           begin
              app.ActiveProject.Tasks[I].OutlineIndent;
              flag:=true;
           end;
         end else if flag then
         begin
           app.ActiveProject.Tasks[I].Outlineoutdent;
           flag:=false;
         end;
         ADOQry_nodeplan.Next;
        end;
      finally
        EnableControls;
      end;
    end;
    app.visible:=true;
  finally
    screen.Cursor := crDefault;
  end;
end;

procedure TFram_Nodeplan.GetNodeplan(const Prjcode:string);
var csql,ctemp:string;
begin
  if copy(prjcode,1,1)='P' then
  begin
    csql:='select SOUCECODE from projectinfo where prjcode= '''+prjcode+'''';
    qrywork(dm_epm.adoqry_pub,csql);
    CTEMP:= dm_epm.adoqry_pub.fieldbyname('soucecode').AsString;
    csql:='select * from Nodeplan,tasknode where nodecode=taskcode and'
             +' (XMDM='''+prjcode+''' or XMDM='''+CTEMP+''') order by nodecode';
  end else
    csql:='select * from nodeplan,tasknode where nodecode=taskcode and '
       +'xmdm='''+prjcode+'''';
  qrywork(ADOQry_nodeplan,csql);
end;

procedure TFram_Nodeplan.SetPlan;
begin
  application.CreateForm(Tfrm_setplan,frm_setplan);
  try
    if frm_setplan.ShowModal=mrok then
    begin
      with ADOQry_nodeplan do
      begin
         edit;
         fieldbyname('planstart').AsDateTime:=frm_setplan.dtp_start.DateTime;
         fieldbyname('planend').AsDateTime:=frm_setplan.dtp_end.DateTime;
         post;
      end;
    end;
  finally
    frm_setplan.Free;
  end;
end;

procedure TFram_Nodeplan.SpeedButton1Click(Sender: TObject);
begin
    ExportToMsProject;
end;

end.
