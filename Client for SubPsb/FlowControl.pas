//****************************************************************************
//        Engineering Project Management Infomation System
//                 For Minhang Power Supply Bureau
//        Turn in the project or Record to the next flow node
//        under predefined flowdirection
//                 Author: Tuzz    2001/10
//    Copyright (c) 2001-? Shanghai Dawning Software Corporation
//****************************************************************************
unit FlowControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, dm, ExtCtrls,pubvar, Buttons;


type
  TFrm_FlowControl = class(TForm)
    Panel1: TPanel;
    btnok: TButton;
    btncancel: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Bevel1: TBevel;
    Label1: TLabel;
    lb_direction: TListBox;
    Button3: TButton;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Bevel2: TBevel;
    lb_employee: TListBox;
    Button7: TButton;
    Button8: TButton;
    TabSheet3: TTabSheet;
    Bevel3: TBevel;
    Label3: TLabel;
    Button5: TButton;
    Button6: TButton;
    rg_yxj: TRadioGroup;
    lb_executor: TListBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button3Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure btnokClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    Frecordid:string;
    Fcurrentnode:string;
    Fdesnodelist:Tstringlist;

    procedure  Getexecutor();
    { Private declarations }
  public
    IsSelf:Boolean;
    procedure  Getdirection(const currentnode:string);
    constructor Create(Aowner:TComponent;RecorID,CurrentNode:string); reintroduce; overload;

  end;

var
  Frm_FlowControl: TFrm_FlowControl;

implementation

uses MAIN, newitem;

{$R *.dfm}

procedure TFrm_FlowControl.Button3Click(Sender: TObject);
var I:integer;
    cSql:string;
begin
  if lb_direction.ItemIndex<0 then
  begin
    showmessage('请选择流向');
    exit;
  end else Getexecutor;

  PageControl1.ActivePageIndex:=PageControl1.ActivePageIndex+1;
end;

procedure TFrm_FlowControl.Button8Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=PageControl1.ActivePageIndex+1;
end;

procedure TFrm_FlowControl.Button7Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=PageControl1.ActivePageIndex-1;
end;

procedure TFrm_FlowControl.Button5Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=PageControl1.ActivePageIndex-1;
end;

procedure TFrm_FlowControl.Button6Click(Sender: TObject);
begin
//  close;
end;

procedure TFrm_FlowControl.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) and (not(ActiveControl is TRichEdit)
      or not(ActiveControl is TMemo)) then
    SelectNext(ActiveControl,True,True);
end;



procedure TFrm_FlowControl.Getdirection(const currentnode: string);
var csql:string;
begin
 csql:='select * from flowdirection where sourcetask='''+currentnode+'''';
 qrywork(dm_epm.adoqry_pub,csql);
 Fdesnodelist:=Tstringlist.Create;
 with dm_epm.adoqry_pub do
 begin
   first;
   lb_direction.Items.Clear;
   while not eof do
   begin
     Fdesnodelist.Add(fieldbyname('aimtask').AsString);
     lb_direction.Items.Add(fieldbyname('diretip').AsString);
     Next;
   end;
 end;
end;
procedure TFrm_FlowControl.FormDestroy(Sender: TObject);
begin
   if Fdesnodelist<>nil then
      Fdesnodelist.Free;
end;

procedure TFrm_FlowControl.Getexecutor;
var csql:string;
begin
  csql:='select a.EMPLOYEENAME as executor from employee a,compose b where  (a.Corpcode=''1'' or a.corpcode='''+curCorpcode+''')'
         +' and a.JOBCODE=b.JOBCODE and b.Rolid=(select rolid from tasknode where '
         +'taskcode='''+Fdesnodelist[lb_direction.ItemIndex]+''')';
  qrywork(dm_epm.adoqry_pub,csql);
  lb_employee.Items.Clear;
  with dm_epm.adoqry_pub do
  begin
    first;
    while not eof do
    begin
     lb_employee.Items.Add(fieldbyname('executor').AsString);
     Next;
    end;  
  end;
end;

procedure TFrm_FlowControl.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if pagecontrol1.ActivePageIndex=0 then
  if lb_direction.ItemIndex<0 then
  begin
      showmessage('请选择流向');
      AllowChange:=false;
  end;
end;

procedure TFrm_FlowControl.btnokClick(Sender: TObject);
var desnode:string; executors:TstringList;
    I:Integer;
begin
  if (lb_direction.ItemIndex<0) or (lb_executor.Items.Count<=0) then
  begin
    showmessage('请检查流向和执行人是否选择');
    exit;
  end;
  if MessageBox(self.Handle,'请您确认项目的流向和下一个任务节点的执行人是否正确?','Easy Project'
                                ,MB_YESNO+MB_ICONINFORMATION)=IdYes then
  begin
    desnode:=Fdesnodelist[lb_direction.itemindex];
    executors:=Tstringlist.Create;
    executors.AddStrings(lb_executor.Items);
    if SetTaskNode(Frecordid,Desnode,FcurrentNode,executors) then
    dm_epm.setflowlog(Frecordid,Fcurrentnode,lb_direction.Items[lb_direction.itemindex],
                 desnode,loginuser,executors);
    IsSelf:=False;
    for I:=0 to Executors.Count-1 do
    if Executors.Strings[I]=LoginUser then
    begin
      IsSelf:=true;
      Break;
    end;
    executors.Free;
    self.ModalResult:=mrok;
  end;
end;

procedure TFrm_FlowControl.PageControl1Change(Sender: TObject);
begin
  if pagecontrol1.ActivePageIndex=1 then
     Getexecutor;
end;



constructor TFrm_FlowControl.Create(Aowner: TComponent;RecorID,CurrentNode:string);
begin
  Fcurrentnode:=CurrentNode;
  FRecordid:= RecorID;
  inherited Create(AOwner);
end;

procedure TFrm_FlowControl.SpeedButton1Click(Sender: TObject);
begin
  if lb_employee.ItemIndex<>-1 then
  begin
    lb_executor.Items.Add(lb_employee.Items[lb_employee.itemIndex]);
    lb_employee.DeleteSelected;
  end;
end;

procedure TFrm_FlowControl.SpeedButton2Click(Sender: TObject);
begin
  if lb_executor.ItemIndex<>-1 then
  begin
    lb_employee.Items.Add(lb_executor.Items[lb_executor.itemIndex]);
    lb_executor.DeleteSelected;
  end;
end;

end.
