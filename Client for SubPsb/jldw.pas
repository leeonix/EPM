unit jldw;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, dm,
  Dialogs, DB, ADODB, ExtCtrls, DBCtrls, Grids, DBGrids;

type
  Tfrm_jldw = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure ADOQuery1AfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_jldw: Tfrm_jldw;

implementation

{$R *.dfm}

procedure Tfrm_jldw.ADOQuery1AfterInsert(DataSet: TDataSet);
begin
   ADOQuery1.FieldByName('type').AsString := 'º‡¿Ì';
   ADOQuery1.FieldByName('code').AsString := Dm_Epm.Getcode;
end;

procedure Tfrm_jldw.FormCreate(Sender: TObject);
begin
  adoquery1.Active := true;
end;

end.
