//****************************************************************************
//        Engineering Project Management Infomation System
//                 For Minhang Power Supply Bureau
//                 Author: Tuzz    2001/10
//    Copyright (c) 2001-? Shanghai Dawning Software Corporation
//****************************************************************************
unit PrjBrowser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, treefram, ImgList, ComCtrls, Buttons, StdCtrls, ExtCtrls,pubvar,Dm;

const  Wm_closeleft=Wm_user+2; //The message used to close left panel tree

type
  TFramtree_browser = class(TFram_Tree)
    procedure TrvwdefautGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure TrvwdefautChange(Sender: TObject; Node: TTreeNode);
    procedure TrvwdefautChanging(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure Panel2ConstrainedResize(Sender: TObject; var MinWidth,
      MinHeight, MaxWidth, MaxHeight: Integer);
  private
     Fieldstruct:TStringList;
    { Private declarations }
  public
    function Loadbrowsertree():boolean;
    procedure FreeNode;
    procedure UpdateTree(const TreeStructure:string);
    { Public declarations }
  end;

var
  Framtree_browser: TFramtree_browser;

implementation

uses MAIN, TreeListprj;



{$R *.dfm}

{ TFramtree_browser }

//将树目录结构字符转换为对应的数据库字段代码；
function  GetFieldCode(const TreeStructure: string):Tstringlist;
var I,J,k:integer;
    s1:array[0..79] of integer;
    fieldname:string;
    FieldList:TstringList;
    csql:string;
begin
  FieldList:= TstringList.Create;
  csql:='select * from FieldName';
  qrywork(dm_epm.adoqry_pub,csql);
  J:=0;k:=1;
  for I:=1 to length(TreeStructure) do
  if TreeStructure[I]='\' then
  begin
    s1[J]:=I;
    J:=J+1;
  end;
  for I:=0 to j-1 do
  begin
    fieldname:=copy(TreeStructure,k,s1[I]-k);
    dm_epm.adoqry_pub.Locate('Displayname',fieldname,[]);
    FieldList.Add(dm_epm.adoqry_pub.fieldbyname('fieldcode').AsString);
    k:=s1[I]+1;
  end;
  fieldname:=copy(TreeStructure,k,length(TreeStructure)-k+1);
  dm_epm.adoqry_pub.Locate('Displayname',fieldname,[]);
  FieldList.Add(dm_epm.adoqry_pub.fieldbyname('fieldcode').AsString);
  Result := FieldList;
end;

//加载项目浏览树视图
function TFramtree_browser.loadbrowsertree: boolean;
begin
 showmessage('need to do later');
 result:=true;
end;

// 根据选择的导航方式更新项目浏览树视图的结构组织方式  { TODO -ocsb : -need to be optimize arithmetic }
procedure TFramtree_browser.UpdateTree(const TreeStructure:string );
var FieldLists,NodeLists:TstringLIst;
    I:integer;
    Node:TTreeNode;
begin
  FreeNode;
  Node := Trvwdefaut.TopItem;
  NodeLists := TstringList.Create;
  try
    Fieldstruct :=GetFieldCode(TreeStructure);
    with Dm_Epm.Adoqry_Input do
    begin
      Prepared := True;
      Qrywork(dm_epm.adoqry_input,'execute GETACTIVEPRJ '''+CurCorpCode+'''');
      while not eof do
      begin
        NodeLists.Clear;
        for I := 0 to Fieldstruct.Count-1 do
        NodeLists.Add(trim(fieldbyname(Fieldstruct.Strings[I]).AsString));
        TreeAddItem(Trvwdefaut,NodeLists,Node,nil,False,0);
        Next;
      end;
      Prepared := False;
    end;
  finally
    NodeLists.Free;
    Node.Selected := true;
    Node.Expanded:=True;
  end;
  Fram_TltBase.Visible := False;
  Frm_Main.Lsv_Task.Visible := true;
end;

//当点击节点时变化图标为"打开的文件夹"
procedure TFramtree_browser.TrvwdefautGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  Node.SelectedIndex := 1;
end;

//根据当前的树目录结构方式，查询符合导航条件的工程项目并将结果显示在右边的ListView中
procedure TFramtree_browser.TrvwdefautChange(Sender: TObject;
  Node: TTreeNode);
var ConditionSql:string;
    FieldLists,FieldValues:Tstringlist;
    currentdate:Tdatetime;
    Pitem:Ptaskinfo;
    Newitem:TlistItem;
    I,J:integer;
    TempNode:TtreeNode;
begin
  if Node.HasChildren then
  begin
    frm_main.Lsv_Task.Visible :=True;
    frm_main.Lsv_Task.Items.Clear;
    TempNode:=Node.getFirstChild;
    with (frm_main.Lsv_Task.Items.Add) do
    begin
      Caption:=TempNode.Text;
      ImageIndex:=TempNode.ImageIndex ;
    end;
    For I:=1 to Node.Count-1 do
    begin
      TempNode:=Node.GetNextChild(TempNode);
      if TempNode<>nil then
      with (frm_main.Lsv_Task.Items.Add) do
      begin
        Caption:=TempNode.Text;
        ImageIndex:=TempNode.ImageIndex ;
      end;
    end;
    frm_main.Lsv_Task.ViewStyle :=vsIcon;
  end
  else if Node.Level>0 then
  begin
     FieldValues:= TstringLIst.Create;
     ConditionSql:='';
     TempNode:=Node;
     try
       FieldValues.Add(trim(TempNode.Text));
       while TempNode.Level>1 do
       begin
         TempNode:=TempNode.Parent;
         FieldValues.Add(trim(TempNode.Text));
       end;
       J:=0;
       for I:=Fieldstruct.count-1 downto 0 do
       begin
        ConditionSql:= ConditionSql+' and '+Fieldstruct.Strings[I]+'='
                        +''''''
                       +FieldValues.Strings[J]+'''''';
        J:=J+1;
       end;
     finally
       FieldValues.Free;
       TempNode:=nil;
       TempNode.Free;
     end;
     ConditionSql := ConditionSql+' and b.CorpCode='+''''''+CurCorpCode+'''''';
     Frm_Main.UpdateNavCol;
     Qrywork(dm_epm.adoqry_pub,'execute GetPrjByTree  '''+ConditionSql+'''');
     Fieldlists:=Tstringlist.Create;
     try
       frm_main.Lsv_Task.Items.BeginUpdate;
       frm_main.Lsv_Task.Items.Clear;
       with dm_epm.adoqry_pub do
       begin
         currentdate:=gettime;
         while not Eof do
         begin
           Fieldlists.Clear;
           Fieldlists.Add('');
           Fieldlists.Add(fieldbyname('prjname').AsString);
           Fieldlists.Add(fieldbyname('prjaccount').AsString);
           Fieldlists.Add(fieldbyname('typename').AsString);
           Fieldlists.Add(fieldbyname('designby').AsString);
           Fieldlists.Add(fieldbyname('Nodename').AsString);
           Fieldlists.Add(fieldbyname('executor').AsString);
           new(Pitem);
           Pitem.prjdm := fieldbyname('xmdm').AsString;
           Pitem.Executor := trim(fieldbyname('executor').AsString);
           Pitem.nodecode := fieldbyname('nodecode').AsString;
           Pitem.taskname := fieldbyname('nodename').AsString;
           Pitem.designby := fieldbyname('designcompany').AsString;
           Pitem.prjname := fieldbyname('prjname').AsString;
           Pitem.Prjsource := fieldbyname('SOUCECODE').AsString;
           Pitem.prjacc := fieldbyname('PRJACCOUNT').AsString;
           Pitem.prjtype := fieldbyname('TYPENAME').AsString;
               //日期超过计划日期则列表项中显示警告图标
           if fieldbyname('planend').AsDateTime<currentdate then
              newitem:=Additems(frm_main.Lsv_Task,Fieldlists,0)
           else
              newitem:=Additems(frm_main.Lsv_Task,Fieldlists);
           newitem.Data:=Pitem;
           next;
         end;
         frm_main.stbmain.panels[2].Text:=Node.text+'工程项目总计:'+inttostr(recordcount);
       end;
     finally
       Fieldlists.Free;
       Frm_main.Lsv_Task.Items.EndUpdate;
     end;
     frm_main.Lsv_Task.Visible :=True;
     frm_main.Lsv_Task.ViewStyle :=vsreport;
  end;
  inherited;
end;

//释放树节点
procedure TFramtree_browser.FreeNode;
var  I:integer;
begin
  for I:=0 to Trvwdefaut.Items.Count-1 do
    if Trvwdefaut.Items[I].Data<>nil then
     dispose(Trvwdefaut.Items[I].Data);
  Trvwdefaut.Items.Clear;
  Trvwdefaut.Items.Add(nil,'活动项目导航');
end;

//在切换选择树节点时隐藏ListView重画闪烁，清空状态栏的提示信息
procedure TFramtree_browser.TrvwdefautChanging(Sender: TObject;
  Node: TTreeNode; var AllowChange: Boolean);
begin
   if frm_main.Fram_Browser<>nil then
    frm_main.Fram_Browser.Visible:=false;
  frm_main.Lsv_Task.Visible:=false;
  frm_main.stbmain.panels[2].Text:='';
  inherited;

end;

procedure TFramtree_browser.Panel2ConstrainedResize(Sender: TObject;
  var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
begin
  inherited;
  MinWidth:=100;
  MaxWidth:=500;
end;

end.
