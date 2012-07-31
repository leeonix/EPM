unit UDm;
{

 }
interface

uses
  SysUtils, Classes, DB, ADODB, Provider, IniFiles;

type
  TDm_flow = class(TDataModule)
    Adc_flow: TADOConnection;
    Dspcom: TDataSetProvider;
    Adqry_com: TADOQuery;
    Adqry_pub: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private

    { Private declarations }
  public
    procedure DelLink(const linkCode:string);
    procedure DelNode(const NodeCode:string);
    function  Getrollist(var RolCodeList:Tstringlist):TStringList;

    { Public declarations }
  end;

  procedure QueryWork(SQLStream: String; RunQuery: TAdoQuery; SelAct: Boolean);

var
  Dm_flow: TDm_flow;

implementation

{$R *.dfm}

procedure TDm_flow.DelLink(const LinkCode:string);
var csql:string;
begin
   csql := 'Delete flowdirection where direcode='''+linkcode+'''';
   QueryWork(csql,Adqry_com,False);

end;

// 给出角色列表
function  TDm_flow.Getrollist(var RolcodeList:Tstringlist):Tstringlist;
var cSql:string;
    TemList:TStringList;
begin
   temList := TStringList.Create;
   csql := 'Select rolid,rolename from jobrole ';
   QueryWork(csql,Adqry_com,true);
   with  Adqry_com do
   while not eof do
   begin
     temList.Add(fieldbyname('rolename').asstring);
     RolcodeList.Add(fieldbyname('rolid').asstring);
     Next;
   end;
   Result:= temList;


end;

// 删除节点和关联的流向
procedure TDm_flow.DelNode(const Nodecode:string);
var csql:string;
begin

   csql := 'delete flowdirection where aimtask='''+Nodecode+'''';
   csql := csql +' delete flowdirection where sourcetask='''+Nodecode+'''';
   csql :=csql+ ' Delete TaskNode where taskCode='''+Nodecode+'''';
   QueryWork(csql,Adqry_com,false);
end;

procedure QueryWork(SQLStream: String; RunQuery: TADOQuery; SelAct: Boolean);
begin
  with RunQuery do
  Begin
    if Active then Close;
    SQL.Clear;
    SQL.Add(SQLStream);
    try
      if SelAct then Open
      else ExecSQL;
    except
      abort;
    end;
  end;
end;

procedure TDm_flow.DataModuleCreate(Sender: TObject);
var Appconfig: TIniFile;
begin
  Appconfig:= TIniFile.Create('.\Appconfig.ini');
  try
    Adc_flow.ConnectionString := Appconfig.ReadString('SQLConnectionStrings','epmconn','');
       finally
     Appconfig.Free;
  end;

end;

end.
