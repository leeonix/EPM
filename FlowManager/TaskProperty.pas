unit TaskProperty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzButton, RzRadChk, RzLabel, RzTabs, ExtCtrls,FlowBase,
  RzDlgBtn, RzBorder, RzCmboBx, ComCtrls, RzEdit, Mask, RzPanel, RzSplit,
  RzRadGrp, Menus;

type
  Tfrm_TaskProp = class(TForm)
    RzDialogButtons1: TRzDialogButtons;
    RzSizePanel1: TRzSizePanel;
    RzPageControl1: TRzPageControl;
    RzTabSheet1: TRzTabSheet;
    RzBorder1: TRzBorder;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel5: TRzLabel;
    RzCh_Ev: TRzCheckBox;
    Red_NodeName: TRzEdit;
    RcB_Role: TRzComboBox;
    Re_TaskTip: TRzEdit;
    RzNuE_Setdate: TRzNumericEdit;
    RzTabSheet2: TRzTabSheet;
    Rz_Red_TaskDes: TRzRichEdit;
    Trv_Nodes: TTreeView;
    RzRadioGroup1: TRzRadioGroup;
    RzLabel6: TRzLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RzBitBtn1: TRzBitBtn;
    procedure FormShow(Sender: TObject);
    procedure Trv_NodesChange(Sender: TObject; Node: TTreeNode);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RzDialogButtons1ClickCancel(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    FrolcodeList:Tstringlist;
    procedure LoadNodeTree();
    procedure SaveTask(Tasknode:string);

    { Private declarations }
  public
    FLowcode:string;
    Taskcode:string;
    TaskName:string;
    { Public declarations }
  end;
  function TreeFindItem(Sender: TTreeView; NodeItem: TTreeNode; Name: String): TTreeNode;

var
  frm_TaskProp: Tfrm_TaskProp;

implementation

uses UDm, ADODB, DB ;



{$R *.dfm}

procedure Tfrm_TaskProp.SaveTask(Tasknode:string);
var Csql:string;
begin
   Csql :='Update TaskNode set ';

   QueryWork(csql,Dm_flow.Adqry_com,false);

end;

function TreeFindItem(Sender: TTreeView; NodeItem: TTreeNode; Name: String): TTreeNode;
begin
   if NodeItem = nil then NodeItem := Sender.items.getfirstnode
   else NodeItem := NodeItem.getfirstchild;
  //NodeItem is now the first item of the desired level
  //if this level has no items, NodeItem is nil
   if (NodeItem <> nil) and (NodeItem.text <> Name) then
   repeat
         NodeItem := NodeItem.getnextsibling;
   until (NodeItem = nil) or (NodeItem.text = Name);
   Result := NodeItem;
end;

// 生成treeview,导航当前流程的各节点
procedure Tfrm_TaskProp.LoadNodeTree();
var tempNode:TtreeNode;
    tempPt:PNode;
    temSql:string;

begin
  temSql := 'select a.taskcode,a.taskname,b.taskcode as parentcode,b.taskname as parentname  '
          +'from tasknode a left join tasknode b on a.parentnode=b.taskcode '
          +' where a.flowcode='''+FLowcode+''' order by parentcode,a.taskcode';

  with Dm_flow.Adqry_com do
  begin
     SQL.Clear;
     sql.Add(temSql);
     Open;
     while not Eof do
     begin
       New(tempPt);
       tempPt.Nodecode := trim(fieldByname('Taskcode').AsString);
       tempPt.NodeName := trim(fieldByname('Taskname').AsString);
       if fieldbyname('parentcode').isnull then
       tempNode := Trv_Nodes.Items.AddChildObject(Trv_Nodes.TopItem,fieldByname('Taskname').AsString,tempPt)
       else begin
         tempNode := TreeFindItem(Trv_Nodes,Trv_Nodes.TopItem,fieldbyname('parentname').AsString) ;
         tempNode := Trv_Nodes.Items.AddChildObject(tempNode,fieldByname('Taskname').AsString,tempPt);
       end;
       if trim(fieldByname('Taskcode').AsString) = Taskcode then tempNode.Selected := true;
       Next;
     end;
  end;
end;

procedure Tfrm_TaskProp.FormShow(Sender: TObject);

begin
  LoadNodeTree;

end;

procedure Tfrm_TaskProp.Trv_NodesChange(Sender: TObject; Node: TTreeNode);
procedure  showdTaskinfo(taskcode:String);
var csql:string;
begin
   csql:='select * from tasknode where taskcode='''+taskcode+'''';
   QueryWork(csql,Dm_flow.Adqry_pub,true);
   with Dm_flow.Adqry_pub do
   begin
     Red_NodeName.Text := fieldByname('taskname').AsString;
     Re_TaskTip.Text := fieldByname('tasktip').AsString ;
     RzNuE_Setdate.IntValue := fieldByname('Setdate').AsInteger;
     RzCh_Ev.Checked := fieldByname('Iscaculated').AsString='0';
     RcB_Role.ItemIndex:=  FrolcodeList.IndexOf(fieldByname('rolid').AsString);
   end;
end;

begin
  if Node.Level =0 then exit;
  showdTaskinfo(Pnode(Node.Data).Nodecode);
  Taskcode := PNode(Trv_Nodes.Selected.Data).Nodecode; 
  TaskName := PNode(Trv_Nodes.Selected.Data).NodeName;
end;

procedure Tfrm_TaskProp.N1Click(Sender: TObject);
var tempPt:PNode;
    NewNode:TtreeNode;
function GetNewCode(Parentcode:String):string;
var csql,strtemp:string;
    tempint:string;
begin
   if Parentcode ='' then
   begin
     csql:='select max(left(Taskcode,4)) as tasknode from taskNode where flowcode='+FLowcode+'';
     QueryWork(csql,Dm_flow.Adqry_com,true);
     with Dm_flow.Adqry_com do
     begin
        strtemp :=  fieldByName('TaskNode').AsString;
        if  strtemp=''  then Result := FLowcode+'01'
        else begin
          strtemp := Copy(strtemp,3,2);
          if strtoint(strtemp)+1<10 then
            Result := FLowcode +'0'+inttostr(strtoint(strtemp)+1)
          else Result := FLowcode+ inttostr(strtoint(strtemp)+1);
        end;
     end;
   end  else
   begin
    tempint :=inttostr(Length(parentcode)+2);
    csql :='select max(rtrim(taskcode)) as taskcode from tasknode where taskcode like '''+Parentcode+'__''';
    QueryWork(csql,Dm_flow.Adqry_com,true);
    with Dm_flow.Adqry_com do
    begin
      strtemp :=  fieldByName('TaskCode').AsString;
      if length(strtemp) = Length(Parentcode) then Result :=strtemp+'01'
      else begin
         strtemp := Copy(strtemp,Length(strtemp)-1,2);
         if strtoint(strtemp)+1<10 then
           Result := Parentcode +'0'+inttostr(strtoint(strtemp)+1)
         else Result := Parentcode+ inttostr(strtoint(strtemp)+1);
      end;
    end;
   end;
end;


begin
  with Trv_Nodes do
  begin
     New(tempPt);
     if  Selected.Data=nil  then
       tempPt.Nodecode :=  GetNewCode('')
     else  tempPt.Nodecode :=  GetNewCode(Pnode(Selected.Data).Nodecode) ;
     tempPt.NodeName := '新建节点' ;
     NewNode:=Items.AddChildObject(Selected,'新建节点',tempPt);
     NewNode.Selected:=true;
  end;
end;

procedure Tfrm_TaskProp.FormCreate(Sender: TObject);
begin
  FrolcodeList:= TStringList.Create;
  RcB_Role.Items:= Dm_flow.Getrollist(FrolcodeList);
end;

procedure Tfrm_TaskProp.FormDestroy(Sender: TObject);
begin
  FrolcodeList.Free;
end;

procedure Tfrm_TaskProp.RzDialogButtons1ClickCancel(Sender: TObject);
begin
  ModalResult := mrcancel;
end;

procedure Tfrm_TaskProp.RzBitBtn1Click(Sender: TObject);
begin
  if  (trim(Red_NodeName.Text)='') or (trim(RcB_Role.Text)='') then
  begin
    ShowMessage('请输入完整信息');
    exit;
  end;
  with Dm_flow.Adqry_pub do
  begin
     if not IsEmpty then edit
     else append;
     TaskName := trim(Red_NodeName.Text);
     fieldByname('Taskcode').AsString := Taskcode;
     fieldByname('flowcode').AsString := FLowcode;
     fieldByname('Taskname').AsString := TaskName;
     fieldByname('tasktip').AsString:=trim(Re_TaskTip.Text)  ;
     fieldByname('Setdate').AsInteger:=RzNuE_Setdate.IntValue;
     FieldByName('rolid').AsString := FrolcodeList.Strings[RcB_Role.ItemIndex] ;
     if RzCh_Ev.Checked then
        fieldByname('Iscaculated').AsString :='0'
     else
        fieldByname('Iscaculated').AsString :='1' ;
     if Trv_Nodes.Selected.Parent.Level>0 then
       fieldByname('ParentNode').AsString :=PNode(Trv_Nodes.Selected.Parent.Data).Nodecode;
     Post;

     Trv_Nodes.Selected.Text:=TaskName;
     PNode(Trv_Nodes.Selected.Data).NodeName := TaskName;
  end;

end;

end.
