
unit TaskTree;
{***************************************************************************
ģ��:  ��Ŀ���񵼺���
����:  Ϊ��½�û��ṩ��Ŀ���񵼺�����֯��ʽ���մ��졢�Ѱ졢���ϡ��ݻ�����
�汾:
����: 2001-11-12
����: tuzz
����: 2003-05-12
todo:
******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, treefram, ImgList, ComCtrls, Buttons, StdCtrls, ExtCtrls,dm,TreeListprj,
  pubvar;

const
    Wm_closeleft=Wm_user+2;//The message used to close left panel tree
    Wm_upnode=wm_user+3; //The message used to up node;

type

  TFramtree_Task = class(TFram_Tree)
     ImageList1: TImageList;
     procedure TrvwdefautChange(Sender: TObject; Node: TTreeNode);
     procedure TrvwdefautChanging(Sender: TObject; Node: TTreeNode;
                                           var AllowChange: Boolean);
     procedure TrvwdefautGetSelectedIndex(Sender: TObject; Node: TTreeNode);
     procedure FrameConstrainedResize(Sender: TObject; var MinWidth,
      MinHeight, MaxWidth, MaxHeight: Integer);
  private
    { Private declarations }
  public
     function LoadTree():boolean;
     function GetTaskNum(RootNode:TTreeNode):Integer;
    { Public declarations }
  end;

var
  Framtree_Task:TFramtree_Task;

implementation

uses  MAIN, browser, DB;



{$R *.dfm}

{ TFramtree_task }

{�����������ͻ�ȡ��Ŀ�������� }
function TFramtree_Task.GetTaskNum(RootNode:TTreeNode):Integer;
var Taskcount:Integer;
     tempNode:TtreeNode;
     I:Integer;
begin
    Taskcount := 0;
    if RootNode.HasChildren then
    begin
      tempNode := RootNode.getFirstChild;
      for I:=0 to RootNode.count-1 do
      begin
        Taskcount := Taskcount+Ptasktype(tempNode.data)^.tasknum;
        tempNode  := TempNode.getNextSibling;
      end;
    end else
    if  RootNode.Data<>nil then
    Taskcount := Ptasktype(RootNode.data)^.tasknum;
    Result := Taskcount;
end;




//******************************************************************************
//   ���̹���:  ���ص�ǰ��¼�û������񵼺����ڵ�
//   �������:
//   ��   ��:
//   �㷨˵��:

//******************************************************************************
function TFramtree_Task.LoadTree: boolean;
var
    TempNode:TtreeNode;
    I:integer;

procedure AddTaskNode(Node:TTreeNode);
var FieldLists:Tstringlist;
    MyPointer:Ptasktype;
begin
  FieldLists:= TStringList.Create;
  try
    with dm_epm.adoqry_pub do
    while not eof do
    begin
      FieldLists.Clear;
      if FieldByName('backflag').AsString='1' then
       FieldLists.Add(Node.Item[2].Text)
      else if FieldByName('finishflag').AsString='1' then
        FieldLists.Add(Node.Item[1].Text)
      else  FieldLists.Add(Node.Item[0].Text);
      FieldLists.Add(fieldbyname('Typename').AsString);
      New(MyPointer);
      MyPointer.tasknum  := fieldbyname('taskcount').AsInteger;
      MyPointer.typename := fieldbyname('prjtype').AsString;
      TreeAddItem(Trvwdefaut,FieldLists,Node,mypointer,false,4);
      Next;
    end;
  finally
     FieldLists.Free;
  end;
end;

begin
  TempNode := Trvwdefaut.TopItem;
  TempNode := TempNode.getNextSibling;
  QryWork(dm_epm.adoqry_pub,'exec GetTaskCount '''+loginuser+'''');
  if not Dm_Epm.adoqry_pub.IsEmpty then
    AddTaskNode(TempNode);
end;

{ TODO -o���ڱ� -c�ع�:�ع�event handle,�˴������¼�����̫��,�ַ���Ӧ��д�ڹ�����Դ�ļ���}
procedure TFramtree_Task.TrvwdefautChange(Sender: TObject;Node: TTreeNode);
begin
  if Node.Text = 'Easy Project' then  Frm_Main.ShowWebBrower;
  if Node.Text = '�������'     then  Frm_Main.ShowFindResult;
  if Node.Text = '������'       then  Frm_Main.ShowRecyclePrj;
  if Node.Text = '���Ϲ���'     then  Frm_Main.ShowDisUsePrj;
  if Node.Text = '�ҵ�������'   then  Frm_Main.ShowTaskOveriew(Node);
  if Node.Text = '�ݻ���'       then  Frm_Main.ShowPausePrj;
  if Node.Text = 'ί�������Ŀ' then  frm_Main.ShowWtDesign;
  if Node.Text = '������'       then  Frm_Main.ShowTaskOveriew(Node);
  if Node.Text = '�˻���'       then  Frm_Main.ShowTaskOveriew(Node) ;
  if Node.Level =  2            then  Frm_Main.ShowTaskByType;
  if Node.HasChildren           then
  begin
    frm_main.Lsv_Task.Visible := True;
    frm_main.Lsv_Task.ViewStyle := vsreport;
  end;
  frm_main.newyg.Enabled := (Node.Text='ҵ��') ;
  inherited;
end;

procedure TFramtree_Task.TrvwdefautChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
var I:integer;
begin
  if frm_main.Fram_Browser<>nil then
  frm_main.Fram_Browser.Visible:=false;
  Fram_TltBase.Visible := false;
  frm_main.Lsv_Task.Visible:=false;
  frm_main.stbmain.panels[2].Text:='';
  for I:=0 to frm_main.Pmn_Task.Items.Count-1 do
          frm_main.Pmn_Task.Items[I].Enabled:=false;
  inherited;
end;


procedure TFramtree_Task.TrvwdefautGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  if node.Level>=1 then
  Node.SelectedIndex:=5;

end;

procedure TFramtree_Task.FrameConstrainedResize(Sender: TObject;
  var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
begin
  inherited;
  MinWidth:=100;
  MaxWidth:=500;
end;

end.
