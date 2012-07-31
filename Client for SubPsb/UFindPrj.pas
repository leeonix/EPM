unit UFindPrj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,dm,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, ExtCtrls, RzDlgBtn, RzPanel;

type
  Tfrm_findprj = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    RzDialogButtons1: TRzDialogButtons;
    Edit1: TEdit;
    Edit2: TEdit;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    qry_find: TADOQuery;
    DataSource1: TDataSource;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_findprj: Tfrm_findprj;

implementation

{$R *.dfm}

procedure Tfrm_findprj.Button1Click(Sender: TObject);
var strcon:string;
begin
  strcon:='select prjcode,prjaccount,prjname,prjadd,lxr,lxdh from projectinfo'
   +' where corpcode=''2'' and (parentcode='''' or parentcode is null)' ;
  if trim(Edit1.Text)<>'' then  strcon:= strcon + 'and prjaccount like ''%'+trim(Edit1.Text)+'%''' ;
  if trim(Edit2.Text)<>'' then  strcon:= strcon + 'and prjname like ''%'+trim(Edit2.Text)+'%''' ;
  with qry_find do
  begin
     Close;
     SQL.Clear;
     SQL.Add(strcon);
     Open;
  end;
end;

end.
