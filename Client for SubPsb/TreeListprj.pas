{*****************************************************************************

     ���繫˾���̹�����
    �����нڵ����������������̺͹���ʵ��
    ��Ȩ���� (c) 2000,2001 ���ԿƼ�

*****************************************************************************}

unit TreeListprj;
{***************************************************************************
 ��Ԫ˵��:   ���������б� ���ָ��ӹ�ϵ��ʾ��
 ��    ��:   ��UI�㣬��ʾ������Ŀ�����ղ�ι�ϵ��trelist ��ʽ�г�
 ��    ��:   2003-12-12
 ��    ��:   ���ڱ�
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
    //�����ϼ��ڵ�  Input : �ϼ���¼���룻
    function  FindParentNode(const Parentcode:string):TcxTreeListNode;

  public
     procedure AddDataList(Dataset:Tdataset;
                ParentField,Keyfield:string;Data:Pointer);
     //����һ���б�������ղ�ηּ���ʾ
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
//   ��    ��: ����TreeList �ĸ����ڵ�,
//   �������:  TreeLeves : �������ڵ㼶������Ľڵ�����ַ�������
//              Values: ��ʾ�ĸ������ݣ�
//
//   ��   ��:
//   �㷨˵��:  �𼶲������еĽڵ㣬�ҵ��Լ��Ĳ���λ��
//              ���չ��̵ĸ��ӹ�ϵ���Զ��γɲ�Ρ�  ������TreeView��Ȼ�����ɸ�Node
//              ��Ӧ��List��
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
//   if  Values[3]= '1900-01-01' then   //������ֻ��ʾ�����ʺź���������.
//     for I :=0 to  1 do
//     ThisNode.Values[I] := Values[I]
//   else   for I :=0 to  (Values.Count-1) do
//     ThisNode.Values[I] := Values[I];
   ThisNode.AssignValues(Values);

   ThisNode.Data := Data;
   ThisNode.ImageIndex := ImgIndex;
end;


//******************************************************************************
//   ��������: ���ݽڵ����ƣ�����ָ�����ڵ���һ���ڵ��е�ͬ���ڵ�
//   �������:  NodeItem: ����ָ���Ľڵ㣬���ҷ�Χ�������¼��ڵ㼯��
//              Name : �ڵ�����
//   ��   ��:  ���� �ҵ���TreeListNode �������û���ҵ��򷵻�Nil
//   �㷨˵��:

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
