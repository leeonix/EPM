unit PrjPlan;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,StrUtils,
  Grids, DBGrids, StdCtrls, ExtCtrls,dm,pubvar, Buttons;

type
 
  TFram_Prjplan = class(TFrame)
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Panel2: TPanel;
    StaticText1: TStaticText;
    DBGrid1: TDBGrid;
  private
    { Private declarations }

  public
     projectid:string;
     function AddPlan():Boolean;
     function DelPlan():Boolean;
     function UpdatePlan():Boolean;
     procedure Init(const Prjcode:string);
    { Public declarations }
  end;
  function getid(const idtype,sgtype: string): string;

implementation

uses frmplan, Prj_Design;

{$R *.dfm}

{ TFram_Prjplan }

function TFram_Prjplan.AddPlan: Boolean;
begin
  application.CreateForm(Tfrm_plan,frm_plan);
  try
    frm_plan.show(Newmode);
    if frm_plan.showmodal=mrok then
      with dm_epm do
      begin
        adoqry_plan.Insert;
        adoqry_plan.FieldByName('sgdw').AsString:=trim(frm_plan.cb_sgdw.Text);
       // adoqry_plan.FieldByName('AccCorpcode').AsString:=frm_plan.Sncode;
       // adoqry_plan.FieldByName('sglb').AsString:=trim(frm_plan.cb_sgtype.Text);
        adoqry_plan.FieldByName('jhkgrq').AsDateTime:=frm_plan.jhkgrq.Date;
        adoqry_plan.FieldByName('jhjgrq').AsDateTime:=frm_plan.jhjgrq.Date;
        adoqry_plan.FieldByName('prjcode').AsString:=projectid;
        adoqry_plan.Post;
      end;
  finally
    frm_plan.free;
  end;
end;

function TFram_Prjplan.DelPlan: Boolean;
var csql,prjcode,sglb,sgdw:string;
begin
  if application.MessageBox('您确定要删除？','警告',MB_YESNO)= IDYES then
  if not  dm_epm.adoqry_plan.IsEmpty then
  begin
    //sglb:=dm_epm.adoqry_planSGLB.AsString;
    //sgdw:=dm_epm.adoqry_plansgdw.AsString;
    dm_epm.adoqry_plan.DisableControls;
    try
      dm_epm.adoqry_plan.delete;
    finally
      dm_epm.adoqry_plan.Refresh;
      dm_epm.adoqry_plan.EnableControls;
    end;
  end;
end;


procedure TFram_Prjplan.Init(const Prjcode: string);
begin
 ProjectId:=Prjcode;
 with dm_epm.adoqry_plan do
  begin
    active:=false;
    parameters.ParamByName('mycode').Value:=prjcode;
    active:=true;
  end;
end;

function TFram_Prjplan.UpdatePlan: Boolean;
begin
  application.CreateForm(Tfrm_plan,frm_plan);
  try
    frm_plan.show(EditMode);
    if frm_plan.showmodal=mrok then
    begin
      with dm_epm do
      begin
        adoqry_plan.Edit;
        adoqry_plan.FieldByName('sgdw').AsString:=trim(frm_plan.cb_sgdw.Text);
        adoqry_plan.FieldByName('Acccorpcode').AsString:=trim(frm_plan.Sncode);
        //adoqry_plan.FieldByName('sglb').AsString:=trim(frm_plan.cb_sgtype.Text);
        adoqry_plan.FieldByName('jhkgrq').AsDateTime:=frm_plan.jhkgrq.Date;
        adoqry_plan.FieldByName('jhjgrq').AsDateTime:=frm_plan.jhjgrq.Date;
        adoqry_plan.FieldByName('prjcode').AsString:=projectid;
        if (frm_plan.sgkgrq.Text<>'') and (frm_plan.sgjgrq.Text<>'') then
        begin
          adoqry_plan.FieldByName('sgkgrq').AsDateTime:=frm_plan.sgkgrq.Date;
          adoqry_plan.FieldByName('sgjgrq').AsDateTime:=frm_plan.sgjgrq.Date;
        end else
        begin
            adoqry_plan.FieldByName('sgkgrq').Clear;
            adoqry_plan.FieldByName('sgjgrq').Clear;
        end;
        adoqry_plan.Post;
      end;
    end;
  finally
    frm_plan.free;
  end;
end;

function getid(const idtype,sgtype: string): string;
var csql,ctemp:string;
begin
  csql:='Select Max(ParaCode) MaxCode,Max(USEDNUM) MaxMem from Param'
         +' where ParaType='''+idtype+''' and ParaName='''+sgtype+'''';
  dm_epm.adoqry_pub.SQL.clear;
  dm_epm.adoqry_pub.SQL.Add(csql);
  dm_epm.adoqry_pub.Active:=True;
  if dm_epm.adoqry_pub.IsEmpty then
  begin
    showmessage('请检查参数表');
    exit;
  end else
  begin
    ctemp:=trim(dm_epm.adoqry_pub.fieldbyname('maxmem').AsString);
    ctemp:=inttostr(strtoint(ctemp)+1);
    csql:='update param set usednum='''+ctemp+''' where paratype='''+idtype+''''
          +' and paraname='''+sgtype+'''';
    qrywork(dm_epm.adoqry_pub,csql,false);
    result:=ctemp;
  end;
end;

end.
