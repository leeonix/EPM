{*****************************************************************************

     供电公司工程管理集成
    在闵行节点管理基础上扩充流程和功能实现
    版权所有 (c) 2000,2001 晨辉科技

*****************************************************************************}

unit TreeListprj;
{***************************************************************************
 单元说明:   工程任务列表 ，分父子关系显示。
 描    述:   在UI层，显示工程项目，按照层次关系已trelist 形式列出
 日    期:   2003-12-12
 作    者:   程哨兵
******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DB,ADODB,
   cxGraphics, cxCustomData, ImgList,cxControls, cxInplaceContainer,cxStyles, cxTL, cxTextEdit,
   pubvar,dm, cxLookAndFeels, cxLookAndFeelPainters, cxTLdxBarBuiltInMenu,
  dxSkinsCore, dxSkinsDefaultPainters;

type
  TFram_TltBase = class(TFrame)
    ImageList1: TImageList;
    cxTLt_com: TcxTreeList;
    procedure cxTLt_comDblClick(Sender: TObject);

    procedure cxTLt_comCustomDrawDataCell(Sender: TcxCustomTreeList;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }

    function TreeFindItem( NodeItem:TcxTreeListNode;Name: String): TcxTreeListNode;
    //查找上级节点  Input : 上级记录代码；
    function  FindParentNode(const Parentcode:string):TcxTreeListNode;

  public
     procedure AddDataList(Dataset:Tdataset;
                ParentField,Keyfield:string;Data:Pointer);
     //生成一个列表项：并按照层次分级显示
     procedure  AddTreeListItem(const Values:array of Variant;ParentField:string;Data:Ptaskinfo;ImgIndex:Integer);
     procedure UpdateColumns(AcolumnsList:TstringList);
     Procedure AutoFitColumns;

  end;

var
  Fram_TltBase:TFram_TltBase;

implementation

uses MAIN;

{$R *.dfm}  



procedure TFram_TltBase.AddDataList(Dataset: Tdataset;
  ParentField, Keyfield: string;Data:Pointer);
var J:Integer;
    TempNode:TcxTreeListNode;
begin
   cxTLt_com.BeginUpdate;
   while not Dataset.Eof do
   begin
     if trim(Dataset.FieldByName(ParentField).AsString)='' then
     begin
       TempNode := cxTLt_com.Add;
       TempNode.Data := Data;
       for J :=0 to  Dataset.FieldCount-1 do
       TempNode.Values[J] := trim(Dataset.Fields[J].AsString);
     end else
     begin
       TempNode := FindParentNode(Dataset.fieldbyname(ParentField).AsString);
       if TempNode<>nil then
       begin
         TempNode := TempNode.AddChild;
         TempNode.Data := Data;
         for J :=0 to Dataset.FieldCount-1 do
         TempNode.Values[J] := trim(Dataset.Fields[J].AsString);
       end;
     end;
     Dataset.Next;
   end;
   cxTLt_com.EndUpdate;
end;



function TFram_TltBase.FindParentNode(const Parentcode: string):TcxTreeListNode;
var NodeItem:TcxTreeListNode;
begin
   if Parentcode <>''  then
   begin
     NodeItem:=cxTLt_com.TopNode;
     if (NodeItem <> nil) and (Ptaskinfo(NodeItem.Data).prjdm <> ParentCode) then
     repeat
           NodeItem := NodeItem.GetNext;
     until (NodeItem = nil) or (Ptaskinfo(NodeItem.Data).prjdm = ParentCode);
     Result := NodeItem;
   end
   else Result := nil;
end;

//******************************************************************************
//   功    能: 生成TreeList 的各级节点,
//   输入参数:  TreeLeves : 按照树节点级数排序的节点标题字符串数组
//              Values: 显示的各列数据；
//
//   输   出:
//   算法说明:  逐级查找已有的节点，找到自己的插入位置
//              按照工程的父子关系，自动形成层次。  先生成TreeView，然后生成各Node
//              对应的List；
//******************************************************************************
procedure TFram_TltBase.AddTreeListItem(const Values:array of Variant;ParentField:string;
   Data:Ptaskinfo;ImgIndex:Integer);
var
   ThisNode:TcxTreeListNode;
   I: Integer;
begin
   ThisNode := FindParentNode(ParentField);
   if ThisNode=nil then
      ThisNode := cxTLt_com.Add
   else ThisNode := ThisNode.AddChild;
//   if  Values[3]= '1900-01-01' then   //父工程只显示工程帐号和名称两列.
//     for I :=0 to  1 do
//     ThisNode.Values[I] := Values[I]
//   else   for I :=0 to  (Values.Count-1) do
//     ThisNode.Values[I] := Values[I];
   ThisNode.AssignValues(Values);

   ThisNode.Data := Data;
   ThisNode.ImageIndex := ImgIndex;
end;


//******************************************************************************
//   函数功能: 根据节点名称，查找指定树节点下一级节点中的同名节点
//   输入参数:  NodeItem: 树中指定的节点，查找范围是它的下级节点集合
//              Name : 节点名称
//   输   出:  返回 找到的TreeListNode 对象；如果没有找到则返回Nil
//   算法说明:

//******************************************************************************
function TFram_TltBase.TreeFindItem(NodeItem:TcxTreeListNode; Name: String): TcxTreeListNode;

begin
   if NodeItem=nil then
   NodeItem :=  cxTLt_com.TopNode
   else NodeItem := NodeItem.GetFirstChild;
  //if this  has no items, NodeItem is nil
   if (NodeItem <> nil) and (NodeItem.Texts[0] <> Name) then
   repeat
         NodeItem := NodeItem.GetNextSibling;
   until (NodeItem = nil) or (NodeItem.Values[0] = Name);
   Result := NodeItem;
end;

procedure TFram_TltBase.UpdateColumns(AcolumnsList: TstringList);
var I:integer;
    TempCol:TcxTreeListColumn;
begin
  cxTLt_com.Clear;
  cxTLt_com.DeleteAllColumns;
  for I := 0 to  AcolumnsList.Count-1 do
  begin
    TempCol := cxTlt_com.CreateColumn;;
    TempCol.Caption.Text := AcolumnsList[I] ; 
  end;
end;

procedure TFram_TltBase.cxTLt_comDblClick(Sender: TObject);
begin
   frm_main.ShowDetailInfo(1);
end;



procedure TFram_TltBase.cxTLt_comCustomDrawDataCell(Sender: TcxCustomTreeList;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
     if not AViewInfo.Node.HasChildren and
      (Ptaskinfo( AViewInfo.Node.Data).Executor <> LoginUser) then
  ACanvas.Font.Color := clred;
end;

procedure TFram_TltBase.AutoFitColumns;
var I:Integer;
begin
  for I := 0  to cxTLt_com.ColumnCount-1  do
  cxTLt_com.Columns[I].ApplyBestFit;
end;

end.
