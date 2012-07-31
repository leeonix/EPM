//****************************************************************************
//        Engineering Project Management Infomation System
//                 For Minhang Power Supply Bureau
//
//       This unit including the documnets management belong to the project,specilly
//        provide users view and mod the documents rapidlly 
//                 Author: Tuzz    2001/10
//    Copyright (c) 2001-? Shanghai Dawning Software Corporation
//****************************************************************************
unit Documents ;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Menus, StdCtrls, DB, ADODB,dm,pubvar, Grids, DBGrids,
  DBCtrls, Buttons, ActnList, OleCtrls, FmxUtils, ImgList,treefram;

type
  TFram_PrjDoc = class(TFrame)
    PopupMenu1: TPopupMenu;
    ppmnew: TMenuItem;
    ppmdel: TMenuItem;
    ppmmod: TMenuItem;
    ppmview: TMenuItem;
    ppmopen: TMenuItem;
    ActionList1: TActionList;
    propdoc: TAction;
    newdoc: TAction;
    deldoc: TAction;
    viewdoc: TAction;
    opendoc: TAction;
    Imglst_Larg: TImageList;
    Imglst_tree: TImageList;
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    TreeView1: TTreeView;
    ListView1: TListView;
    Panel3: TPanel;
    StaticText1: TStaticText;
    Splitter1: TSplitter;
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure ListView1DblClick(Sender: TObject);
    procedure deldocExecute(Sender: TObject);
    procedure propdocExecute(Sender: TObject);
    procedure newdocExecute(Sender: TObject);
    procedure viewdocExecute(Sender: TObject);
    procedure opendocExecute(Sender: TObject);
  private


    { Private declarations }
  public
    prjid:string;
    procedure Init(const Prjcode:string);
    procedure UpdateDoc;
    procedure LinkDoc;
    procedure DeleteDoc;
    { Public declarations }
  end;

implementation

uses newdoc;

{$R *.dfm}

{ TFram_DWG }

procedure TFram_PrjDoc.Init(const Prjcode:string);
var  csql:string;
     Fieldlists:TstringList;
     Mypointer:Pfile;
     Node:TtreeNode;
