unit FlowTrace;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls,dm,pubvar;

type
  TFram_FlowTrace = class(TFrame)
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Panel2: TPanel;
    StaticText1: TStaticText;
    DBGrid1: TDBGrid;
    ADOQry_node: TADOQuery;
    ADOQry_nodeXMDM: TStringField;
    ADOQry_nodeNODECODE: TStringField;
    ADOQry_nodeNODENAME: TStringField;
    ADOQry_nodeEXECUTOR: TStringField;
    ADOQry_nodeNODESTART: TDateTimeField;
    ADOQry_nodeNODEEND: TDateTimeField;
    ADOQry_nodeACTIVEFLAG: TStringField;
    Ds_node: TDataSource;
    procedure ADOQry_nodeACTIVEFLAGGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ADOQry_nodeNODEENDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
     procedure GetFlowTrace(const prjcode:string);
     Procedure ExporttoMsproject;
  end;

implementation

{$R *.dfm}

{ TFram_FlowTrace }

procedure TFram_FlowTrace.ExporttoMsproject;
var app:olevariant;
    I,J:integer;
    flag:boolean;
begin
  screen.Cursor := crHourGlass;
  {try
   app:=CreateOleObject('msproject.application');
   app.projects.add(false);
   //ADOQry_nodeplan.DisableControls;
   try
  //   with ADOQry_nodeplan do
     begin
      // first;
       flag:=false;
    //   for I:=1 to Recordcount  do
       begin
         app.ActiveProject.Tasks.Add(fieldbyname('taskname').asstring);
         app.ActiveProject.Tasks[I].Start:=
             fieldbyname('planstart').AsDateTime;
         app.ActiveProject.Tasks[I].baselineStart:=
                   fieldbyname('planstart').AsDateTime;
         app.ActiveProject.Tasks[I].finish:=
             fieldbyname('planend').AsDateTime;
         app.ActiveProject.Tasks[I].baselinefinish:=
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
        // ADOQry_nodeplan.Next;
       end;
     end;
   finally
       // ADOQry_nodeplan.EnableControls;
   end;
   with ADOQry_node do
   begin
     ADOQry_node.First;
     for J:=1 to Recordcount  do
     begin
       if not fieldbyname('NODEstart').IsNull then
       begin
         showmessage(inttostr(App.Activeproject.Tasks[I].OutlineLevel));
         app.ActiveProject.Tasks[I].ActualStart:=
             formatdatetime('yyyy-mm-dd hh',fieldbyname('nodestart').AsDateTime);
         if not fieldbyname('nodeend').IsNull then
         app.ActiveProject.Tasks[I].Actualfinish:=
             formatdatetime('yyyy-mm-dd hh',fieldbyname('nodeend').AsDateTime)
         else break;
       end;
       ADOQry_node.Next;
     end;
     app.visible:=true;
   end;
  finally
    screen.Cursor := crDefault;
  end; }

end;

procedure TFram_FlowTrace.GetFlowTrace(const prjcode: string);
var csql,ctemp:string;
begin
  if copy(Prjcode,1,1)='P' then
  begin
    csql:='select SOUCECODE from projectinfo where prjcode= '''+Prjcode+'''';
    qrywork(dm_epm.adoqry_pub,csql);
    CTEMP:= dm_epm.adoqry_pub.fieldbyname('soucecode').AsString;
    csql:='select * from flownodeinfo where XMDM='''+Prjcode+''''
      +' or XMDM='''+CTEMP+''' order by nodestart';
  end else
  csql:='select * from flownodeinfo where XMDM='''+Prjcode+''' order by nodestart';
  qrywork(ADOQry_node,csql);
end;

procedure TFram_FlowTrace.ADOQry_nodeACTIVEFLAGGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 if Tfield(sender).AsString='1' then
     text:='当前节点'
  else text:='已完成';
  DisplayText:=true;
end;

procedure TFram_FlowTrace.ADOQry_nodeNODEENDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if sender.AsString='1900-01-01' then
     text:=''
  else
  text:=sender.AsString;

  DisplayText:= true;
end;

end.
