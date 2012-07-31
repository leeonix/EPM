unit SelectContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,dm,pubvar,MyReport, 
  OleServer, Word2000, RzPanel, RzRadGrp;

type
  TFrm_Selectcontract = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MyReport1: TMyReport;
    RzCheckGroup1: TRzCheckGroup;
    rzchckgrpoldcontract: TRzCheckGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private

    Fprjname:string;
    Fprjaccount:string;
    Fprjtype:string;
    FDesignBy :String;
    FPrintDate :string;
    FP_sgdw  :string;
    FRepNO :string;
    FcontractNo :string;
    FAddress : string;
    FXfRate : string;
    Fprepayment :string;
    FprjAddress :string;
    FJLdwAddress :string;
    FJLdwPostCode :string;
    FJLdwTel,FJffzr :string;
    Printstrings:TstringList;
    function PrintContract(Typetag: Integer=1;TemplateTag:string=''):Boolean;
    function PrintKgbg(Typetag:Integer=1): Boolean;
    function PrintSafeRep():Boolean;
    function PrintLjxy():Boolean;
    function PrintDelayRep():Boolean;
    function PrintJlContract():Boolean;
    function PrintChContract():Boolean;
    function PrintLjxy_Jl():Boolean;

    { Private declarations }
  public

    { Public declarations }
  end;

var
  Frm_Selectcontract: TFrm_Selectcontract;

implementation

uses   MAIN, TreeListprj;

{$R *.dfm}

procedure TFrm_Selectcontract.BitBtn1Click(Sender: TObject);
var
  I: Integer;
begin
    screen.cursor:=crHourGlass;
   if  RzCheckGroup1.ItemChecked[0]  then  PrintContract(1);
   if  RzCheckGroup1.ItemChecked[1]  then  PrintContract(2);
   if  RzCheckGroup1.ItemChecked[2]  then  PrintContract(3);
   if  RzCheckGroup1.ItemChecked[3]  then  PrintDelayRep;
   if  RzCheckGroup1.ItemChecked[4]  then  PrintKgbg(0);
   if  RzCheckGroup1.ItemChecked[5]  then  PrintSafeRep ;
   if  RzCheckGroup1.ItemChecked[6]  then  PrintLjxy;
   if  RzCheckGroup1.ItemChecked[7]  then  PrintChContract;
   if  RzCheckGroup1.ItemChecked[8]  then  PrintJlContract;
   if  RzCheckGroup1.ItemChecked[9]  then  PrintLjxy_Jl;
   //增加选择合同模板2012-02-01的功能
   if rzchckgrpoldcontract.ItemChecked[0] then  PrintContract(1,'2011');
   if rzchckgrpoldcontract.ItemChecked[1] then  PrintContract(2,'2011');
   if rzchckgrpoldcontract.ItemChecked[2] then  PrintContract(3,'2011');
   screen.cursor:=crDefault;