begin
  prjid:=prjcode;
  Node:=TreeView1.TopItem;
  if Node.HasChildren then
     Node.DeleteChildren;
  with dm_epm.adoqry_doc do
  begin
    csql:='select * from DOCINFO where SSXMDM='''+prjcode+''' ' ;
    qrywork(dm_epm.ADOQry_doc,csql);
    Fieldlists:=Tstringlist.Create;
    try
      while not eof do
      begin
        FieldLists.Clear;
        FieldLists.Add(fieldbyname('doctype').AsString);
        New(mypointer);                                            
        mypointer.DocName  :=fieldbyname('doctype').AsString;
        TreeAddItem(TreeView1,FieldLists,Node,mypointer,false,0);
        next;
      end;
    finally
      Fieldlists.Free;
      Node.Selected:=true;
    end;
  end;
end;



procedure TFram_PrjDoc.DeleteDoc;
begin
  if Listview1.Selected.Data=nil  then
  begin
    showmessage('请选择要删除的文件');
    exit ;
  end;
  if application.MessageBox('您确定要删除？','警告',MB_YESNO)= IDYES then
  begin
     if Dm_epm.ADOQry_doc.Locate('filename',Pfile(ListView1.Selected.Data)^.DocName,[])then
     try
        Dm_epm.ADOQry_doc.Delete;
        deletefile(Pfile(ListView1.Selected.Data)^.DocName);
        {QryWork(Dm_epm.adoqry_pub,
         'delete docinfo where prjcode='''+Prjid+''''
         +'and filename='''+Pfile(ListView1.Selected.Data)^.DocName+'''',false);}
          dispose( Listview1.Selected.Data);
          Listview1.Selected.Delete;
     except
        showmessage(ErrorHint);
        Exit;
     end;

  end;
end;

procedure TFram_PrjDoc.LinkDoc;
begin
   if  dm_epm.lindoc(prjid,1) then
   begin
     self.Init(prjid);
     showmessage('登记图档成功');
   end;
end;

procedure TFram_PrjDoc.Updatedoc;
begin
  if listview1.Selected.Data=nil then
  begin
    showmessage('请选择文件');
    exit ;
  end;
  if Dm_epm.ADOQry_doc.Locate('filename',Pfile(ListView1.Selected.Data)^.DocName,[])then
  begin
    application.CreateForm(Tfrm_newdoc,frm_newdoc);
    try
      dm_epm.ADOQry_doc.Edit;
      if frm_newdoc.ShowModal=mrok then
      begin
         dm_epm.ADOQry_doc.Post;
         ListView1.Selected.Caption:=frm_NewDoc.DBEdit1.Text;
         ListView1.Selected.SubItems[0]:=frm_NewDoc.DBComboBox1.Text;
         ListView1.Selected.SubItems[1]:=frm_NewDoc.DBEdit3.Text;
      end
      else dm_epm.ADOQry_doc.Cancel;
    finally
      frm_newdoc.Free;
    end;
  end;
end;

procedure TFram_PrjDoc.TreeView1Change(Sender: TObject; Node: TTreeNode);
var Fieldlists:TstringList;
    I:integer;
    Item:TlistItem;
    TempNode:TtreeNode;
    Pitem:Pfile;
    Csql:string;
begin
   if Node.HasChildren then
   begin
     ListView1.Items.Clear;
     TempNode:=Node.getFirstChild;
     with (ListView1.Items.Add) do
     begin
       Caption:=TempNode.Text;
       ImageIndex:=0;
     end;
     For I:=0 to Node.Count-1 do
     begin
      TempNode:=Node.GetNextChild(TempNode);
      if TempNode<>nil then
      with (ListView1.Items.Add) do
      begin
        Caption:=TempNode.Text;
        ImageIndex:=0;
      end;
     end;
     Listview1.ViewStyle:=vsIcon;
   end
   else if Node.Level>0 then
   begin
     Fieldlists:=Tstringlist.Create;
     try
       ListView1.Items.BeginUpdate;
       ListView1.Items.Clear;
       Csql := 'select * from docinfo where ssxmdm='''+prjid+''' and doctype='''+Node.Text+'''';
       Qrywork(Dm_epm.adoqry_pub,csql);
       with dm_epm.adoqry_pub do
       while not Eof do
       begin
         Fieldlists.Clear;
         Fieldlists.Add(fieldbyname('DocName').AsString);
         Fieldlists.Add(fieldbyname('Doctype').AsString);
         Fieldlists.Add(fieldbyname('CreateBy').AsString);
         Fieldlists.Add(fieldbyname('Createdate').AsString);
         Fieldlists.Add(fieldbyname('Version').AsString);
         new(Pitem);
         Pitem.DocName := fieldbyname('filename').AsString;
         Item := Additems(ListView1,Fieldlists,1);
         Item.Data := Pitem;
         next;
       end;
     finally
       Fieldlists.Free;
       ListView1.Items.EndUpdate;
       ListView1.ViewStyle:=vsreport;
     end;
     end;
end;

procedure TFram_PrjDoc.ListView1DblClick(Sender: TObject);
var tempNode:TTreeNode;
    I:integer;
begin
  if ListView1.Selected =nil then Exit;
  if TreeView1.Selected.HasChildren then
  begin
    TempNode := TreeView1.Selected.getFirstChild;
    if TempNode.Text =ListView1.Selected.Caption then
    begin
      TreeView1.Selected:=TempNode;
      Exit;
    end;
    for I := 0 to TreeView1.Selected.Count-1 do
    begin
      TempNode := TreeView1.Selected.GetNextChild(TempNode);
      if TempNode <> nil then
      if TempNode.Text = ListView1.Selected.Caption then
      begin
        TreeView1.Selected := TempNode;
        Break;
      end;
    end;
  end else  viewdoc.Execute;
end;

procedure TFram_PrjDoc.deldocExecute(Sender: TObject);
begin
   DeleteDoc;
end;

procedure TFram_PrjDoc.propdocExecute(Sender: TObject);
begin
   self.UpdateDoc;
end;

procedure TFram_PrjDoc.newdocExecute(Sender: TObject);
begin
   LinkDoc;
end;

procedure TFram_PrjDoc.viewdocExecute(Sender: TObject);
begin
  Previewdoc(Pfile(ListView1.Selected.Data)^.DocName);
end;

procedure TFram_PrjDoc.opendocExecute(Sender: TObject);
begin
   if listview1.Selected<>nil then
   ExecuteFile(Pfile(listview1.Selected.Data)^.DocName,'','',SW_SHOW );
end;

end.
