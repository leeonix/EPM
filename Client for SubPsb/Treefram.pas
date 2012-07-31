//****************************************************************************
//项目名称:  闵行供电公司供配电工程信息管理系统
//客户名称:  上海电力公司闵行供电分公司
// Author: 程哨兵    2001/10
//    Copyright (c) 2001-? Shanghai Dawning Software Corporation
//****************************************************************************

unit TreeFram;
{***************************************************************************
 单元说明:    数据导航树
 描    述:   在UI层，为系统提供业务数据 树层次形式的组织和导航
 日    期:   2001-12-12
 作    者:   程哨兵
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

     //增加树节点
  function  TreeAddItem(Sender: TTreeView; ItemList: TStrings;Rootnode:TTreeNode;
                    data: Pointer; Resort: Boolean;Imgindex:integer=-1): TTreeNode;
      //获得指定的树节点
  function  TreeGetItem(Sender: TTreeView; ItemList: TStrings): TTreeNode;
      //删除树节点
  procedure TreeDeleteItem(Sender: TTreeView; ItemList: TStrings; Level: Integer);
      //查找指定的树节点
  function  TreeFindItem(Sender: TTreeView; NodeItem: TTreeNode; Name: String): TTreeNode;
  {Add Listview Items from a openning dataset}
     //增加列表项
  function  AddItems(sender:Tlistview; Captions:TStringList;RecordType:integer=-1):Tlistitem;
     //增加列表列标题


implementation

{$R *.DFM}





procedure TFram_Tree.spbtncloseClick(Sender: TObject); //发送关闭树视图消息
begin
  PostMessage(self.Parent.Handle,Wm_closeleft,0,self.Tag);
end;

//******************************************************************************
//   函数功能: 生成TreeView 的各级节点,
//   输入参数:  Sender:目标treeview,ItemList : 按照树节点级数排序的节点标题字符串数组
//              RootNode: 根节点; Data:树节点对应的指针数据类型；
//              ImagIndex : 节点的图标索引
//   输   出:  返回 TreeNode 对象
//   算法说明:  处理如公司，部门，小组 这样的分级显示。逐级查找已有的节点，找到自己的插入位置
//              按照strings，自动行程层次。

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
//   函数功能: 根据节点名称，查找指定树节点下一级节点中的同名节点
//   输入参数:  Sender:目标treeview,
//              NodeItem: 树中指定的节点，查找范围是它的下级节点集合
//              Name : 节点名称
//   输   出:  返回 找到的TreeNode 对象；如果没有找到则返回Nil
//   算法说明:

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
//   过程功能: 删除树中的节点
//   输入参数:  Sender:目标treeview,
//              ItemList: 被删除节点对应的 线性拓朴字符串：如公司、部门、小组结构
//                         中，叶子节点对应的字符串结构
//              level:要删除的节点的层次；
//   算法说明:

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
