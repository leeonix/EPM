//****************************************************************************
//        Engineering Project Management Infomation System
//                 For Minhang Power Supply Bureau
//        This unit provide user the GUI  to input search conditions and then find
//        all kinds of projects including engprj,consult record,power user apply
//        record and so on. The search results are also listed in the right panel
//        list view,and the detail property associated to the result records need
//        to presented by popup form.
//                 Author: Tuzz    2001/10
//    Copyright (c) 2001-? Shanghai Dawning Software Corporation
//****************************************************************************
unit SearchTree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, StrUtils,
  Dialogs, Treefram, ImgList, ComCtrls, Buttons, StdCtrls, ExtCtrls,Dm,PubVar;

const  Wm_closeleft=Wm_user+2;

type
  TFramtree_Search = class(TFram_Tree)
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    Panel5: TPanel;
    Panel6: TPanel;
    Animate1: TAnimate;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Panel7: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    edt_prjname: TEdit;
    edt_prjacc: TEdit;
    cbx_prjtype: TComboBox;
    othertype: TComboBox;
    Panel9: TPanel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel8: TPanel;
    Button1: TButton;
    Button2: TButton;
    StaticText3: TStaticText;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label9: TLabel;
    ComboBox1: TComboBox;
    procedure Panel7CanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FrameConstrainedResize(Sender: TObject; var MinWidth,
      MinHeight, MaxWidth, MaxHeight: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure othertypeEnter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure cbx_prjtypeEnter(Sender: TObject);
  private

    { Private declarations }
  public
    Fcorpcode:string;
    FindSql:string;
    procedure ListFindResult();
    function AddResult(): Boolean;
    { Public declarations }
  end;

var
  Framtree_Search: TFramtree_Search;
implementation

uses TaskTree, Main;

{$R *.dfm}

//将查询结果数据集添加到listview列表中显示给用户,同时将查看详细信息所需的keyword
// 存入record中并将列表项的指针指向它
function TFramtree_Search.AddResult(): Boolean;
var Fieldlists:Tstringlist;
    NewItem:Tlistitem;
    Pitem:Ptaskinfo;
begin
   Fieldlists:=Tstringlist.Create;
   try
     Frm_Main.Lsv_Task.Items.BeginUpdate;
     Frm_Main.Lsv_Task.Items.Clear;
     with dm_epm.adoqry_pub do
     begin
       while not Eof do
       begin
         Fieldlists.Clear;
         Fieldlists.Add(fieldbyname('prjname').AsString);
         Fieldlists.Add(fieldbyname('typename').AsString);
         Fieldlists.Add(fieldbyname('prjaccount').AsString);
         Fieldlists.Add(fieldbyname('designby').AsString);
         New(Pitem);
         if not CheckBox1.Checked then
         begin
           Fieldlists.Add(fieldbyname('Executor').AsString);
           Fieldlists.Add(fieldbyname('Nodename').AsString);
           Pitem.nodecode:=fieldbyname('nodecode').AsString;
           Pitem.taskname:=fieldbyname('nodename').AsString;
           Pitem.Executor:=trim(fieldbyname('executor').AsString);
         end
         else
         begin
           Fieldlists.Add('');
           Fieldlists.Add('已归档');
           Pitem.taskname:='已归档'; 
         end;
         Pitem.prjdm:=fieldbyname('prjcode').AsString;
         Pitem.prjname:=fieldbyname('prjname').AsString;
         Pitem.Prjsource:=fieldbyname('SOUCECODE').AsString;
         Pitem.prjacc:=fieldbyname('PRJACCOUNT').AsString;
         Pitem.prjtype:=fieldbyname('TYPENAME').AsString;
         Pitem.designby:=fieldbyname('designcompany').AsString;
         Newitem:=Additems(Frm_Main.Lsv_Task,Fieldlists);
         Newitem.Data:=Pitem;
         next;
       end;
     end;
   finally
     Fieldlists.Free;
     frm_main.Lsv_Task.Items.EndUpdate;
     result:=true;
   end;
end;

//调整控件尺寸以适应用户调节主界面大小
procedure TFramtree_Search.Panel7CanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  inherited;
  Edt_prjname.Width:=newwidth-36;
  Edt_prjacc.Width:=newwidth-36;
  cbx_prjtype.Width:=newwidth-36;
  othertype.Width := newwidth-36;
  ComboBox1.Width := newwidth-36;
end;

procedure TFramtree_Search.Panel7Click(Sender: TObject);
begin
  inherited;

end;

//控制查询导航视图的最大和最小尺寸
procedure TFramtree_Search.FrameConstrainedResize(Sender: TObject;
  var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
begin
  inherited;
  MinWidth:=100;
  MaxWidth:=500;
end;

//根据查询条件生成sql语句执行查询
procedure TFramtree_Search.Button1Click(Sender: TObject);
var cSql,strprjacc:string;
    NewNode:Ttreenode;
begin
  if (Trim(Edt_Prjname.Text)='') and (Trim(Edt_prjacc.Text)='')  and (trim(othertype.Text)='')
     and (trim(cbx_prjtype.Text)='') then
  begin
    MessageBox(self.Handle,'请输入一些搜索条件','查找工程'
                                ,MB_OK+MB_ICONWARNING);
    exit;
  end else
  begin
    Animate1.Active:=true;
    if not  ComboBox1.Visible  then Fcorpcode := CurCorpCode;
    if CheckBox1.Checked then
    FindSql:='select * from projectinfo inner join projecttype on prjtype=PRJTYPECODE'
          +' left join designinfo on projectinfo.prjcode=designinfo.prjcode '
          +' where flag=''2'' and Corpcode='''+Fcorpcode+''''
    else
    if CheckBox2.Checked then
     FindSql:='select * from projectinfo inner join flownodeinfo on prjcode=xmdm'
           +' inner join projecttype on prjtype=PRJTYPECODE left join designinfo'
           +' on projectinfo.prjcode=designinfo.prjcode where  activeflag=''1'' and Corpcode='''+Fcorpcode+''''
           +' and (projectinfo.flag=''4'') '
    else
    FindSql:='select * from projectinfo inner join flownodeinfo on prjcode=xmdm'
           +' inner join projecttype on prjtype=PRJTYPECODE left join designinfo'
           +' on projectinfo.prjcode=designinfo.prjcode where  (activeflag=''1'' or activeflag=''3'')  and Corpcode='''+Fcorpcode+''''
           +' and (projectinfo.flag=''0'' or projectinfo.flag=''3'') ';
    strprjacc :=  trim(Edt_prjacc.text);
    if  ContainsStr(strprjacc,'[')  and ContainsStr(strprjacc,']')  then
    begin
      strprjacc := Copy(strprjacc,1,Pos('[',strprjacc)-1)
             +'!['
             + Copy(strprjacc,Pos('[',strprjacc)+1,Pos(']',strprjacc)-Pos('[',strprjacc)-1)
             +'!]'
             +Copy(strprjacc,Pos(']',strprjacc)+1,Length(strprjacc));
    end;

    if Trim(Edt_prjname.Text)<>'' then
    FindSql:=FindSql+'and prjname like ''%'+trim(Edt_prjname.text)+'%''';
    if trim(Edt_prjacc.Text)<>'' then
    FindSql:=FindSql+'and PRJACCOUNT like ''%'+strprjacc+'%''';
    if trim(cbx_prjtype.Text)<>'' then
    FindSql:=FindSql+'and TYPENAME like ''%'+trim(cbx_prjtype.text)+'%''';
    if trim(othertype.Text)<>'' then
    FindSql:=FindSql+'and othertype like ''%'+trim(othertype.Text)+'%''';
    FindSql := FindSql + ' ESCAPE ''!''' ;
    Qrywork(Dm_epm.adoqry_pub,FindSql);
    if Dm_epm.adoqry_pub.IsEmpty then
    begin
      Showmessage('没有找到符合条件的结果，请重新输入搜索条件');
      Animate1.Active:=false;
      Exit;
    end;
    ListFindResult;
    Animate1.Active:=false;
  end;
   inherited;
end;

procedure TFramtree_Search.Button2Click(Sender: TObject);
begin
  inherited;
   if Animate1.Active=true then
      Animate1.Active:=false;
end;

procedure TFramtree_Search.cbx_prjtypeEnter(Sender: TObject);
var csql :string;
    I:Integer;
begin
  inherited;
    cbx_prjtype.Items.Clear;
    csql := 'select TYPENAME,PRJTYPECODE from PROJECTTYPE';
    QryWork(Dm_Epm.adoqry_pub,csql);
    for I :=0  to Dm_Epm.adoqry_pub.Recordcount-1  do
    begin
      cbx_prjtype.Items.Add(trim(Dm_Epm.adoqry_pub.fieldbyname('TYPENAME').asstring));
      Dm_Epm.adoqry_pub.Next;
    end;
end;

procedure TFramtree_Search.othertypeEnter(Sender: TObject);
begin

   DM_epm.InitParam(Tcombobox(sender),Tcombobox(sender).name,'');
  inherited;

end;

procedure TFramtree_Search.SpeedButton1Click(Sender: TObject);
begin
   edt_prjname.Text:='';
   edt_prjacc.Text:='';
   cbx_prjtype.Text:='';
   othertype.Text:='';
  inherited;

end;

//列出查找结果
procedure TFramtree_Search.ListFindResult;
var Colcap:Tstringlist;
    Newnode:TtreeNode;
begin
   Newnode:=Framtree_task.Trvwdefaut.TopItem;
   repeat
     if NewNode.getNextSibling=nil then
       break
     else  NewNode:=NewNode.getNextSibling;
   until Newnode=nil;
   if NewNode.Text<>'搜索结果' then
      NewNode:=Framtree_task.Trvwdefaut.Items.Add(nil,'搜索结果');
   NewNode.ImageIndex:=6;
   Frm_Main.Lsv_Task.Visible :=false;
   if frm_main.Fram_Browser<>nil then
   frm_main.Fram_Browser.Visible:=false;
   Colcap:=Tstringlist.Create;
   try
     Frm_main.Lsv_Task.Columns.BeginUpdate;
     Colcap.Add('工程名称');
     Colcap.Add('工程性质');
     Colcap.Add('工程帐号');
     Colcap.Add('设计人');
     Colcap.Add('当前执行人');
     Colcap.Add('当前节点');
     Frm_Main.AddLsvColumn(colcap);
     Frm_Main.Lsv_Task.Columns[0].Width:=250;
     Frm_Main.Lsv_Task.Columns[1].Width:=150;  //
     Frm_Main.Lsv_Task.Columns[2].Width:=150;
     Frm_Main.Lsv_Task.Columns[3].Width:=100;
     Frm_Main.Lsv_Task.Columns[4].Width:=100;
     Frm_Main.Lsv_Task.Columns[5].Width:=150;
   finally
     Colcap.Free;
     Frm_Main.Lsv_Task.Columns.EndUpdate;
   end;
   AddResult;
   NewNode.Selected:=true;
   frm_main.stbmain.panels[2].Text:='共有'
                   +inttostr(DM_EPM.adoqry_pub.RecordCount)+'个工程符合查询条件';
   Frm_Main.Lsv_Task.Visible :=true;
   Frm_Main.Lsv_Task.ViewStyle:=vsreport;
end;

procedure TFramtree_Search.Label5Click(Sender: TObject);
begin
  frm_main.A_advanceSearch.Execute;
  inherited;

end;

procedure TFramtree_Search.ComboBox1Change(Sender: TObject);
begin
  inherited;
  case ComboBox1.ItemIndex of
    0: Fcorpcode :='2';
    1: Fcorpcode :='4';
    2: Fcorpcode :='3';
    3: Fcorpcode :='5';
    4: Fcorpcode :='6';
  end;

end;

end.
