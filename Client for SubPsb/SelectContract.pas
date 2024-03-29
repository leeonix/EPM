unit SelectContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DateUtils ,
  Dialogs, StdCtrls, Buttons, ExtCtrls,dm,pubvar,MyReport,  StrUtils,
  OleServer, Word2000, RzPanel, RzRadGrp;

type
  TFrm_Selectcontract = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MyReport1: TMyReport;
    RzCheckGroup1: TRzCheckGroup;
    rzchckgrpoldcontract: TRzCheckGroup;
    RzRadioGroup1: TRzRadioGroup;
    RzRadioGroup2: TRzRadioGroup;
    RzRadioGroup3: TRzRadioGroup;
    RzRadioGroup4: TRzRadioGroup;
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
    FPostCode:string;
    FTel:string;
    FFax:string;
    FBank:string;
    FBankAccount:string;
    DelayContent:string;
    QualityContent:string;


    FJLdwAddress :string;
    FJLdwPostCode :string;
    FJldwBank,FJldwBankAccount:string;
    FSjdw:string;
    FSjdwAddress:string;
    FSjdwPostCode :string;
    FSjdwTel,FSjdwFax:string;
    FJLdwTel,FJLdwFax,FJffzr,FJlengineer :string;
    FChdwAddress :string;
    FChdwPostCode:string;
    FChdwTel:string;
    FChdwFax:string;
    FChdwBank:string;
    FChdwBankAccount:string;

    FDGSQID :string;

    Printstrings:TstringList;
    function PrintContract(Typetag: Integer=1;TemplateTag:string=''):Boolean;
    function PrintContractState():Boolean;
    function PrintBidContract():Boolean;
    function PrintKgbg(Typetag:Integer=1): Boolean;
    function PrintSafeRep():Boolean;
    function PrintLjxy():Boolean;
    function PrintDelayRep():Boolean;
    function PrintJlContract():Boolean;
    function PrintChContract():Boolean;
    function PrintLjxy_Jl():Boolean;
    function PrintStateJl():Boolean;


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
   if  RzCheckGroup1.ItemChecked[0]  then
   begin
     if RzRadioGroup3.ItemIndex=0 then
     begin
       if RzRadioGroup2.ItemIndex=0 then
         PrintContractState else   PrintBidContract;
     end  else begin
         if RzRadioGroup4.ItemIndex=0 then     PrintContract(1) else   PrintContract(2)
     end;
   end;
  // if  RzCheckGroup1.ItemChecked[1]  then  PrintContract(2);
 //  if  RzCheckGroup1.ItemChecked[2]  then  PrintContract(3);
   if  RzCheckGroup1.ItemChecked[1]  then  PrintDelayRep;
   //if  RzCheckGroup1.ItemChecked[3]  then  PrintKgbg(0);      开工报告取消 2013年4月15日
   if  RzCheckGroup1.ItemChecked[2]  then  PrintSafeRep ;
   if  RzCheckGroup1.ItemChecked[3]  then  PrintLjxy;
   if  RzCheckGroup1.ItemChecked[4]  then  PrintChContract;
   if  RzCheckGroup1.ItemChecked[5]  then  if RzRadioGroup3.ItemIndex=0 then PrintStateJl else PrintJlContract;
   if  RzCheckGroup1.ItemChecked[6]  then  PrintLjxy_Jl;
   //增加选择合同模板2012-02-01的功能
//   if rzchckgrpoldcontract.ItemChecked[0] then  PrintContract(1,'2011');
//   if rzchckgrpoldcontract.ItemChecked[1] then  PrintContract(2,'2011');
//   if rzchckgrpoldcontract.ItemChecked[2] then  PrintContract(3,'2011');
   screen.cursor:=crDefault;
