unit Assets;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,dm,pubvar,
   DBGrids, StdCtrls, DB, ADODB,FmxUtils, ExtCtrls, Grids;

type
  TFram_gdzc = class(TFrame)
    DBGrid1: TDBGrid;
    Adoqry_assets: TADOQuery;
    DataSource1: TDataSource;
    OpenDialog1: TOpenDialog;
    Adoqry_assetsid: TIntegerField;
    Adoqry_assetsDOCNAME: TStringField;
    Adoqry_assetsDOCTYPE: TStringField;
    Adoqry_assetsCREATEBY: TStringField;
    Adoqry_assetsFILENAME: TStringField;
    Adoqry_assetsCREATEDATE: TDateTimeField;
    Adoqry_assetsSSXMDM: TStringField;
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Panel2: TPanel;
    StaticText1: TStaticText;
    procedure Adoqry_assetsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    projectcode:string;
    procedure Init(const Prjcode:string);
    procedure AddBos();
    procedure DelBos();
    procedure OpenBos();
    function ViewBos():Boolean;

    { Public declarations }
  end;

implementation

uses Asset_add, Prj_Design;

{$R *.dfm}

procedure TFram_gdzc.Init(const Prjcode: string);
begin
   Projectcode:=Prjcode;
   Adoqry_assets.Active:=false;
   Adoqry_assets.Parameters.ParamByName('mycode').Value:=prjcode;
   Adoqry_assets.Active:=true;
end;

procedure TFram_gdzc.Adoqry_assetsCalcFields(DataSet: TDataSet);
begin
  Adoqry_assetsid.Value:=ADOQry_assets.recno;
  if ADOQry_assets.recno=-1 then
     ADOQry_assetsid.Value:=1;

end;

procedure TFram_gdzc.AddBos;
var Desfile:string;

begin
 if OpenDialog1.Execute then
 begin
   application.CreateForm(TFrm_AddAssets,Frm_AddAssets);
   try
     if Frm_AddAssets.ShowModal=mrok then
     begin
        Adoqry_assets.Append;
        Desfile:=filepath+loginuser+'\增资明细表\'+projectcode+Frm_AddAssets.cb_type.Text
                  +extractfileext(OpenDialog1.FileName);
        try
          Copyfile(opendialog1.FileName,desfile);
        except
          Adoqry_assets.Cancel;
          Showmessage('不能复制或移动图档');
          Exit;
        end;
        Adoqry_assets.FieldByName('doctype').AsString:='增资明细表';
        Adoqry_assets.FieldByName('docname').AsString:=frm_AddAssets.cb_type.text;
        Adoqry_assets.FieldByName('createby').AsString:=Loginuser;
        Adoqry_assets.FieldByName('filename').AsString:=desfile;
        Adoqry_assets.FieldByName('createdate').AsDateTime:=gettime;
        Adoqry_assets.FieldByName('ssxmdm').AsString:=projectcode;
        Adoqry_assets.post;

     end
   finally
     Frm_AddAssets.Free;
   end;
 end;
end;

procedure TFram_gdzc.DelBos;
begin
  if not Adoqry_assets.IsEmpty then
   if MessageBox(self.Handle,DelConfirm,'Easy Project'
                                ,MB_YESNO+MB_ICONWARNING)=IdYes then
  begin
    Deletefile(ADOQry_assets.fieldbyname('filename').AsString);
    Adoqry_assets.Delete;
  end;
end;

procedure TFram_gdzc.OpenBos;
begin
   if not ADOQry_Assets.IsEmpty then
   ExecuteFile(adoqry_Assets.fieldbyname('filename').AsString,'','',SW_SHOW	);
end;

function TFram_gdzc.ViewBos: Boolean;
begin
  Result:=False;
  if Adoqry_assets.IsEmpty then exit;
  try
   Previewdoc(Adoqry_assets.fieldbyname('filename').AsString);
  except
    Showmessage(ErrorHint);
    Exit;
  end;
  Result:=True;
end;

end.

