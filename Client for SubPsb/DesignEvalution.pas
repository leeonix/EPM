

unit DesignEvalution;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,dm,pubvar,
  StdCtrls, Grids, DBGrids, ExtCtrls, Buttons;

type
  TFram_DesignEva = class(TFrame)
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Panel3: TPanel;
    StaticText1: TStaticText;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    Edt_fz: TEdit;
    Label3: TLabel;
    Edt_k2: TEdit;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    projectcode:string;
    procedure Init(const Prjcode:string);
    function  SetK1():Boolean;
    { Public declarations }
  end;

implementation

uses MAIN, BudgetInput;

{$R *.dfm}

procedure TFram_DesignEva.Init(const Prjcode: string);
var cSql:string;
begin
   Projectcode := Prjcode;
   Dm_Epm.Adoqry_bud.Active := false;
   Dm_Epm.Adoqry_bud.Parameters.ParamByName('mycode').Value := prjcode;
   Dm_Epm.Adoqry_bud.Active := true;
   csql:='select * from designinfo where prjcode='''+projectcode+'''';
   qrywork(dm_epm.adoqry_pub,csql);
   edt_k2.Text:=dm_epm.adoqry_pub.fieldbyname('k2').AsString;
   edt_fz.Text:=dm_epm.adoqry_pub.fieldbyname('DESIGNVALUE').AsString;
   SpeedButton1.Enabled := permission=5;
   SpeedButton2.Enabled := permission=5;
end;

procedure TFram_DesignEva.SpeedButton1Click(Sender: TObject);
var s,s0,k2,bzfz:Double;
    gcxz:string;
begin
   gcxz := Ptaskinfo(frm_main.Lsv_Task.Selected.data)^.prjtype;
   s := 0;
   with Dm_Epm.Adoqry_bud do
   begin
     first;
     while not eof do
     begin
       s := s+fieldbyname('budfee').AsFloat*fieldbyname('item_k1').AsFloat;
       next;
     end;
   end;
   s := s/1000;
   s0 := s/10;
   bzfz := 0;
   k2 := 0;
   if s0 <= 10 then
   begin
     k2 := 1;
     bzfz := s * k2;
     If bzfz < 30 Then   bzfz := 30;
   end;
   if (s0 > 10) and (s0 <= 50) then
   begin
     k2 := 0.8;
     bzfz := k2 * s;
     If bzfz < 100 Then bzfz := 100;
   end;
   if (s0 > 50) and (s0 <= 100) then
   begin
     k2 := 0.6;
     bzfz := k2 * s;
     If bzfz < 400 Then bzfz := 400;
   end;
   if s0>100 then
   begin
     if (gcxz = '基建') or (gcxz = '技改') then
        k2 := 0.5
     Else k2 := 0.4;
     bzfz := k2 * s;
     If bzfz < 600 Then bzfz := 600;
   end;
   if gcxz='代工' then bzfz := bzfz+10;
   Edt_fz.Text:=inttostr(round(bzfz));
   Edt_k2.Text:=floattostr(k2);
end;

procedure TFram_DesignEva.SpeedButton2Click(Sender: TObject);
var csql:string;
begin
  csql:='select * from designinfo where prjcode='''+projectcode+'''';
  qrywork(dm_epm.adoqry_pub,csql);
  with dm_epm.adoqry_pub do
  begin
    if IsEmpty then    append
    else Edit;
    FieldByName('DESIGNVALUE').AsString:= trim(edt_fz.Text);
    FieldByName('k2').AsString:= trim(edt_k2.Text);
    FieldByName('prjcode').AsString:= projectcode;
    Post;
    showmessage(SucsaveMessage);
  end;
end;

procedure TFram_DesignEva.DBGrid1DblClick(Sender: TObject);
begin
  if permission=5 then
    SetK1
  else
    showmessage('只有设计室主任才可以设置系数');
end;

function TFram_DesignEva.SetK1: Boolean;
begin
  if dm_epm.adoqry_bud.IsEmpty then exit;
  application.CreateForm(Tfrm_InputBud,frm_InputBud);
  try
    frm_InputBud.edt_budfee.Enabled:=false;
    frm_InputBud.Edt_desfee.Enabled:=false;
    frm_InputBud.cbx_item.Text := Dm_Epm.Adoqry_bud.fieldbyname('buditem').AsString;
    frm_InputBud.edt_budfee.Text := Dm_Epm.Adoqry_bud.fieldbyname('budfee').AsString;
    frm_InputBud.Edt_desfee.Text := Dm_Epm.Adoqry_bud.fieldbyname('FeeNum').AsString;
    frm_InputBud.Edt_k1.Text := Dm_Epm.Adoqry_bud.fieldbyname('Item_K1').AsString;
    frm_InputBud.Prjcode := projectcode;
    frm_InputBud.InputMode := EditMode;
    frm_InputBud.Bitn_savenew.Enabled := False;
    frm_InputBud.Originitem:= Dm_Epm.Adoqry_bud.fieldbyname('buditem').AsString;
    frm_InputBud.ShowModal;
  finally
    Dm_Epm.Adoqry_bud.DisableControls;
    Dm_Epm.Adoqry_bud.Close;
    Dm_Epm.Adoqry_bud.Active := True;
    Dm_Epm.Adoqry_bud.EnableControls;
    frm_InputBud.Free;
  end;
end;

end.