end;
procedure TFrm_Selectcontract.FormCreate(Sender: TObject);
var csql,sgdw,jldw,chdw,erpcode :string;
begin
   if   frm_main.Lsv_Task.Visible then
    begin
      FPrjaccount := Ptaskinfo(frm_main.Lsv_Task.Selected.Data)^.prjacc;
      Fprjname := Ptaskinfo(frm_main.Lsv_Task.Selected.Data)^.prjname ;
      Fprjtype :=Ptaskinfo(frm_main.Lsv_Task.Selected.Data)^.prjtype ;
      FDesignBy := Ptaskinfo(frm_main.Lsv_Task.Selected.Data)^.DesignBy ;
      FDGSQID := Ptaskinfo(Frm_Main.Lsv_Task.Selected.data)^.Prjsource;
    end else
    if   Fram_TltBase.Visible then
    begin
      Fprjaccount :=Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.Data)^.PrjAcc;
      Fprjname := Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.Data)^.prjname;
      Fprjtype := Trim(Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.Data)^.Prjtype);
      FDesignBy := Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.Data)^.DesignBy;
      FDGSQID :=  Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.Data)^.Prjsource
    end;
    FP_sgdw    := Dm_Epm.adoqry_plan.fieldbyname('sgdw').AsString ;//2010-06 修改为一级合同主体单位
    chdw :=   Dm_Epm.adoqry_plan.fieldbyname('chdw').AsString ;
    jldw :=   Dm_Epm.adoqry_plan.fieldbyname('jldw').AsString  ;
    FPrintDate := Dm_Epm.adoqry_plan.fieldbyname('PrintDate').AsString;
    FcontractNo:= dm_epm.adoqry_plan.fieldbyname('sghtbh').AsString;
    Fprepayment := dm_epm.adoqry_plan.fieldbyname('prepayment').AsString;
    FJffzr :=  Trim(dm_epm.adoqry_plan.fieldbyname('Jffzr').AsString);

    csql := 'select address,XfRate,Tel,Postcode,Fax,Bankname,Bankaccount,DelayContent,QualityContent from corp where  name= '''+FP_sgdw+'''';
    QryWork(Dm_Epm.adoqry_pub,csql);
    FAddress := Dm_Epm.adoqry_pub.FieldByName('address').AsString;
    FXfRate :=  trim(Dm_Epm.adoqry_pub.FieldByName('XfRate').AsString);
    FPostCode:=  trim(Dm_Epm.adoqry_pub.FieldByName('Postcode').AsString);
    FFax:=  trim(Dm_Epm.adoqry_pub.FieldByName('Fax').AsString);
    FBank:=  trim(Dm_Epm.adoqry_pub.FieldByName('Bankname').AsString);
    FBankAccount:=  trim(Dm_Epm.adoqry_pub.FieldByName('Bankaccount').AsString);
    QualityContent:= trim(Dm_Epm.adoqry_pub.FieldByName('QualityContent').AsString);
    DelayContent :=    trim(Dm_Epm.adoqry_pub.FieldByName('DelayContent').AsString);
    csql := 'select address,Tel,Postcode,Fax,Bankname, Bankaccount,Contactor from corp where  name= '''+jldw+'''';
    QryWork(Dm_Epm.adoqry_pub,csql);
    FJLdwAddress := Dm_Epm.adoqry_pub.FieldByName('address').AsString;
    FJLdwTel :=  Dm_Epm.adoqry_pub.FieldByName('Tel').AsString;
    FJLdwPostCode := Dm_Epm.adoqry_pub.FieldByName('Postcode').AsString;
    FJLdwFax :=    Dm_Epm.adoqry_pub.FieldByName('Fax').AsString;
    FJldwBank :=    trim(Dm_Epm.adoqry_pub.FieldByName('Bankname').AsString);
    FJldwBankAccount:= trim(Dm_Epm.adoqry_pub.FieldByName('Bankaccount').AsString);
    FJlengineer :=   trim(Dm_Epm.adoqry_pub.FieldByName('Contactor').AsString);

    csql := 'select address,Tel,Postcode,Fax,Bankname,Bankaccount from corp where  name= '''+chdw+'''';
    QryWork(Dm_Epm.adoqry_pub,csql);
    FChdwAddress := Dm_Epm.adoqry_pub.FieldByName('address').AsString;
    FChdwTel :=  Dm_Epm.adoqry_pub.FieldByName('Tel').AsString;
    FChdwPostCode := Dm_Epm.adoqry_pub.FieldByName('Postcode').AsString;
    FChdwFax :=    Dm_Epm.adoqry_pub.FieldByName('Fax').AsString;
    FChdwBank :=    trim(Dm_Epm.adoqry_pub.FieldByName('Bankname').AsString);
    FChdwBankAccount:= trim(Dm_Epm.adoqry_pub.FieldByName('Bankaccount').AsString);

    erpcode := Fprjaccount;
    if ContainsStr(erpcode,'-') then
    erpcode := Copy(erpcode,1,Pos('-',erpcode)-1);
    csql:='SELECT stdw,Postcode,Tel,Fax,Address FROM DESCONTRACT INNER JOIN Corp ON stdw= Name WHERE Erpcode='''+erpcode+'''';
     QryWork(Dm_Epm.adoqry_pub,csql);
     FSjdw:=    Dm_Epm.adoqry_pub.FieldByName('stdw').AsString;
     FSjdwAddress :=  Dm_Epm.adoqry_pub.FieldByName('Address').AsString;
     FSjdwPostCode := Dm_Epm.adoqry_pub.FieldByName('Postcode').AsString;
     FSjdwTel := Dm_Epm.adoqry_pub.FieldByName('Tel').AsString;
     FSjdwFax := Dm_Epm.adoqry_pub.FieldByName('Fax').AsString;
     if FDGSQID<>'' then
     begin
        csql := 'select YHDZ from DGAPPLY where  DGSQID= '''+FDGSQID+'''';
        QryWork(Dm_Epm.adoqry_pub,csql);
        FprjAddress := Dm_Epm.adoqry_pub.FieldByName('YHDZ').AsString;
     end else
     begin
         csql := 'select prjadd from projectinfo where  prjcode= '''+Ptaskinfo(frm_main.Lsv_Task.Selected.Data)^.PrjDm+'''';
         QryWork(Dm_Epm.adoqry_pub,csql);
         FprjAddress := Dm_Epm.adoqry_pub.FieldByName('prjadd').AsString;
     end;

    Printstrings := TstringList.Create;
     //默认的要打印的合同类型
    RzCheckGroup1.ItemChecked[0]:= true;
    RzCheckGroup1.ItemChecked[2]:= true;
    RzCheckGroup1.ItemChecked[3]:= true;
           //StrToInt(fieldbyname('jlfee').AsString)>0
    if ((dm_epm.adoqry_plan.fieldbyname('chf').AsString<>'')  and ( StrToInt(dm_epm.adoqry_plan.fieldbyname('chf').AsString)>0))  then
    RzCheckGroup1.ItemChecked[4]:= true;
    if ((dm_epm.adoqry_plan.fieldbyname('jlfee').AsString<>'')  and (StrToInt(dm_epm.adoqry_plan.fieldbyname('jlfee').AsString)>0))  then
    begin
       RzCheckGroup1.ItemChecked[5]:= true;
       RzCheckGroup1.ItemChecked[6]:= true;
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
   PrintStrings.Add('');
   PrintStrings.Add('');
   PrintStrings.Add(FP_sgdw);
   PrintStrings.Add(FAddress);
   PrintStrings.Add(FPrintDate);
    if RzRadioGroup1.ItemIndex=0 then     Printstrings.Add('施工总承包')
   else      Printstrings.Add('专业承包');
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
    // PrintStrings.Add(Money2ChineseCapital2(fieldbyname('htje').AsFloat));
     PrintStrings.Add(Money2ChineseCapital2(fieldbyname('htje').AsFloat)+'(￥'+fieldbyname('htje').AsString+'元)');
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
   if RzRadioGroup1.ItemIndex=0 then     Printstrings.Add('总承包')
   else      Printstrings.Add('专业承包');

          // 总承包或者专业承包方式
   MyReport1.execute('',PrintStrings);
end;

function TFrm_Selectcontract.PrintContractState: Boolean;

begin
   with dm_epm.adoqry_plan do
   begin
     PrintStrings.Clear;
     PrintStrings.Add(Fprjname);
     PrintStrings.Add(FcontractNo);
     PrintStrings.Add(Fprjname);
     PrintStrings.Add(FP_sgdw);
     PrintStrings.Add(FPrintDate);
     PrintStrings.Add(Fprjname);
     PrintStrings.Add(FP_sgdw);
     PrintStrings.Add(Fprjname);
     PrintStrings.Add(Fprjname);
     PrintStrings.Add(Fprjaccount);
     PrintStrings.Add(FprjAddress);
     if RzRadioGroup1.ItemIndex=0 then   Printstrings.Add('(1)')  else      Printstrings.Add('(2)');
     PrintStrings.Add(FPrintDate);
     PrintStrings.Add(fieldbyname('htje').AsString+'元(大写:'+Money2ChineseCapital2(fieldbyname('htje').AsFloat)+'元)');
     PrintStrings.Add(Money2ChineseCapital2(fieldbyname('jlf').AsFloat));
     if RzRadioGroup4.ItemIndex=0 then   Printstrings.Add('(1)')  else      Printstrings.Add('(2)');
     PrintStrings.Add(FJffzr);
     if (fieldbyname('jlfee').AsString<>'') and ( StrToInt(fieldbyname('jlfee').AsString)>0) then
     begin
        PrintStrings.Add(trim(fieldbyname('jldw').AsString));
         PrintStrings.Add(FJlengineer);   //监理工程师
     end else begin
         PrintStrings.Add('/');
         PrintStrings.Add('/');
     end;


     PrintStrings.Add(FP_sgdw);
     PrintStrings.Add(FPrintDate);
     PrintStrings.Add(Loginuser);
      PrintStrings.Add(FPrintDate);
     PrintStrings.Add(FAddress);
     PrintStrings.Add(FPostCode);  //邮编
     PrintStrings.Add(FTel);  //
     PrintStrings.Add(FFax);  //
     PrintStrings.Add(FBank);  //kaihuhang
     PrintStrings.Add(FBankAccount);  //    账号
     PrintStrings.Add('');  //   税号
     if  FXfRate<>'' then
     PrintStrings.Add('6.1.4 其他：在结算总价审价后的基础上，按照中标结算下浮率下浮'+FXfRate+'%作为最终结算价 。')
     else       PrintStrings.Add('');
     PrintStrings.Add(DelayContent);
     PrintStrings.Add(QualityContent);
   end;
   MyReport1.templatefilename:='工程施工合同(非招标)'  ;
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
   PrintStrings.Add(Money2ChineseCapital2(fieldbyname('jlfee').AsFloat)+'('+fieldbyname('jlfee').AsString+'元)');   //监理费
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


function TFrm_Selectcontract.PrintStateJl: Boolean;
begin
  with dm_epm.adoqry_plan do
  begin
   PrintStrings.Clear;
    PrintStrings.Add(Fprjname);     //工程名称
   PrintStrings.Add(trim(fieldbyname('jlhtbh').AsString));   // 监理合同编号
    PrintStrings.Add(Fprjname);     //工程名称
   PrintStrings.Add(trim(fieldbyname('jldw').AsString));      // 监理合同乙方单位
   PrintStrings.Add(FPrintDate);

   PrintStrings.Add(Fprjname);     //工程名称
   PrintStrings.Add(trim(fieldbyname('jldw').AsString));      // 监理合同乙方单位
   PrintStrings.Add(Fprjname);     //工程名称
   PrintStrings.Add(Fprjname);     //工程名称
   PrintStrings.Add(FprjAddress);    //工程地点
    PrintStrings.Add(FJlengineer);


   PrintStrings.Add(fieldbyname('jlfee').AsString+'元(大写:'+Money2ChineseCapital2(fieldbyname('jlfee').AsFloat)+'元)');  //监理费
   PrintStrings.Add(FPrintDate);
   PrintStrings.Add(Loginuser);
    PrintStrings.Add(FPrintDate);
   PrintStrings.Add(FJLdwAddress); // 乙方地址信息
   PrintStrings.Add(FJLdwPostCode); //邮编
   PrintStrings.Add(FJLdwTel); // 电话
    PrintStrings.Add(FJLdwFax); //
   PrintStrings.Add(FJldwBank);
    PrintStrings.Add(FJldwBankAccount);
   PrintStrings.Add(trim(fieldbyname('jldw').AsString));

  end;
   MyReport1.templatefilename:='工程监理合同';
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


function TFrm_Selectcontract.PrintBidContract: Boolean;
begin
  with dm_epm.adoqry_plan do
   begin
     PrintStrings.Clear;
     PrintStrings.Add(Fprjname);
     PrintStrings.Add(FcontractNo);
     PrintStrings.Add(Fprjname);
     PrintStrings.Add(FP_sgdw);
     PrintStrings.Add(FPrintDate);
     PrintStrings.Add(FP_sgdw);
     PrintStrings.Add(Fprjname);
     PrintStrings.Add(Fprjname);
     PrintStrings.Add(FprjAddress);//工程地点
     PrintStrings.Add(fieldbyname('jhkgrq').AsString);
     PrintStrings.Add(fieldbyname('jhjgrq').AsString);
     PrintStrings.Add(UIntToStr(DaysBetween(fieldbyname('jhkgrq').AsDateTime,fieldbyname('jhjgrq').AsDateTime))) ;
     PrintStrings.Add(Money2ChineseCapital2(fieldbyname('htje').AsFloat)+'(￥'+fieldbyname('htje').AsString+'元)');
     PrintStrings.Add(FP_sgdw);
     PrintStrings.Add(FPrintDate);
     PrintStrings.Add(FPrintDate);
     PrintStrings.Add(FAddress);
     PrintStrings.Add(FPostCode);  //邮编
     PrintStrings.Add(FTel);  // 电话
     PrintStrings.Add(FFax);  // 传真
     PrintStrings.Add(FBank);  //开户行
     PrintStrings.Add(FBankAccount);  // 账号

     // 设计单位信息
     PrintStrings.Add(FSjdw);
     PrintStrings.Add(FSjdwAddress);
     PrintStrings.Add(FSjdwPostCode);
     PrintStrings.Add(FSjdwTel);
     PrintStrings.Add(FSjdwFax);
     //监理单位信息
     PrintStrings.Add(trim(fieldbyname('jldw').AsString));
     PrintStrings.Add(FJLdwAddress); // 乙方地址信息
     PrintStrings.Add(FJLdwPostCode); //邮编
     PrintStrings.Add(FJLdwTel); // 电话
     PrintStrings.Add(FJLdwFax); // 电话
    PrintStrings.Add(Money2ChineseCapital2(fieldbyname('jlf').AsFloat));       //安全措施费
   end;
   MyReport1.templatefilename:='工程施工合同(招标)' ;
   MyReport1.execute('',PrintStrings);
end;

//打印测绘合同
function TFrm_Selectcontract.PrintChContract: Boolean;
var htbh:string;
begin
  with dm_epm.adoqry_plan do
  begin
   htbh := trim(fieldbyname('chhtbh').AsString);
   PrintStrings.Clear;
   PrintStrings.Add(htbh);   // 测绘合同编号
   //PrintStrings.Add(trim(fieldbyname('chdw').AsString));      // 测绘合同乙方单位
   PrintStrings.Add(Fprjname);     //工程名称
   PrintStrings.Add(Fprjaccount);    //工程账号
   PrintStrings.Add(FP_sgdw);    //总包单位
   PrintStrings.Add(Money2ChineseCapital2(fieldbyname('chf').AsFloat)+'('+fieldbyname('chf').AsString+'元)');   //测绘费
   PrintStrings.Add(FPrintDate);
   PrintStrings.Add(trim(fieldbyname('chdw').AsString));      // 测绘合同乙方单位
  // PrintStrings.Add(Loginuser);   // 经办人
  end;
  if RzRadioGroup3.ItemIndex=0  then
  begin
    MyReport1.templatefilename:='地下管线跟踪测量技术服务合同';
    PrintStrings.Add(FPrintDate);
    PrintStrings.Add(FChdwAddress);
    PrintStrings.Add(FChdwPostCode);
    PrintStrings.Add(FChdwTel);
    PrintStrings.Add(FChdwFax);
    PrintStrings.Add(FChdwBank);
    PrintStrings.Add(FChdwBankAccount);

    PrintStrings.Add(Fprjname);
    PrintStrings.Add(trim(dm_epm.adoqry_plan.fieldbyname('chdw').AsString));
    PrintStrings.Add(FPrintDate);
    Printstrings.Add(FprjAddress) ;
  end else  MyReport1.templatefilename:='chht';
   MyReport1.execute('',PrintStrings);
end;

procedure TFrm_Selectcontract.FormDestroy(Sender: TObject);
begin
  Printstrings.Free;
end;

end.
