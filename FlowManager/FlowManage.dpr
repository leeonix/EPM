program FlowManage;

{%ToDo 'FlowManage.todo'}

uses
  Forms,
  Main in 'Main.pas' {frm_main},
  FlowBase in 'FlowBase.pas',
  TaskProperty in 'TaskProperty.pas' {frm_TaskProp},
  UDm in 'UDm.pas' {Dm_flow: TDataModule},
  Ufrm_flow in 'Ufrm_flow.pas' {frm_flow},
  Ufrm_Link in 'Ufrm_Link.pas' {frm_Link},
  Ufrm_Print in 'Ufrm_Print.pas' {frm_Print};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '业务流程管理';
  Application.CreateForm(TDm_flow, Dm_flow);
  Application.CreateForm(Tfrm_main, frm_main);
  Application.Run;
end.
