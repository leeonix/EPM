{*****************************************************************************}
{                                                                             }
{                   市南供电公司工程管理集成                                  }
{                                                                             }
{            版权所有 (c) 2000,2001 晨辉科技                                  }
{                                                                             }
{*****************************************************************************}

unit Kybg;

{***************************************************************************
模块:  可研报告
描述:  项目可研报告及主要材料录入和显示界面fram
版本:
日期: 2003-05-12
作者: tuzz
更新:
todo:
******************************************************************************}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, cxBlobEdit, cxDropDownEdit, cxCalc, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxControls, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, DB, cxDBData, cxCalendar, cxMemo, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,dm, pubvar,
  cxLookAndFeelPainters, ADODB, cxButtons, ExtCtrls, cxHyperLinkEdit,
  cxGridDBTableView, cxGrid, cxDBEditRepository, cxNavigator, Kymat, Menus,
  Buttons, Grids, DBGrids, cxSpinEdit, MyReport;

type
  TFram_kybg = class(TFrame)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    prjname: TcxTextEdit;
    xzdm: TcxLookupComboBox;
    primaterial: TcxBlobEdit;
    Label4: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    kypfrq: TcxDateEdit;
    prjaccount: TcxTextEdit;
    Label12: TLabel;
    pwnumber: TcxHyperLinkEdit;
    Bevel1: TBevel;
    Label13: TLabel;
    Label14: TLabel;
    Kydoc: TcxHyperLinkEdit;
    cxButton1: TcxButton;
    Adotbl_xzdm: TADOTable;
    ds_xzdm: TDataSource;
    gstz: TcxCalcEdit;
    Label6: TLabel;
    Bevel3: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    Startdate: TcxDateEdit;
    Enddate: TcxDateEdit;
    Label15: TLabel;
    constructby: TcxComboBox;
    designcorp: TcxComboBox;
    procedure cxButton1Click(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure KydocClick(Sender: TObject);
    procedure Adoqry_primatBeforePost(DataSet: TDataSet);
    procedure xzdmEnter(Sender: TObject);
    procedure constructbyEnter(Sender: TObject);
    procedure pwnumberClick(Sender: TObject);
  private
    ProjectCode:string;
    procedure Initcomboxitem(sender:Tcxcombobox;Corptype:string);
    { Private declarations }
  public
    { Public declarations }
    InputMode:Integer;
    Saved:boolean;
    procedure Init(const Prjcode,Executor,Node:string);
    function SaveInfo:Boolean;
  end;

implementation

{$R *.dfm}

{ TFram_kybg }

procedure TFram_kybg.Init(const Prjcode, executor, Node: string);
var csql:string;
begin
  ProjectCode:=Prjcode;
  csql:='select prjname,xzdm,PRIMMATERIAL,gstz,constructby,designcompany,kypfrq,prjaccount,'
        +' A.PwNuber,StartDate,EndDate,ApprovDate '
        +' from ProjectInfo a  '
        +' left join kypw b on a.pwnuber=b.pwnuber '
        +' where  prjcode='''+Prjcode+'''';
  Adotbl_xzdm.Open;
  QryWork(dm_epm.adoqry_pub,csql);
  prjname.Text := dm_epm.adoqry_pub.fieldbyname('prjname').AsString ;
  xzdm.EditValue  :=  dm_epm.adoqry_pub.fieldbyname('xzdm').AsString ;
  primaterial.Text :=  dm_epm.adoqry_pub.fieldbyname('PRIMMATERIAL').AsString ;
  gstz.Text := dm_epm.adoqry_pub.fieldbyname('gstz').AsString ;
  constructby.Text := dm_epm.adoqry_pub.fieldbyname('constructby').AsString ;
  designcorp.EditValue := dm_epm.adoqry_pub.fieldbyname('designcompany').AsString ;
  kypfrq.Text := dm_epm.adoqry_pub.fieldbyname('kypfrq').AsString ;
  prjaccount.Text := dm_epm.adoqry_pub.fieldbyname('prjaccount').AsString ;
  pwnumber.Text := dm_epm.adoqry_pub.fieldbyname('PwNuber').AsString ;
  if  not  dm_epm.adoqry_pub.FieldByName('ApprovDate').IsNull then
   kypfrq.EditValue := dm_epm.adoqry_pub.FieldByName('ApprovDate').AsDateTime ;
  if not dm_epm.adoqry_pub.FieldByName('StartDate').IsNull then
   Startdate.EditValue := dm_epm.adoqry_pub.FieldByName('StartDate').AsDateTime ;
  if not dm_epm.adoqry_pub.FieldByName('Enddate').IsNull then
   Enddate.EditValue := dm_epm.adoqry_pub.FieldByName('Enddate').AsDateTime ;
  CSQL := 'select 1 from projectinfo where prjcode='''+Prjcode+''' and kydoc is null';
  QryWork(Dm_Epm.adoqry_pub,csql);
  if not  Dm_Epm.adoqry_pub.IsEmpty then
    kydoc.Text :=''
  else
    kydoc.Text:='查看可研报告';
  

  if (Permission=4) or(Permission=5) or (Loginuser=Executor)  then
    InputMode := EditMode
  else
    InputMode := BroswerMode;
end;

// 保存可研申请信息；
function TFram_kybg.SaveInfo: Boolean;
var ctemp,cSql,Uploadssql:string;
    Executors:TstringList;

function CheckInput:Boolean;
begin
   Result := False;
   if (prjname.Text='') or (primaterial.Text='') or (gstz.Text='')
     or (xzdm.Text='') then
   begin
     ShowMessage('必须输入项目名称、项目性质、项目内容及可研报告');
     prjname.SelectAll;
     prjname.SetFocus;
     exit;
   end;
   Result := True;
end;
begin
   Result := false;
   cSql :='select PrjName,PrjCode,PRIMMATERIAL,Prjaccount,CorpCode,CONSTRUCTBY,DESIGNCOMPANY,'
        +'gstz,xzdm,Startdate,Enddate,PRJTYPE,KYDOC from projectinfo' ;
   Uploadssql := 'select kydoc,prjcode from projectinfo ' ;
   if InputMode=Newmode then
   begin
     if not CheckInput  then exit;
     ctemp:= dm.Dm_Epm.GetnewitemNo('P006');
     with dm_epm.adoqry_input do
     begin
       if active then close;
       sql.Clear;
       sql.Add(cSql+' where prjcode='''+ctemp+'''');
       open;
       if isempty then append;
       try
         FieldByName('prjcode').AsString  := ctemp;
         FieldByName('prjname').AsString  := trim(prjname.Text);
         FieldByName('PRIMMATERIAL').AsString  := primaterial.Text;
         FieldByName('CorpCode').AsString      := CurCorpCode;
         FieldByName('CONSTRUCTBY').AsString   := CONSTRUCTBY.EditValue;
         FieldByName('DESIGNCOMPANY').AsString := designcorp.EditValue;
         FieldByName('prjtype').AsString   := '006';
         FieldByName('gstz').AsString      := gstz.EditValue;
         FieldByName('xzdm').AsString      := xzdm.EditValue;
         FieldByName('Startdate').AsString := Startdate.EditText;
         FieldByName('Enddate').AsString   := Enddate.EditText;
          if kydoc.Text<>'' then
         Tblobfield(FieldByName('kydoc')).LoadFromFile(Kydoc.Text);
         Post;
         ProjectCode := ctemp;
         Executors:=TstringList.Create;
         Executors.Add(LoginUser);
         SettaskNode(ctemp,'050101','',Executors);
         Executors.Free;
         dm_epm.setflowlog(ctemp,'','提出可研报告',
                                '050101',loginuser,nil);
         showmessage('数据保存成功');
         Saved := true;
         Result :=true;
       except
         showmessage(ErrorHint);
         cancel;
       end;
     end;
   end
   else if InputMode= EditMode then
   with dm_epm.adoqry_input do
   begin
      if not CheckInput  then exit;
     if active then close;
     sql.Clear;
     sql.Add(csql+' where prjcode='''+projectcode+'''');
     open;
     if not isempty then edit;
     try
       FieldbyName('prjname').AsString  := Trim(prjname.Text);
       FieldbyName('PRIMMATERIAL').AsString := Primaterial.Text;
       FieldbyName('CorpCode').AsString  := CurCorpCode;
       FieldbyName('CONSTRUCTBY').AsString  := CONSTRUCTBY.EditValue;
       FieldbyName('DESIGNCOMPANY').AsString := DesignCorp.EditValue;
       FieldbyName('gstz').AsString := trim(gstz.Text);
       FieldbyName('xzdm').AsString := xzdm.EditValue;
       if Startdate.Text<>'' then FieldByName('Startdate').AsString := Startdate.EditValue;
       if Enddate.Text<>'' then FieldByName('Enddate').AsString := Enddate.EditValue;
       FieldByName('Prjaccount').AsString := prjaccount.Text;
       if (Kydoc.Text<>'查看可研报告') and (Kydoc.Text<>'') then
          TBlobField(FieldByName('kydoc')).LoadFromFile(Kydoc.Text);
       Post;
       Result:=true;
       showmessage('数据保存成功');
     except
       showmessage(ErrorHint);
       cancel;
     end;
   end;
end;

procedure TFram_kybg.cxButton1Click(Sender: TObject);
begin
 if Dm_epm.opendlg.Execute then
    kydoc.Text:= dm_epm.opendlg.FileName;
end;

procedure TFram_kybg.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
   if InputMode=NewMode then
   if not saved then  allowchange := SaveInfo ;

end;

procedure TFram_kybg.KydocClick(Sender: TObject);
var csql:string;
begin
  if kydoc.Text <> '查看可研报告' then Previewdoc(kydoc.Text)
  else  begin
   csql:='select * from projectinfo  where  prjcode='''+projectcode+'''';
   qrywork(Dm_epm.Adoqry_Pub,cSql);
   Tblobfield(Dm_epm.Adoqry_pub.FieldbyName('kydoc')).SaveToFile('c:\tempkybg.doc');
   Previewdoc('c:\tempkybg.doc');
  end;
end;
procedure TFram_kybg.Adoqry_primatBeforePost(DataSet: TDataSet);
begin
  Dataset.FieldByName('prjcode').AsString := ProjectCode;
end;

procedure TFram_kybg.xzdmEnter(Sender: TObject);
begin
 if not Adotbl_xzdm.Active then
   Adotbl_xzdm.Active:= true;
end;

procedure TFram_kybg.constructbyEnter(Sender: TObject);
begin
 Initcomboxitem(TcxComboBox(sender),TcxComboBox(sender).Hint);
end;

procedure TFram_kybg.pwnumberClick(Sender: TObject);
var csql,FileName:string;
begin
  if pwnumber.Text <> '' then
  begin
   csql:='select * from kypw  where  pwnuber='''+trim(pwnumber.Text)+'''';
   qrywork(Dm_epm.Adoqry_Pub,cSql);
   FileName := 'c:\temp.'+Dm_epm.Adoqry_pub.FieldbyName('extension').asstring;
   Tblobfield(Dm_epm.Adoqry_pub.FieldbyName('document')).SaveToFile(FileName);
   Previewdoc(FileName);
  end;
end;

procedure TFram_kybg.Initcomboxitem(sender:Tcxcombobox;Corptype: string);
var
   csql:string;
   tempstrings:Tstringlist;
begin
  if Corptype ='设计' then
  csql := 'select name from corp where type=''设计'''
  else csql := 'select name from corp where type=''建设''';
  QryWork(Dm_Epm.adoqry_pub,csql);
  tempstrings := Tstringlist.Create;
  while not Dm_Epm.adoqry_pub.Eof do
  begin
    tempstrings.Add(Dm_Epm.adoqry_pub.fieldByName('name').AsString);
    Dm_Epm.adoqry_pub.Next;
  end;

  with sender.Properties  do
  begin
     Items.Clear;
     Items.AddStrings(tempstrings);
  end;
 tempstrings.Free;
end;

end.
