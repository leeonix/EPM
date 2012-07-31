{*****************************************************************************}
{                                                                             }
{                   市南供电公司工程管理集成                                  }
{                                                                             }
{            版权所有 (c) 2000,2001 晨辉科技                                  }
{                                                                             }
{*****************************************************************************}

unit Kymat;
{***************************************************************************
模块:  可研材料
描述:  项目主要材料录入和显示界面fram
版本:
日期: 2003-09－10
作者: tuzz
更新:
todo:
******************************************************************************}


interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dm,pubvar,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Provider,
  DBClient, Menus;

type
  TFram_Kymat = class(TFrame)
    Panel2: TPanel;
    StaticText1: TStaticText;
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1name: TStringField;
    ClientDataSet1spec: TStringField;
    ClientDataSet1unit: TStringField;
    ClientDataSet1NUM: TBCDField;
    ClientDataSet1NOTE: TStringField;
    ClientDataSet1MATID: TIntegerField;
    ClientDataSet1PRJCODE: TStringField;
    ClientDataSet1id: TAutoIncField;
    DataSetProvider1: TDataSetProvider;
    ADOqry_Kymat: TADOQuery;
    ADOQry_Kyprjmat: TADOQuery;
    ds_mat: TDataSource;
    ADOQry_KyprjmatPRJCODE: TStringField;
    ADOQry_KyprjmatMATID: TIntegerField;
    ADOQry_KyprjmatNUM: TBCDField;
    ADOQry_KyprjmatNOTE: TStringField;
    ADOQry_Kyprjmatid: TAutoIncField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ADOQry_KyprjmatPrice: TBCDField;
    ClientDataSet1Price: TBCDField;
    procedure ClientDataSet1BeforePost(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    PrjId:string;
    function AddMat():Boolean;
    function ModeMat():Boolean;
    function DelMat():Boolean;
    { Private declarations }
  public
     procedure Init(const Prjcode:string);
    { Public declarations }
  end;

implementation

uses MatInput;

{$R *.dfm}

{ TFram_Kymat }

function TFram_Kymat.AddMat: Boolean;
begin
   Application.CreateForm(Tfrm_selectMat,frm_selectMat);
   frm_selectMat.InputMode:=NewMode;
   frm_SelectMat.TargetDataset := ClientDataSet1;
   frm_SelectMat.DbTabletag :=1;
   try
     frm_selectMat.ShowModal;
   finally
     frm_selectMat.Free;
   end;
end;

function TFram_Kymat.DelMat: Boolean;
begin
    if not ClientDataSet1.IsEmpty   then 
     ClientDataSet1.Delete;
end;

procedure TFram_Kymat.Init(const Prjcode: string);
begin
  prjid:=prjcode;
  with ADOQry_KYPrjmat do
  begin
    active:=false;
    parameters.Items[0].Value:=prjcode;
    active:=true;
  end;
  clientdataset1.Data:=DataSetProvider1.Data;
end;

function TFram_Kymat.ModeMat: Boolean;
begin

end;

procedure TFram_Kymat.ClientDataSet1BeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('prjcode').AsString := prjid;
end;

procedure TFram_Kymat.BitBtn1Click(Sender: TObject);
begin
  ClientDataSet1.ApplyUpdates(0);
end;

procedure TFram_Kymat.N1Click(Sender: TObject);
begin
  self.AddMat;
end;

procedure TFram_Kymat.N2Click(Sender: TObject);
begin
  self.DelMat;
end;

procedure TFram_Kymat.N3Click(Sender: TObject);
begin
  //
end;

end.