end;
procedure TFrm_Selectcontract.FormCreate(Sender: TObject);
var csql,sgdw :string;
begin
   if   frm_main.Lsv_Task.Visible then
    begin
      FPrjaccount := Ptaskinfo(frm_main.Lsv_Task.Selected.Data)^.prjacc;
      Fprjname := Ptaskinfo(frm_main.Lsv_Task.Selected.Data)^.prjname ;
      Fprjtype :=Ptaskinfo(frm_main.Lsv_Task.Selected.Data)^.prjtype ;
      FDesignBy := Ptaskinfo(frm_main.Lsv_Task.Selected.Data)^.DesignBy ;
    end else
    if   Fram_TltBase.Visible then
    begin
      Fprjaccount :=Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.Data)^.PrjAcc;
      Fprjname := Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.Data)^.prjname;
      Fprjtype := Trim(Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.Data)^.Prjtype);
      FDesignBy := Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.Data)^.DesignBy;
    end;
    FP_sgdw    := Dm_Epm.adoqry_plan.fieldbyname('sgdw').AsString ;//2010-06 修改为一级合同主体单位
    FPrintDate := Dm_Epm.adoqry_plan.fieldbyname('PrintDate').AsString ;
    FcontractNo:= dm_epm.adoqry_plan.fieldbyname('sghtbh').AsString;
    Fprepayment := dm_epm.adoqry_plan.fieldbyname('prepayment').AsString;
    FJffzr :=  Trim(dm_epm.adoqry_plan.fieldbyname('Jffzr').AsString);
    if trim(dm_epm.adoqry_plan.fieldbyname('jldw').AsString) ='上海思南电力建设工程监理有限公司' then
    begin
      FJLdwAddress :='莘西路225号';
       FJLdwTel := '64921437';
       FJLdwPostCode := '201100';
    end
    else begin
      FJLdwAddress :='浦东新区华夏西路1001号';
       FJLdwTel := '68898783';
       FJLdwPostCode := '';
    end; 
    csql := 'select address,XfRate from corp where  name= '''+FP_sgdw+'''';
    QryWork(Dm_Epm.adoqry_pub,csql);
    FAddress := Dm_Epm.adoqry_pub.FieldByName('address').AsString;
    FXfRate :=  trim(Dm_Epm.adoqry_pub.FieldByName('XfRate').AsString);
    csql := 'select prjadd from projectinfo where  prjcode= '''+Ptaskinfo(frm_main.Lsv_Task.Selected.Data)^.PrjDm+'''';
    QryWork(Dm_Epm.adoqry_pub,csql);
    FprjAddress := Dm_Epm.adoqry_pub.FieldByName('prjadd').AsString;
    Printstrings := TstringList.Create;
     //默认的要打印的合同类型
    RzCheckGroup1.ItemChecked[0]:= true;
    RzCheckGroup1.ItemChecked[4]:= true;
    RzCheckGroup1.ItemChecked[5]:= true;
    RzCheckGroup1.ItemChecked[6]:= true;
    if dm_epm.adoqry_plan.fieldbyname('chhtbh').AsString<>'' then
    RzCheckGroup1.ItemChecked[7]:= true;
    if dm_epm.adoqry_plan.fieldbyname('jlhtbh').AsString<>'' then
    begin
      RzCheckGroup1.ItemChecked[8]:= true;
       RzCheckGroup1.ItemChecked[9]:= true;
    end;

end;

function TFrm_Selectcontract.PrintSafeRep: Boolean;
begin
  with dm_epm.adoqry_plan do
  begin
   PrintStrings.Clear;
   PrintStrings.Add(FcontractNo);
   PrintStrings.Add(FP_sgdw);
   PrintStrings.Add(Fprjname);
   PrintStrings.Add(fieldbyname('jhkgrq').AsString);
   PrintStrings.Add(fieldbyname('jhjgrq').AsString);
   PrintStrings.Add(FP_sgdw);
   PrintStrings.Add(FAddress);
   PrintStrings.Add(FPrintDate);
  end;
   MyReport1.templatefilename:='safexy';
   MyReport1.execute('',PrintStrings);
end;


function TFrm_Selectcontract.PrintContract(Typetag: Integer=1;TemplateTag:string=''): Boolean;
var startwith1,startwith2:string;
begin
   with dm_epm.adoqry_plan do
   begin
     PrintStrings.Clear;
     PrintStrings.Add(FcontractNo);  // 2010-0615 增加合同编号打印
     PrintStrings.Add(FP_sgdw);
     PrintStrings.Add(Fprjaccount);
     PrintStrings.Add(Fprjname);
     if (fieldbyname('htje').AsString='0') then
     begin
      PrintStrings.Add('暂估');
     end
     else
     PrintStrings.Add(Money2ChineseCapital2(fieldbyname('htje').AsFloat));
   // PrintStrings.Add(RMB(fieldbyname('jlf').AsFloat));
     PrintStrings.Add(fieldbyname('jhkgrq').AsString);
     PrintStrings.Add(fieldbyname('jhjgrq').AsString);
     PrintStrings.Add(FP_sgdw);
     PrintStrings.Add(FPrintDate);
     PrintStrings.Add(Money2ChineseCapital2(fieldbyname('jlf').AsFloat));
     PrintStrings.Add(FAddress);
   end;
   startwith1 := Copy(Fprjaccount,1,2);
   startwith2 := Copy(Fprjaccount,1,1);

   // 小于200万，工程性质为业扩代工等营销类项目，并且乙方单位有适用的结算下浮率，采用合同模板含有下浮率的版本，
   if (Typetag=1) then
     if (FPrintDate>='2011-10-21')
        and  (dm_epm.adoqry_plan.fieldbyname('htje').AsFloat < 2000000)
        and (FXfRate<>'')
        and ( (Fprjtype='业扩') or (Fprjtype='代工') or (Fprjtype='住宅配套'))
     then   begin
       MyReport1.templatefilename:='Prj_contract_Xfl' ;
       PrintStrings.Add(FXfRate);
     end else  MyReport1.templatefilename:='Prj_contract' ;

  // 合同模板2,-分期付款 选择有分期付款条款的版本
   if Typetag=2 then
   if (FPrintDate>='2011-10-21')
      and (dm_epm.adoqry_plan.fieldbyname('htje').AsFloat < 2000000)
      and ( (Fprjtype='业扩') or (Fprjtype='代工') or (Fprjtype='住宅配套'))
   then begin
        PrintStrings.Add(Fprepayment);
        PrintStrings.Add(FXfRate);
        MyReport1.templatefilename:='Prj_contract_Install_xfl' ;
   end else begin
     PrintStrings.Add(Fprepayment);
     MyReport1.templatefilename:='Prj_contract_Install' ;
   end;
   if Typetag=3 then     // 形象进度合同模板
   begin
      MyReport1.templatefilename:='Prj_contract_xxjd' ;
   end;
   // 增加合同历史版本判断
    MyReport1.templatefilename:=  MyReport1.templatefilename + TemplateTag;
   PrintStrings.Add(Loginuser);    // 经办人
   PrintStrings.Add(FJffzr);   //甲方负责人

   MyReport1.execute('',PrintStrings);
end;

function TFrm_Selectcontract.PrintKgbg(Typetag: Integer=1): Boolean;
begin
  if Typetag=0 then
  begin
    with dm_epm.adoqry_plan do
    begin
     PrintStrings.Clear;
     PrintStrings.Add(Fprjaccount);
     PrintStrings.Add(Fprjname);
     PrintStrings.Add('市南供电设计公司');
     PrintStrings.Add(Fprjtype);
     PrintStrings.Add(FP_sgdw);
     PrintStrings.Add(formatdatetime('yyyy ''年'' mm ''月'' dd ''日''',
                                   fieldbyname('jhkgrq').AsDateTime));
     PrintStrings.Add(formatdatetime('yyyy ''年'' mm ''月'' dd ''日''',
                                   fieldbyname('jhjgrq').AsDateTime));
     PrintStrings.Add(FPrintDate);
    end;
    try
       MyReport1.templatefilename:='开工报告';
       MyReport1.execute('',PrintStrings);
    except
     exit;
     showmessage('有错误，请联系管理员')
    end;
  end ;
