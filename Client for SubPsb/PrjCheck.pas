unit PrjCheck;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, ImgList,dm,pubvar,Assets;

type
  TFram_prjcheck = class(TFrame)
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Panel3: TPanel;
    StaticText1: TStaticText;
    ListView1: TListView;
    Imglst_Larg: TImageList;
    procedure ListView1DblClick(Sender: TObject);
  private
    
    { Private declarations }
  public
    projectid:string;
    ProfessionType:string;
    //Fram_gdzc:TFram_gdzc;
    procedure Init(const Prjcode,DepartType:string);
    procedure InputCheckBod();
    procedure CheckInAsset();

    { Public declarations }
  end;

implementation

uses newitem, Prj_Design;

{$R *.dfm}

{ TFram_prjcheck }

procedure TFram_prjcheck.CheckInAsset;
begin
   frm_prjdesign.ShowAssets;
end;

procedure TFram_prjcheck.Init(const Prjcode, DepartType: string);
begin
  projectId := Prjcode;
  ProfessionType := DepartType;
  ListView1.Items[0].Caption := DepartType+'竣工验收单';
  ListView1.Items[1].Caption := DepartType+'资产变动明细';
end;

procedure TFram_prjcheck.InputCheckBod;
begin
   application.CreateForm(TFrm_New,Frm_New);
   try
     frm_new.Init('ysbg',ProjectId,ProfessionType);
     Frm_New.ShowModal;
   finally
     Frm_New.Free;
   end;
end;

procedure TFram_prjcheck.ListView1DblClick(Sender: TObject);
begin
  if listview1.Selected.Index=0 then
      InputCheckBod
  else if listview1.Selected.Index=1 then
     CheckInAsset;
end;

end.
