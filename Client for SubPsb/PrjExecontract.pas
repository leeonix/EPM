unit PrjExecontract;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dateutils,
  StrUtils,Grids, DBGrids, StdCtrls, ExtCtrls,dm,pubvar, Menus;

type
  TFram_Execontract = class(TFrame)
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Panel2: TPanel;
    StaticText1: TStaticText;
    DBGrid2: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure DBGrid2DblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
     FPrjcode:string;
   //  FSncode:string;


    { Private declarations }
  public
    procedure Init(const Prjcode:string);
    function Updatecontract():Boolean;
    //function Delcontract():Boolean;
    Procedure Printdoc();
    { Public declarations }
  end;

implementation

uses contract, selectcontract, DB, Prj_Design;

{$R *.dfm}

{ TFram_Execontract }








procedure TFram_Execontract.Init(const Prjcode: string);
begin
  with dm_epm.adoqry_plan do
  begin
    active:=false;
    parameters.ParamByName('mycode').Value:=prjcode;
    FPrjcode := Prjcode;
    active:=true;
  end;
end;

procedure TFram_Execontract.Printdoc;
begin
  if dm_epm.adoqry_plan.IsEmpty then
  begin
    showmessage('请新增施工计划安排');
    exit;
  end;
  application.CreateForm(Tfrm_selectcontract,frm_selectcontract);
  try
    frm_selectcontract.ShowModal;
  finally
    frm_selectcontract.Free;
  end;
end;

function TFram_Execontract.Updatecontract: Boolean;
var sghtbh,chhtbh,jlhtbh:string;
begin
  if dm_epm.adoqry_plan.IsEmpty then
  begin
    showmessage('请新增施工计划安排');
    exit;
  end;
  application.CreateForm(Tfrm_contract,frm_contract);
  try
    if frm_contract.showmodal=mrok then
    begin
      with dm_epm do
      begin
        adoqry_plan.Edit;
       // FSncode := adoqry_plan.fieldByName('AccCorpcode').AsString;
        adoqry_plan.FieldByName('htje').AsString:=trim(frm_contract.edt_htje.Text);
        adoqry_plan.FieldByName('jlf').AsString:=trim(frm_contract.edt_jlf.Text);
        adoqry_plan.FieldByName('printdate').AsString:=trim(frm_contract.printdate.Text);
        adoqry_plan.FieldByName('Jffzr').AsString:=trim(frm_contract.cbb_jffzr.Text);
        adoqry_plan.FieldByName('delaystart').AsString:=trim(frm_contract.delaystart.Text);
        adoqry_plan.FieldByName('delayend').AsString:=trim(frm_contract.delayend.Text);
        adoqry_plan.FieldByName('sghtbh').AsString :=  trim(Frm_Contract.sghtbh.Text);
        // 增加监理费，测绘费，监理单位等信息 2011-10-12

              //
        adoqry_plan.FieldByName('prepayment').AsString := trim(Frm_Contract.edt_prepayment.Text);

        //增加按照新颁布的合同编号规则生成监理合同，测绘合同编号等...
//        sghtbh := trim(adoqry_plan.FieldByName('sghtbh').AsString);
//        chhtbh :=   trim(adoqry_plan.FieldByName('chhtbh').AsString);
//        jlhtbh :=trim(adoqry_plan.FieldByName('jlhtbh').AsString);
//        if (trim(frm_contract.edt_htje.Text)<>'') and  ((sghtbh='') or (LeftStr(sghtbh,8) = 'SNDJDGC['))  then
//        adoqry_plan.FieldByName('sghtbh').AsString := GetContractNO('1',adoqry_plan.FieldByName('printdate').AsDateTime) ;

        if (trim(frm_contract.chf.Text)<>'') then
        begin
            adoqry_plan.FieldByName('chdw').AsString:=trim(frm_contract.chdw.Text);
             adoqry_plan.FieldByName('chf').AsString:= trim(frm_contract.chf.Text);
             adoqry_plan.FieldByName('chhtbh').AsString :=  trim(frm_contract.chhtbh.Text)
        end;
        if trim(frm_contract.jlf.Text)<>'' then
        begin
          adoqry_plan.FieldByName('jldw').AsString:=trim(frm_contract.Jldw.Text);
          adoqry_plan.FieldByName('jlfee').AsString:=trim(frm_contract.jlf.Text);
          adoqry_plan.FieldByName('jlhtbh').AsString := trim(frm_contract.jlhtbh.Text)
        end;
//         if (chhtbh='') and (trim(frm_contract.chf.Text)<>'') then
//         begin
//           if strtoint(trim(frm_contract.chf.Text))>0 then
//           adoqry_plan.FieldByName('chhtbh').AsString := GetContractNO('2',adoqry_plan.FieldByName('printdate').AsDateTime) ;
//         end;
//         if (jlhtbh='') and (trim(frm_contract.jlf.Text)<>'') then
//         begin
//            if strtoint(trim(frm_contract.jlf.Text))>0  then
//            adoqry_plan.FieldByName('jlhtbh').AsString := GetContractNO('3',adoqry_plan.FieldByName('printdate').AsDateTime) ;
//         end;
        adoqry_plan.Post;
      end;
    end;
  finally
    frm_contract.free;
  end;
end;

procedure TFram_Execontract.DBGrid2DblClick(Sender: TObject);
begin
    Updatecontract;
end;

procedure TFram_Execontract.N1Click(Sender: TObject);
begin
    Updatecontract;
end;

procedure TFram_Execontract.N2Click(Sender: TObject);
begin
  PrintDoc;
end;



end.