end;

// 打印廉洁协议
function TFrm_Selectcontract.PrintLjxy: Boolean;
begin
 with dm_epm.adoqry_plan do
  begin
   PrintStrings.Clear;
   PrintStrings.Add(FP_sgdw);      // 合同乙方单位

   PrintStrings.Add(Fprjname);     //工程名称
   PrintStrings.Add(FP_sgdw);
   PrintStrings.Add(FAddress);
   PrintStrings.Add(FPrintDate);
  end;
   MyReport1.templatefilename:='ljxy';
   MyReport1.execute('',PrintStrings);
end;



// 打印延期合同
function TFrm_Selectcontract.PrintDelayRep: Boolean;
 var startdate :TDateTime;
begin
 with dm_epm.adoqry_plan do
  begin
   PrintStrings.Clear;
   PrintStrings.Add(FP_sgdw);      // 合同乙方单位
   PrintStrings.Add(Fprjaccount);
   PrintStrings.Add(Fprjname);     //工程名称
   PrintStrings.Add(DateTimeToStr(fieldbyname('DelayStart').AsDateTime));
    PrintStrings.Add(DateTimeToStr(fieldbyname('DelayEnd').AsDateTime ));
   PrintStrings.Add(FP_sgdw);
   PrintStrings.Add(FAddress);
   PrintStrings.Add(Datetostr( fieldbyname('DelayStart').AsDateTime));
  end;
   MyReport1.templatefilename:='DelayContract';
   MyReport1.execute('',PrintStrings);
