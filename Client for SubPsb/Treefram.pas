//****************************************************************************
//��Ŀ����:  ���й��繫˾����繤����Ϣ����ϵͳ
//�ͻ�����:  �Ϻ�������˾���й���ֹ�˾
// Author: ���ڱ�    2001/10
//    Copyright (c) 2001-? Shanghai Dawning Software Corporation
//****************************************************************************

unit TreeFram;
{***************************************************************************
 ��Ԫ˵��:    ���ݵ�����
 ��    ��:   ��UI�㣬Ϊϵͳ�ṩҵ������ �������ʽ����֯�͵���
 ��    ��:   2001-12-12
 ��    ��:   ���ڱ�
******************************************************************************}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Buttons, StdCtrls, ImgList,DB;

 //The message used to close left panel tree
const  Wm_closeleft=Wm_user+2;


type
  TFram_Tree = class(TFrame)
    Panel2: TPanel;
    Trvwdefaut: TTreeView;
    Panel3: TPanel;
    LBLPRJ: TLabel;
    Panel1: TPanel;
    spbtnclose: TSpeedButton;
    Imglst_tree: TImageList;
    procedure spbtncloseClick(Sender: TObject);
    procedure TrvwdefautGetSelectedIndex(Sender: TObject; Node: TTreeNode);
  private

    { Private declarations }
  public

    { Public declarations }
  end;

  { Global Functions }

     //�������ڵ�
  function  TreeAddItem(Sender: TTreeView; ItemList: TStrings;Rootnode:TTreeNode;
                    data: Pointer; Resort: Boolean;Imgindex:integer=-1): TTreeNode;
      //���ָ�������ڵ�
  function  TreeGetItem(Sender: TTreeView; ItemList: TStrings): TTreeNode;
      //ɾ�����ڵ�
  procedure TreeDeleteItem(Sender: TTreeView; ItemList: TStrings; Level: Integer);
      //����ָ�������ڵ�
  function  TreeFindItem(Sender: TTreeView; NodeItem: TTreeNode; Name: String): TTreeNode;
  {Add Listview Items from a openning dataset}
     //�����б���
  function  AddItems(sender:Tlistview; Captions:TStringList;RecordType:integer=-1):Tlistitem;
     //�����б��б���


implementation

{$R *.DFM}





procedure TFram_Tree.spbtncloseClick(Sender: TObject); //���͹ر�����ͼ��Ϣ
begin
  PostMessage(self.Parent.Handle,Wm_closeleft,0,self.Tag);
end;

//******************************************************************************
//   ��������: ����TreeView �ĸ����ڵ�,
//   �������:  Sender:Ŀ��treeview,ItemList : �������ڵ㼶������Ľڵ�����ַ�������
//              RootNode: ���ڵ�; Data:���ڵ��Ӧ��ָ���������ͣ�
//              ImagIndex : �ڵ��ͼ������
//   ��   ��:  ���� TreeNode ����
//   �㷨˵��:  �����繫˾�����ţ�С�� �����ķּ���ʾ���𼶲������еĽڵ㣬�ҵ��Լ��Ĳ���λ��
//              ����strings���Զ��г̲�Ρ�

//******************************************************************************
function TreeAddItem(Sender: TTreeView; ItemList: TStrings;Rootnode:TTreeNode;
                     data: pointer; Resort: Boolean;Imgindex:integer=-1): TTreeNode;
var
   ThisNode, Node: TTreeNode;
   I: Integer;
begin
  Node:=Rootnode;
  Node.Data := nil;
  for I := 0 to Itemlist.count -1 do
  begin
    ThisNode := TreeFindItem(Sender, node, Itemlist[i]);
    if ThisNode <> nil then Node := ThisNode else
    begin
      if I < Itemlist.count -1 then
      begin
         if I = 0 then Node := Sender.items.Addchild(Node, Itemlist[i])
         else Node := Sender.items.AddChild(Node, Itemlist[i]);
      end else
      begin
         if I = 0 then
         Node := Sender.items.AddChildObject(Node, Itemlist[i], Data)
         else Node := Sender.items.AddChildObject(Node, Itemlist[i], Data);
      end;
      Node.ImageIndex := Imgindex;
      if Resort and (Node.parent <> nil) then Node.parent.alphasort;
   end;
 end;
 Result := Node;
end;

//******************************************************************************
//   ��������: ���ݽڵ����ƣ�����ָ�����ڵ���һ���ڵ��е�ͬ���ڵ�
//   �������:  Sender:Ŀ��treeview,
//              NodeItem: ����ָ���Ľڵ㣬���ҷ�Χ�������¼��ڵ㼯��
//              Name : �ڵ�����
//   ��   ��:  ���� �ҵ���TreeNode �������û���ҵ��򷵻�Nil
//   �㷨˵��:

//******************************************************************************
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

function TreeGetItem(Sender: TTreeView; ItemList: TStrings): TTreeNode;
begin
  Result := TreeAddItem(Sender, Itemlist,nil, nil, false);
end;

//******************************************************************************
//   ���̹���: ɾ�����еĽڵ�
//   �������:  Sender:Ŀ��treeview,
//              ItemList: ��ɾ���ڵ��Ӧ�� ���������ַ������繫˾�����š�С��ṹ
//                         �У�Ҷ�ӽڵ��Ӧ���ַ����ṹ
//              level:Ҫɾ���Ľڵ�Ĳ�Σ�
//   �㷨˵��:

//******************************************************************************
procedure TreeDeleteItem(Sender: TTreeView; ItemList: TStrings; Level: Integer);
var
   Node, Parent: TTreeNode;
begin
  Node := TreeGetItem(Sender, ItemList);
  while Node.level >= Level do
  begin
     Parent := Node.parent;
     Node.delete;
     if (Parent = nil) or (Parent.hasChildren) then break;
     Node := Parent;
  end;
end;

procedure TFram_Tree.TrvwdefautGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
   Node.SelectedIndex:=Node.ImageIndex;
end;




function  AddItems(sender:Tlistview; Captions:TStringList;RecordType:integer=-1):TlistItem;
var
    I:Byte;
    NewItems:TListItem;
begin
   with sender do
   begin
     NewItems := Items.Add;
     NewItems.ImageIndex:= RecordType;
     NewItems.Caption := Captions[0];
     for I:=1 to Captions.Count-1 do
     begin
       NewItems.SubItems.Add(Captions[I]);
       //if I=1 then NewItems.SubItemImages[0]:=3;
     end;
   end;
   Result := NewItems;
end;

end.
