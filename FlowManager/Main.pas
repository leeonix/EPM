{***************************************************************************
  Descirption:   可视化流程
  CreateDate :   2004-06-1
  Author     :   程哨兵
  History    :
******************************************************************************}
unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AxCtrls, OleCtrls, DB, ADODB, Menus, RzStatus, ExtCtrls, RzPanel,
  ComCtrls, ToolWin, ImgList, ActnList, RzButton,RzSplit,
  AddFlow4Lib_TLB, RzBHints, RzCommon, RzLookup,flowBase, ExtDlgs,DBClient;
//

type
  Tfrm_main = class(TForm)
    RzStatusBar1: TRzStatusBar;
    RzStatusPane1: TRzStatusPane;
    RzFieldStatus1: TRzFieldStatus;
    RzVersionInfoStatus1: TRzVersionInfoStatus;
    RzClockStatus1: TRzClockStatus;
    ImageList1: TImageList;
    RzSizePanel1: TRzSizePanel;
    ToolBar1: TToolBar;
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    RzToolbar1: TRzToolbar;
    BtnNew: TRzToolButton;
    BtnSave: TRzToolButton;
    BtnDelete: TRzToolButton;
    BtnPrintPreview: TRzToolButton;
    BtnPrint: TRzToolButton;
    BtnZoomIn: TRzToolButton;
    BtnZoomOut: TRzToolButton;
    BtnUndo: TRzToolButton;
    BtnRedo: TRzToolButton;
    At_NewFlow: TAction;
    At_NewTaskNode: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    RzPanel1: TRzPanel;
    At_Save: TAction;
    At_Quit: TAction;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    At_Undo: TAction;
    At_Redo: TAction;
    At_Copy: TAction;
    At_Paste: TAction;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    At_preview: TAction;  //
    At_Pint: TAction;     // 
    N15: TMenuItem;
    N16: TMenuItem;
    At_Help: TAction;
    At_About: TAction;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    At_Zoomfit: TAction;
    At_Zoomin: TAction;
    At_ZoomOut: TAction;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    At_Delete: TAction;
    N24: TMenuItem;
    Action1: TAction;
    Action2: TAction;
    N25: TMenuItem;
    N26: TMenuItem;
    PopupMenu1: TPopupMenu;
    At_EditNode: TAction;
    N27: TMenuItem;
    N28: TMenuItem;
    Trv_FlwNav: TTreeView;
    N29: TMenuItem;
    AddFlow_com: TAddFlow;
    RzToolbar2: TRzToolbar;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    RzToolButton3: TRzToolButton;
    RzToolButton4: TRzToolButton;
    RzSpacer1: TRzSpacer;
    RzToolButton5: TRzToolButton;
    RzToolButton6: TRzToolButton;
    PopupMenu2: TPopupMenu;
    At_NewSwimLine: TAction;
    AtNewSwimLine1: TMenuItem;
    At_Export: TAction;
    SavePictureDialog1: TSavePictureDialog;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    At_NewLink: TAction;
    At_EditLink: TAction;
    N37: TMenuItem;
    ClientDataSet1: TClientDataSet;
    procedure N2Click(Sender: TObject);
    procedure At_ZoominExecute(Sender: TObject);
    procedure At_QuitExecute(Sender: TObject);
    procedure At_previewExecute(Sender: TObject);
    procedure BtnRedoClick(Sender: TObject);
    procedure At_SaveExecute(Sender: TObject);
    procedure At_PintExecute(Sender: TObject);
    procedure At_UndoExecute(Sender: TObject);
    procedure At_RedoExecute(Sender: TObject);
    procedure At_DeleteExecute(Sender: TObject);
    procedure At_HelpExecute(Sender: TObject);
    procedure At_AboutExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure At_ZoomfitExecute(Sender: TObject);
    procedure At_ZoomOutExecute(Sender: TObject);
    procedure At_CopyExecute(Sender: TObject);
    procedure At_EditNodeExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Trv_FlwNavChange(Sender: TObject; Node: TTreeNode);
    procedure Trv_FlwNavChanging(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure RzToolButton1Click(Sender: TObject);
    procedure RzToolButton2Click(Sender: TObject);
    procedure RzToolButton3Click(Sender: TObject);
    procedure RzToolButton5Click(Sender: TObject);
    procedure RzToolButton6Click(Sender: TObject);
    procedure At_NewSwimLineExecute(Sender: TObject);
    procedure At_ExportExecute(Sender: TObject);
    procedure At_NewFlowExecute(Sender: TObject);
    procedure At_NewTaskNodeExecute(Sender: TObject);
    procedure AddFlow_comBeforeAddNode(Sender: TObject; Left, Top, Width,
      Height: Single; var Cancel: Smallint);
    procedure AddFlow_comAfterAddLink(Sender: TObject;
      const NewLink: ILink);
    procedure AddFlow_comBeforeAddLink(Sender: TObject; const Org,
      Dst: INode; var Cancel: Smallint);
    procedure Trv_FlwNavGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure At_EditLinkExecute(Sender: TObject);
  private
    { Private declarations }
     Flinkcode:string;
     Temppath:string;
    procedure LoadTree;
  public
    // if else else
    { Public declarations }
  end;

var
  frm_main: Tfrm_main;

implementation

uses TaskProperty,UDm, Ufrm_flow, Ufrm_Link;

{$R *.dfm}

procedure Tfrm_main.N2Click(Sender: TObject);
begin
//

end;

// 缩放视图
procedure Tfrm_main.At_ZoominExecute(Sender: TObject);
begin
  with AddFlow_com do
  begin
    xZoom := xZoom+25;
    yZoom := yZoom+25;
    //
  end;
end;

procedure Tfrm_main.At_QuitExecute(Sender: TObject);
begin
    Close;
end;

procedure Tfrm_main.At_previewExecute(Sender: TObject);
var I,J:Integer;
begin
{
  for I:=1 to AddFlow_com.Nodes.Count do
   for J:=1 to  AddFlow_com.Nodes.Count do
     if  (I<>j) and  (AddFlow_com.Nodes.Item(I).Tag=AddFlow_com.Nodes.Item(J).Tag) then
     AddFlow_com.Nodes.Item(I).Text:=  'Herer are you' ;
   for I:=1 to AddFlow_com.Nodes.Count do
       AddFlow_com.Nodes.Item(I).Selectable := true;
   RzLookupDialog1.Execute;}
  //PrnFlow1.hWndFlow := AddFlow_com.hWnd  ;
 { Application.CreateForm(Tfrm_Print,frm_Print);
  try
    frm_Print.PrnFlow1.hWndFlow:= AddFlow_com.hWnd ;
    frm_Print.ShowModal ;
  finally
    frm_Print.Free;
  end;   }




end;

procedure Tfrm_main.BtnRedoClick(Sender: TObject);
begin

end;

//保存流程图
procedure Tfrm_main.At_SaveExecute(Sender: TObject);
var SaveFile:string;
procedure UpdateChart(flowcode:string) ;
begin
   with Dm_flow.Adqry_com do
   begin
      SQL.Clear;
      SQL.Add('select * from flow where flowcode='''+flowcode+'''');  //
      Open;
      edit;
      Tblobfield(FieldByName('chartfile')).LoadFromFile(SaveFile);
      Post;
   end;
end;
begin
   SaveFile := ExtractFilePath(ParamStr(0))+'flow\';
   SaveFile := SaveFile+Pflow(Trv_FlwNav.Selected.Data).Flowcode+'.flow' ;
   AddFlow_com.SaveFile(SaveFile);
   UpdateChart(Pflow(Trv_FlwNav.Selected.Data).Flowcode); //
   Pflow(Trv_FlwNav.Selected.Data).Chartfile := SaveFile; //
end;

procedure Tfrm_main.At_PintExecute(Sender: TObject);
var I:Integer;
begin
 with AddFlow_com do
  begin
    for I:=1 to Nodes.Count do
      if  Nodes.Item(I).Tag='' then
      Nodes.Item(I).Selected := True;
  end;
end;

procedure Tfrm_main.At_UndoExecute(Sender: TObject);
begin
  AddFlow_com.Undo;
end;

procedure Tfrm_main.At_RedoExecute(Sender: TObject);
begin
  AddFlow_com.Redo;
end;

procedure Tfrm_main.At_DeleteExecute(Sender: TObject);
var I:Integer;

begin

  if MessageDlg('您确定要删除流程节点或流向吗,必须确认此节点当前没有业务项引用？',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    // 1)删除节点时,同步删除数据库对应的流向.
    if AddFlow_com.SelNodes.Count>0 then
      for I:=1 to AddFlow_com.SelNodes.Count do
        Dm_flow.DelNode(AddFlow_com.SelNodes.Item(I).Tag)

    // 2)删除选择的所有流向  流向如果引用到回退逻辑
    else  if AddFlow_com.SelLinks.Count>0 then
    for I:=1 to AddFlow_com.SelLinks.Count do
     Dm_flow.DelLink(AddFlow_com.SelLinks.Item(I).Tag);
    AddFlow_com.DeleteSel;
  end;

end;

procedure Tfrm_main.At_HelpExecute(Sender: TObject);
begin
  //
end;

procedure Tfrm_main.At_AboutExecute(Sender: TObject);
begin
 //
end;

procedure Tfrm_main.Action1Execute(Sender: TObject);
begin
//
end;

procedure Tfrm_main.Action2Execute(Sender: TObject);
begin
//
end;

procedure Tfrm_main.At_ZoomfitExecute(Sender: TObject);
begin
  with AddFlow_com do
  begin
    xZoom :=0;
    yZoom :=0;
  end;

end;

procedure Tfrm_main.At_ZoomOutExecute(Sender: TObject);

begin
  with AddFlow_com do
  begin
   xZoom := xZoom-25;
   yZoom := yZoom-25;
  end;
end;

procedure Tfrm_main.At_CopyExecute(Sender: TObject);
begin
  AddFlow_com.Copy(AddFlow_com.SelectionHandleSize);
end;

procedure Tfrm_main.At_EditNodeExecute(Sender: TObject);
begin
  if AddFlow_com.SelectedNode=nil then exit;
  Application.CreateForm(Tfrm_TaskProp,frm_TaskProp);
  frm_TaskProp.FLowcode := Pflow(Trv_FlwNav.Selected.Data).Flowcode;
  if  AddFlow_com.SelectedNode.Tag<>'' then
  begin
   frm_TaskProp.Taskcode := AddFlow_com.SelectedNode.Tag;
   frm_TaskProp.TaskName := AddFlow_com.SelectedNode.Text;
  end;
  try
    if frm_TaskProp.ShowModal=mrok then
    begin
      AddFlow_com.SelectedNode.Tag := frm_TaskProp.Taskcode;
      AddFlow_com.SelectedNode.Text := frm_TaskProp.TaskName;
    end;
  finally
    frm_TaskProp.Free;
  end;

end;

//导入流程导航树
procedure Tfrm_main.LoadTree;
var TempNode:TtreeNode;
    TempPoniter:PFlow;
    Savefile:string;
begin

  with Dm_flow.Adqry_com do
  begin
     Sql.Clear;
     SQL.Add('select * from flow');
     Open;
     while not eof do
     begin
       New(TempPoniter);
       Savefile := temppath + fieldbyName('flowcode').AsString+'.flow';
       TempPoniter.Flowcode := fieldbyName('flowcode').AsString;
       TempPoniter.FlowName := fieldbyName('flowname').AsString;
       TempPoniter.Creator := fieldbyName('maintainby').AsString;
       if not FieldByName('chartfile').IsNull then
       begin
        TBlobfield(fieldbyName('chartfile')).SaveToFile(Savefile);
        TempPoniter.Chartfile := Savefile ;
       end else
       TempPoniter.Chartfile := '';
       TempNode := Trv_FlwNav.Items.AddChildObject(Trv_FlwNav.TopItem,fieldbyName('flowname').AsString,TempPoniter);
       TempNode.ImageIndex :=28; 
       Next;
     end;
  end;
end;

procedure Tfrm_main.FormCreate(Sender: TObject);
begin
  Temppath := ExtractFilePath(ParamStr(0))+'flow\';
  LoadTree;
  Trv_FlwNav.TopItem.Expand(true);
  Trv_FlwNav.TopItem.Item[0].Selected;

end;

procedure Tfrm_main.Trv_FlwNavChange(Sender: TObject; Node: TTreeNode);
begin
    if (Node.Level<>0) and (pflow(Node.Data).Chartfile<>'') then
    AddFlow_com.LoadFile(pflow(Node.Data).Chartfile);
    AddFlow_com.Visible := True;

end;

procedure Tfrm_main.Trv_FlwNavChanging(Sender: TObject; Node: TTreeNode;
  var AllowChange: Boolean);
begin
  //if  Node.Level=0 then exit;
//  if MessageDlg('您确定要删除吗？', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
 // begin
  //  AllowChange := True;

//  end else
 //   AllowChange := false;
  AddFlow_com.Nodes.Clear;
end;

procedure Tfrm_main.RzToolButton1Click(Sender: TObject);
var I,Selfirst:Integer;
begin
   Selfirst := 1;
   with  AddFlow_com do
   begin
     if  SelNodes.Count=0 then exit;
     for I :=2   to SelNodes.Count do
     SelNodes.Item(I).Left := SelNodes.Item(Selfirst).Left;
   end;
end;

procedure Tfrm_main.RzToolButton2Click(Sender: TObject);
var I,Selfirst:Integer;
begin
   Selfirst := 1;
   with  AddFlow_com do
   begin
     if  SelNodes.Count=0 then exit;
     for I :=2   to SelNodes.Count do
     SelNodes.Item(I).Top := SelNodes.Item(Selfirst).Top;
   end;
end;

procedure Tfrm_main.RzToolButton3Click(Sender: TObject);
var I,Selfirst:Integer;
begin
   Selfirst := 1;
   with  AddFlow_com do
   begin
     if  SelNodes.Count=0 then exit;
     for I :=2   to SelNodes.Count do
     SelNodes.Item(I).Left := SelNodes.Item(Selfirst).Left+SelNodes.Item(Selfirst).Width-SelNodes.Item(I).Width;
   end;
end;

procedure Tfrm_main.RzToolButton5Click(Sender: TObject);
begin
  with AddFlow_com do
  begin
     SelectedNode.ZOrderIndex:=1;
  end;


end;

procedure Tfrm_main.RzToolButton6Click(Sender: TObject);
begin
  with AddFlow_com do
  begin
     SelectedNode.ZOrder:=0;
  end;

end;

{新建泳道节点,由两个Node组合而成，一个作为泳道标题，垂直布局，节点缺省特性设置:
  1、Selectable = false;
  2、
}
procedure Tfrm_main.At_NewSwimLineExecute(Sender: TObject);
var TempLink:afLink;
    NodeHead,NodeSwim:afNode;
begin
  with AddFlow_com do
  begin
     NodeHead := Nodes.Add(100,0,2000,600);
     NodeHead.Shape := afRectangle;
     NodeHead.XMoveable := False;
     NodeSwim := Nodes.Add(100,600,2000,10000);
     NodeSwim.Shape := afRectangle;
     NodeSwim.Moveable := False;
     TempLink := NodeHead.OutLinks.Add(NodeSwim);
     TempLink.Rigid := true;
     TempLink.Hidden := True;
  end;

end;

procedure Tfrm_main.At_ExportExecute(Sender: TObject);
var Pic:IPictures;
begin
   if SavePictureDialog1.Execute then
   AddFlow_com.SaveImage(afTypeMediumFile,afEMF,SavePictureDialog1.FileName);
end;

procedure Tfrm_main.At_NewFlowExecute(Sender: TObject);
var TempPoniter:PFlow;
function  GetFlowCode():string ;
begin
   QueryWork('select max(flowcode) as flowcode from flow',Dm_flow.Adqry_com,True);
   if Dm_flow.Adqry_com.FieldByName('flowcode').AsInteger+1<10 then
   Result := '0'+  inttostr(Dm_flow.Adqry_com.FieldByName('flowcode').AsInteger+1)
   else Result := inttostr(Dm_flow.Adqry_com.FieldByName('flowcode').AsInteger+1);
end;

begin
  Application.CreateForm(Tfrm_flow,frm_flow);
  frm_flow.flowcode := GetFlowCode;
  try
    if frm_flow.ShowModal = mrok then
    begin
      New(TempPoniter);
      TempPoniter.Flowcode := frm_flow.flowcode ;
      TempPoniter.FlowName := trim(frm_flow.RzDe_flowname.Text);
      TempPoniter.Chartfile := '';
      Trv_FlwNav.Items.AddChildObject(Trv_FlwNav.TopItem,trim(frm_flow.RzDe_flowname.Text),TempPoniter);
    end;
  finally
    frm_flow.Free;
  end;

end;

procedure Tfrm_main.At_NewTaskNodeExecute(Sender: TObject);
begin
//
end;

procedure Tfrm_main.AddFlow_comBeforeAddNode(Sender: TObject; Left, Top,
  Width, Height: Single; var Cancel: Smallint);
begin
   //
end;

procedure Tfrm_main.AddFlow_comAfterAddLink(Sender: TObject;
  const NewLink: ILink);
begin
   NewLink.Tag := Flinkcode;
   Flinkcode:=''; 
end;

procedure Tfrm_main.AddFlow_comBeforeAddLink(Sender: TObject; const Org,
  Dst: INode; var Cancel: Smallint);
begin
  Application.CreateForm(Tfrm_link,frm_link);
  frm_Link.OrgNode:=  Org.Tag;
  frm_Link.DesNode := Dst.Tag;
  frm_Link.LinkNode:= Org.Tag+Dst.Tag;
  try
    if frm_Link.ShowModal=mrok then
        Flinkcode:= frm_Link.LinkNode   
     else Cancel := 1;
  finally
    frm_Link.Free;
  end;
end;

procedure Tfrm_main.Trv_FlwNavGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;

end;

procedure Tfrm_main.At_EditLinkExecute(Sender: TObject);
begin
  if AddFlow_com.SelectedLink=nil then exit;
  Application.CreateForm(Tfrm_Link,frm_Link);
  frm_Link.LinkNode := AddFlow_com.SelectedLink.Org.Tag+AddFlow_com.SelectedLink.Dst.Tag ;
  frm_Link.DesNode := AddFlow_com.SelectedLink.Dst.Tag;
  frm_Link.OrgNode := AddFlow_com.SelectedLink.Org.Tag;
  try
    if frm_Link.ShowModal=mrok then
    begin
      AddFlow_com.SelectedLink.Tag := frm_Link.LinkNode;
     // AddFlow_com.SelectedLink.Text := frm_TaskProp.TaskName;
    end;
  finally
    frm_Link.Free;
  end;
end;

end.
