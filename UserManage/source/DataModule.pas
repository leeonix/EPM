unit DataModule;

interface

uses
  SysUtils, Classes, DB, ADODB, IniFiles;

type
  TDM = class(TDataModule)
    ADOconn: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ADOconnBeforeConnect(Sender: TObject);
  private
    FQry_Temp:TADOQuery;
    { Private declarations }
    Procedure ErrSaveToFile(ErrSQL:TStrings);
  public
    { Public declarations }
    Procedure QueryWork(SQLStream:String; SelAct:Boolean = True); Overload;
    Procedure QueryWork(SQLStream:TStrings; SelAct:Boolean = True); Overload;
    procedure QueryWork(SQLStream:String; RunQuery:TADOQuery; SelAct:Boolean = True); Overload;

    Property  DefQuery:TADOQuery Read FQry_Temp Write FQry_Temp;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

{ TDM }

procedure TDM.QueryWork(SQLStream: String; SelAct: Boolean);
begin
  with DefQuery do
  Begin
    if Active then Close;
    SQL.Clear;
    SQL.Add(SQLStream);
    try
      if SelAct then Open
      else ExecSQL;
    except
     // ErrSaveToFile(DefQuery.SQL);
    end;
  end;
end;

procedure TDM.QueryWork(SQLStream: TStrings; SelAct: Boolean);
begin
  with DefQuery do
  Begin
    if Active then Close;
    SQL.Clear;
    SQL.Assign(SQLStream);
    Try
      if SelAct then Open
      else ExecSQL;
    except
      //ErrSaveToFile(DefQuery.SQL);
    end;
  end;
end;

procedure TDM.QueryWork(SQLStream: String; RunQuery: TADOQuery; SelAct: Boolean);
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
      //ErrSaveToFile(DefQuery.SQL);
    end;
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  FQry_Temp := TADOQuery.Create(Nil);
  FQry_Temp.Connection := ADOconn;
  ADOconn.Open;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  if FQry_Temp.Active then
    FQry_Temp.Close;
  FQry_Temp.Free;
end;

procedure TDM.ADOconnBeforeConnect(Sender: TObject);
Var
  PassDB:TIniFile;
  ConnStr:WideString;
begin
  PassDB := TIniFile.Create('.\DBC.CON');
  try
    ConnStr := Trim(PassDB.ReadString('DataBase','Connection',''));
    if ConnStr = '' then ConnStr := PromptDataSource(0,Connstr);
    //if ConnStr = '' then Terminate
    //else
    Begin
      ADOconn.ConnectionString := ConnStr;
      PassDB.WriteString('DataBase','Connection',ConnStr);//
    end;
  finally
    PassDB.Free;
  end;
end;

procedure TDM.ErrSaveToFile(ErrSQL: TStrings);
begin

  //ErrSQL.SaveToFile(FormatDateTime('"ErrSQL "YYYY-MM-DD HH:MM:SSS',Now));

end;

end.