end;

//打印监理合同
function TFrm_Selectcontract.PrintJlContract: Boolean;
begin
  with dm_epm.adoqry_plan do
  begin
   PrintStrings.Clear;
   PrintStrings.Add(trim(fieldbyname('jlhtbh').AsString));   // 监理合同编号
   PrintStrings.Add(trim(fieldbyname('jldw').AsString));      // 监理合同乙方单位
   PrintStrings.Add(Fprjname);     //工程名称
   PrintStrings.Add(Fprjaccount);    //工程账号
   PrintStrings.Add(FprjAddress);    //工程地点
   PrintStrings.Add(Money2ChineseCapital2(fieldbyname('jlfee').AsFloat));   //监理费
   PrintStrings.Add(FJLdwAddress); // 乙方地址信息
   PrintStrings.Add(FJLdwPostCode); //邮编
   PrintStrings.Add(FJLdwTel); // 电话
   PrintStrings.Add(FPrintDate);
   PrintStrings.Add(fieldbyname('jhkgrq').AsString);
   PrintStrings.Add(fieldbyname('jhjgrq').AsString);
   PrintStrings.Add(FJffzr);

  end;
   MyReport1.templatefilename:='jlht';
   MyReport1.execute('',PrintStrings);
end;

function TFrm_Selectcontract.PrintLjxy_Jl: Boolean;
begin
   with dm_epm.adoqry_plan do
  begin
   PrintStrings.Clear;
   PrintStrings.Add(trim(fieldbyname('jldw').AsString));  // 监理合同乙方单位
   PrintStrings.Add(FJLdwAddress); // 乙方地址信息
   PrintStrings.Add(FJLdwTel); // 电话
   PrintStrings.Add(FPrintDate);
  end;
   MyReport1.templatefilename:='ljxy_jl';
   MyReport1.execute('',PrintStrings);
end;

//打印测绘合同
function TFrm_Selectcontract.PrintChContract: Boolean;
begin
  with dm_epm.adoqry_plan do
  begin
   PrintStrings.Clear;
   PrintStrings.Add(trim(fieldbyname('chhtbh').AsString));   // 测绘合同编号
   //PrintStrings.Add(trim(fieldbyname('chdw').AsString));      // 测绘合同乙方单位
   PrintStrings.Add(Fprjname);     //工程名称
   PrintStrings.Add(Fprjaccount);    //工程账号
   PrintStrings.Add(FprjAddress);    //工程地点
   PrintStrings.Add(Money2ChineseCapital2(fieldbyname('chf').AsFloat));   //测绘费
   PrintStrings.Add(FPrintDate);
   PrintStrings.Add(Loginuser);   // 经办人
  end;
   MyReport1.templatefilename:='chht';
   MyReport1.execute('',PrintStrings);
end;

procedure TFrm_Selectcontract.FormDestroy(Sender: TObject);
begin
  Printstrings.Free;
end;

end.
