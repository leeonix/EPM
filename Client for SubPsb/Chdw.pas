unit Chdw;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, dm,
  Dialogs, DB, ADODB, ExtCtrls, DBCtrls, Grids, DBGrids;

type
  Tfrm_chdw = class(TForm)
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
  frm_chdw: Tfrm_chdw;

implementation

{$R *.dfm}

procedure Tfrm_chdw.ADOQuery1AfterInsert(DataSet: TDataSet);
begin
   ADOQuery1.FieldByName('type').AsString := '²â»æ';
   ADOQuery1.FieldByName('code').AsString := Dm_Epm.Getcode;
end;

procedure Tfrm_chdw.FormCreate(Sender: TObject);
begin
  adoquery1.Active := true;
end;



end.
