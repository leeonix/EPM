unit frm_designcompany;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, dm,
  Dialogs, DB, ADODB, ExtCtrls, DBCtrls, Grids, DBGrids;

type
  Tfrm_sjdw = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery1AfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_sjdw: Tfrm_sjdw;

implementation


{$R *.dfm}

procedure Tfrm_sjdw.ADOQuery1AfterInsert(DataSet: TDataSet);
begin
   ADOQuery1.FieldByName('type').AsString := '…Ëº∆';
   ADOQuery1.FieldByName('code').AsString := Dm_Epm.Getcode;
end;

procedure Tfrm_sjdw.FormCreate(Sender: TObject);
begin
  adoquery1.Active := true;
end;

end.
