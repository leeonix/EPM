{ *****************************************************************************
  Project:
  Description:    Data Access Layer Interface

  Author:       ³ÌÉÚ±ø
  CreateDate:   2005-05-03
  History:

 *****************************************************************************}
unit DataAccess;

interface

uses
  Classes,DB,ADoDb;

type

  IDataAccess = interface
    function  ConnectToDb:Boolean;
    function  RunSql(const SQLScript:String; var RecCount:integer):TDataset;


  end;

  TAdoDataAccess = class(TInterfacedObject,IDataAccess)
  private
    FAdoCnt:TADOConnection;
    FDataModule:TDataModule;
    FQuery:TADOQuery;
    FConnStr:string;
  public
    function  ConnectToDb:Boolean;
    function  RunSql(const SQLScript:string; var RecCount:integer):TDataset;
    constructor Create(const ConnStr:string);
    destructor Destroy; override;
  end;

implementation

uses Math;

{ TAdoDataAccess }

function TAdoDataAccess.ConnectToDb: Boolean;
begin

end;

constructor TAdoDataAccess.Create(const ConnStr:string);
begin
  FConnStr := ConnStr;
  FAdoCnt := TADOConnection.Create(nil);
  FAdoCnt.LoginPrompt := false;
  FAdoCnt.ConnectionString := FConnStr;
  FQuery := TADOQuery.Create(nil);
  FQuery.Connection := FAdoCnt;
end;

destructor TAdoDataAccess.Destroy;
begin
  FAdoCnt.Free;
  FQuery.Free;
  inherited;
end;

function TAdoDataAccess.RunSql(const SQLScript: string;
  var RecCount: integer): TDataset;
begin
  with FQuery do
  begin
    If Active then Close;
    SQL.Clear;
    SQL.Add(SQLScript);
    Active := True;
    if not IsEmpty then RecCount := RecordCount
    else RecCount :=0;
    Result := FQuery;
  end;
end;

end.
