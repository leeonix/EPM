
unit Budget;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls,Grids, DBGrids, DB, ADODB,DM,pubvar, ExtCtrls, StdCtrls, Buttons,
  DBCtrls, Mask,FmxUtils,types, Menus, ImgList,treefram;

type
  TFram_Budget = class(TFrame)
    Adoqry_buddoc: TADOQuery;
    OpenDialog1: TOpenDialog;
    adoqry_buddocSSXMDM: TStringField;
    adoqry_buddocDOCNAME: TStringField;
    adoqry_buddocDOCTYPE: TStringField;
    adoqry_buddocCREATEBY: TStringField;
    adoqry_buddocFILENAME: TStringField;
    adoqry_buddocVERSION: TStringField;
    adoqry_buddocCREATEDATE: TDateTimeField;
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    ImageList2: TImageList;
    adoqry_buddocBUDCHECKBY: TStringField;
    adoqry_buddocBUDCHECKDATE: TDateTimeField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    ListView1: TListView;
    Panel3: TPanel;
    StaticText1: TStaticText;
    procedure ADOqry_buddocBeforePost(DataSet: TDataSet);
    procedure BitBtn12Click(Sender: TObject);
    procedure adoqry_buddocAfterInsert(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    projectcode:string;
    procedure Init(const Prjcode:string);
    function  Addbud():Boolean;   //增加预算项目
    function  Delbud():Boolean;   //删除预算项目
    function  Addbudoc():Boolean; //连接预算书
    function  DelBudDoc():Boolean;//删除预算书
    function  ModBud():Boolean;   //修改预算
    function  ViewBuddoc():Boolean;
    procedure OpenBuddoc();
    { Public declarations }
  end;

var Fram_Budget:TFram_Budget;

implementation

uses  Buddoc,  BudgetInput, Prj_Design;

{$R *.dfm}

{ TFram_BUDGET }

procedure TFram_Budget.Init(const Prjcode: string);
var  columns,fieldlist:Tstringlist; Newitem:TlistItem;
     filename:string; mypointer:Pfile;
begin
   Projectcode := Prjcode;
   Dm_Epm.Adoqry_bud.Active := false;
   Dm_Epm.Adoqry_bud.Parameters.ParamByName('mycode').Value := prjcode;
   Dm_Epm.Adoqry_bud.Active := true;
   Adoqry_buddoc.Active := false;
   Adoqry_buddoc.Parameters.ParamByName('mycode').Value := prjcode;
   Adoqry_buddoc.Active := true;
   Columns:=Tstringlist.Create;
   Fieldlist:=Tstringlist.Create;
   try
    { Columns.Add('预算书名称');
     Columns.Add('编制人');
     Columns.Add('编制日期');
     Columns.Add('审核人');
     Columns.Add('审核日期');
     AddLsvColumn(ListView1,columns); }
     while not Adoqry_BudDoc.Eof do
     begin
        Fieldlist.Clear;
        Fieldlist.Add(Adoqry_buddoc.fieldbyname('docname').asstring);
        Fieldlist.Add(Adoqry_buddoc.fieldbyname('createby').asstring);
        Fieldlist.Add(Adoqry_buddoc.fieldbyname('createdate').asstring);
        Fieldlist.Add(Adoqry_buddoc.fieldbyname('budcheckby').asstring);
        Fieldlist.Add(Adoqry_buddoc.fieldbyname('budcheckdate').asstring);
        FileName := Adoqry_Buddoc.fieldbyname('filename').asstring;
        New(Mypointer);
        Mypointer.DocName := FileName;
        Newitem := AddItems(ListView1,FieldList,0);
        Newitem.Data := Mypointer;
        Adoqry_buddoc.Next;
     end;
     //ListView1.ViewStyle:=vsreport;
   finally
     Columns.Free;
     FieldList.Free;
   end;
end;

procedure TFram_Budget.ADOqry_buddocBeforePost(DataSet: TDataSet);
begin
  Adoqry_BudDoc.FieldByName('ssxmdm').AsString := projectcode;
end;

procedure TFram_Budget.BitBtn12Click(Sender: TObject);
begin
  if not ADOQry_BudDoc.IsEmpty then
  ExecuteFile(adoqry_BudDoc.FieldbyName('filename').AsString,'','',SW_SHOW	);
end;

procedure TFram_Budget.adoqry_buddocAfterInsert(DataSet: TDataSet);
begin
  Adoqry_buddoc.FieldByName('VerSion').AsString := '1';
  Adoqry_buddoc.FieldByName('CreateBy').AsString := loginuser;
  Adoqry_buddoc.FieldByName('CreateDate').Asstring := formatdatetime('yyyy-mm-dd',gettime);
  Adoqry_buddoc.FieldByName('DocType').AsString := '预算书';
end;

function TFram_Budget.Addbud: boolean;
begin
  application.CreateForm(Tfrm_InputBud,frm_InputBud);
  try
    frm_InputBud.Prjcode:=projectcode;
    frm_InputBud.InputMode:=NewMode;
    frm_InputBud.Edt_k1.Enabled:=false;
    frm_InputBud.ShowModal;
  finally
    frm_InputBud.Free;
    Dm_Epm.Adoqry_bud.DisableControls;
    Dm_Epm.Adoqry_bud.Close;
    Dm_Epm.Adoqry_bud.Active := True;
    Dm_Epm.Adoqry_bud.EnableControls;
  end;

end;

function TFram_Budget.Addbudoc: boolean;
var Desfile:string; Newitem:TlistItem;
    P:Pfile;
begin
  Result:= False;
  if OpenDialog1.Execute then
  begin
    Application.CreateForm(TFrm_Buddoc,Frm_Buddoc);
    try
      if Frm_buddoc.ShowModal=mrok then
      begin
        Adoqry_buddoc.Insert;
        Desfile := filepath+loginuser+'\预算书\'+projectcode+Frm_buddoc.cb_budtype.Text
                  +extractfileext(OpenDialog1.FileName);
        try
          Copyfile(opendialog1.FileName,desfile);
        except
          Adoqry_buddoc.Cancel;
          Showmessage('不能复制或移动图档');
          Exit;
        end;
        Adoqry_buddoc.FieldByName('DocName').AsString:=Frm_buddoc.cb_budtype.Text;
        Adoqry_buddoc.FieldByName('FileName').AsString:=desfile;
        Adoqry_buddoc.Post;
        with listView1 do
        begin
          Newitem:=items.Add;
          new(P);
          P.DocName:= desfile;
          NewItem.Data:=p;
          Newitem.Caption:=Frm_buddoc.cb_budtype.Text;
        end;
      end;
      Result:=true;
    finally
       Frm_buddoc.Free;
    end;
  end;
end;

function TFram_Budget.Delbud: boolean;
var csql:string;
begin
  if Dm_Epm.Adoqry_bud.IsEmpty then exit;
  if MessageBox(self.Handle,DelConfirm,'Easy Project'
                                ,MB_YESNO+MB_ICONWARNING)<>IdYes then  exit;
  cSql := 'exec deletebud '''+projectcode+''','''+Dm_Epm.Adoqry_bud.fieldbyname('buditem').AsString+'''';
  try
    qrywork(dm_epm.adoqry_input,csql,False);
  except
    showmessage(ErrorHint);
    Result := False;
    exit;
  end;
  Dm_Epm.Adoqry_bud.Close;
  Dm_Epm.Adoqry_bud.Open;
  Result:=true;
end;

function TFram_Budget.DelBudDoc: boolean;
var FileName,Csql:string;
begin
  Result := False;
  if  listview1.Selected=nil then
  begin
   showmessage('首先要选择要删除的预算书');
   exit;
  end;
  if MessageBox(self.Handle,DelConfirm,'Easy Project'
                                ,MB_YESNO+MB_ICONWARNING)<>IdYes then
     exit;

  FileName :=Pfile(listview1.Selected.Data)^.DocName;
  Csql := 'delete docinfo where ssxmdm='''+projectcode+''' and doctype=''预算书'' '
         +'and filename='''+filename+'''';
  try
    qrywork(dm_epm.adoqry_pub,Csql,false);
    Deletefile(filename);
    Adoqry_buddoc.DisableControls;
    Adoqry_buddoc.Active := false;
    Adoqry_buddoc.Active := true;
    Adoqry_buddoc.EnableControls;
    dispose(Listview1.Selected.Data);
    listview1.Selected.Delete;
  except
     showmessage(ErrorHint);
     exit;
  end;
  Result:=True;
end;

function TFram_Budget.ModBud: Boolean;
begin
  if dm_epm.adoqry_bud.IsEmpty then exit;
  application.CreateForm(Tfrm_InputBud,frm_InputBud);
  try
    frm_InputBud.cbx_item.Text := Dm_Epm.Adoqry_bud.fieldbyname('buditem').AsString;
    frm_InputBud.edt_budfee.Text := Dm_Epm.Adoqry_bud.fieldbyname('budfee').AsString;
    frm_InputBud.Edt_desfee.Text := Dm_Epm.Adoqry_bud.fieldbyname('FeeNum').AsString;
    frm_InputBud.Edt_k1.Text := Dm_Epm.Adoqry_bud.fieldbyname('Item_K1').AsString;
    frm_InputBud.Prjcode := projectcode;
    frm_InputBud.InputMode := EditMode;
    frm_InputBud.Edt_k1.Enabled:=false;
    frm_InputBud.Bitn_savenew.Enabled := False;
    frm_InputBud.Originitem:= Dm_Epm.Adoqry_bud.fieldbyname('buditem').AsString;
    frm_InputBud.ShowModal;
  finally
    Dm_Epm.Adoqry_bud.DisableControls;
    Dm_Epm.Adoqry_bud.Close;
    Dm_Epm.Adoqry_bud.Active := True;
    Dm_Epm.Adoqry_bud.EnableControls;
    frm_InputBud.Free;
  end;
end;

procedure TFram_Budget.DBGrid1DblClick(Sender: TObject);
begin
    modbud;
end;

function TFram_Budget.ViewBuddoc: Boolean;
begin
  Result:=False;
  if listview1.Selected=nil then exit;
  try
   Previewdoc(Pfile(listview1.Selected.Data)^.DocName);
  except
    showmessage(ErrorHint);
    exit;
  end;
  Result := True;
end;

procedure TFram_Budget.OpenBuddoc;
begin
  if listview1.Selected<>nil then
  ExecuteFile(Pfile(listview1.Selected.Data)^.DocName,'','',SW_SHOW );

end;

end.
