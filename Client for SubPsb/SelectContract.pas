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
   //����ѡ���ͬģ��2012-02-01�Ĺ���
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
    FP_sgdw    := Dm_Epm.adoqry_plan.fieldbyname('sgdw').AsString ;//2010-06 �޸�Ϊһ����ͬ���嵥λ
    FPrintDate := Dm_Epm.adoqry_plan.fieldbyname('PrintDate').AsString ;
    FcontractNo:= dm_epm.adoqry_plan.fieldbyname('sghtbh').AsString;
    Fprepayment := dm_epm.adoqry_plan.fieldbyname('prepayment').AsString;
    FJffzr :=  Trim(dm_epm.adoqry_plan.fieldbyname('Jffzr').AsString);
    if trim(dm_epm.adoqry_plan.fieldbyname('jldw').AsString) ='�Ϻ�˼�ϵ������蹤�̼������޹�˾' then
    begin
      FJLdwAddress :='ݷ��·225��';
       FJLdwTel := '64921437';
       FJLdwPostCode := '201100';
    end
    else begin
      FJLdwAddress :='�ֶ�����������·1001��';
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
     //Ĭ�ϵ�Ҫ��ӡ�ĺ�ͬ����
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
     PrintStrings.Add(FcontractNo);  // 2010-0615 ���Ӻ�ͬ��Ŵ�ӡ
     PrintStrings.Add(FP_sgdw);
     PrintStrings.Add(Fprjaccount);
     PrintStrings.Add(Fprjname);
     if (fieldbyname('htje').AsString='0') then
     begin
      PrintStrings.Add('�ݹ�');
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

   // С��200�򣬹�������Ϊҵ��������Ӫ������Ŀ�������ҷ���λ�����õĽ����¸��ʣ����ú�ͬģ�庬���¸��ʵİ汾��
   if (Typetag=1) then
     if (FPrintDate>='2011-10-21')
        and  (dm_epm.adoqry_plan.fieldbyname('htje').AsFloat < 2000000)
        and (FXfRate<>'')
        and ( (Fprjtype='ҵ��') or (Fprjtype='����') or (Fprjtype='סլ����'))
     then   begin
       MyReport1.templatefilename:='Prj_contract_Xfl' ;
       PrintStrings.Add(FXfRate);
     end else  MyReport1.templatefilename:='Prj_contract' ;

  // ��ͬģ��2,-���ڸ��� ѡ���з��ڸ�������İ汾
   if Typetag=2 then
   if (FPrintDate>='2011-10-21')
      and (dm_epm.adoqry_plan.fieldbyname('htje').AsFloat < 2000000)
      and ( (Fprjtype='ҵ��') or (Fprjtype='����') or (Fprjtype='סլ����'))
   then begin
        PrintStrings.Add(Fprepayment);
        PrintStrings.Add(FXfRate);
        MyReport1.templatefilename:='Prj_contract_Install_xfl' ;
   end else begin
     PrintStrings.Add(Fprepayment);
     MyReport1.templatefilename:='Prj_contract_Install' ;
   end;
   if Typetag=3 then     // ������Ⱥ�ͬģ��
   begin
      MyReport1.templatefilename:='Prj_contract_xxjd' ;
   end;
   // ���Ӻ�ͬ��ʷ�汾�ж�
    MyReport1.templatefilename:=  MyReport1.templatefilename + TemplateTag;
   PrintStrings.Add(Loginuser);    // ������
   PrintStrings.Add(FJffzr);   //�׷�������

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
     PrintStrings.Add('���Ϲ�����ƹ�˾');
     PrintStrings.Add(Fprjtype);
     PrintStrings.Add(FP_sgdw);
     PrintStrings.Add(formatdatetime('yyyy ''��'' mm ''��'' dd ''��''',
                                   fieldbyname('jhkgrq').AsDateTime));
     PrintStrings.Add(formatdatetime('yyyy ''��'' mm ''��'' dd ''��''',
                                   fieldbyname('jhjgrq').AsDateTime));
     PrintStrings.Add(FPrintDate);
    end;
    try
       MyReport1.templatefilename:='��������';
       MyReport1.execute('',PrintStrings);
    except
     exit;
     showmessage('�д�������ϵ����Ա')
    end;
  end ;
end;

// ��ӡ����Э��
function TFrm_Selectcontract.PrintLjxy: Boolean;
begin
 with dm_epm.adoqry_plan do
  begin
   PrintStrings.Clear;
   PrintStrings.Add(FP_sgdw);      // ��ͬ�ҷ���λ

   PrintStrings.Add(Fprjname);     //��������
   PrintStrings.Add(FP_sgdw);
   PrintStrings.Add(FAddress);
   PrintStrings.Add(FPrintDate);
  end;
   MyReport1.templatefilename:='ljxy';
   MyReport1.execute('',PrintStrings);
end;



// ��ӡ���ں�ͬ
function TFrm_Selectcontract.PrintDelayRep: Boolean;
 var startdate :TDateTime;
begin
 with dm_epm.adoqry_plan do
  begin
   PrintStrings.Clear;
   PrintStrings.Add(FP_sgdw);      // ��ͬ�ҷ���λ
   PrintStrings.Add(Fprjaccount);
   PrintStrings.Add(Fprjname);     //��������
   PrintStrings.Add(DateTimeToStr(fieldbyname('DelayStart').AsDateTime));
    PrintStrings.Add(DateTimeToStr(fieldbyname('DelayEnd').AsDateTime ));
   PrintStrings.Add(FP_sgdw);
   PrintStrings.Add(FAddress);
   PrintStrings.Add(Datetostr( fieldbyname('DelayStart').AsDateTime));
  end;
   MyReport1.templatefilename:='DelayContract';
   MyReport1.execute('',PrintStrings);
end;

//��ӡ�����ͬ
function TFrm_Selectcontract.PrintJlContract: Boolean;
begin
  with dm_epm.adoqry_plan do
  begin
   PrintStrings.Clear;
   PrintStrings.Add(trim(fieldbyname('jlhtbh').AsString));   // �����ͬ���
   PrintStrings.Add(trim(fieldbyname('jldw').AsString));      // �����ͬ�ҷ���λ
   PrintStrings.Add(Fprjname);     //��������
   PrintStrings.Add(Fprjaccount);    //�����˺�
   PrintStrings.Add(FprjAddress);    //���̵ص�
   PrintStrings.Add(Money2ChineseCapital2(fieldbyname('jlfee').AsFloat));   //�����
   PrintStrings.Add(FJLdwAddress); // �ҷ���ַ��Ϣ
   PrintStrings.Add(FJLdwPostCode); //�ʱ�
   PrintStrings.Add(FJLdwTel); // �绰
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
   PrintStrings.Add(trim(fieldbyname('jldw').AsString));  // �����ͬ�ҷ���λ
   PrintStrings.Add(FJLdwAddress); // �ҷ���ַ��Ϣ
   PrintStrings.Add(FJLdwTel); // �绰
   PrintStrings.Add(FPrintDate);
  end;
   MyReport1.templatefilename:='ljxy_jl';
   MyReport1.execute('',PrintStrings);
end;

//��ӡ����ͬ
function TFrm_Selectcontract.PrintChContract: Boolean;
begin
  with dm_epm.adoqry_plan do
  begin
   PrintStrings.Clear;
   PrintStrings.Add(trim(fieldbyname('chhtbh').AsString));   // ����ͬ���
   //PrintStrings.Add(trim(fieldbyname('chdw').AsString));      // ����ͬ�ҷ���λ
   PrintStrings.Add(Fprjname);     //��������
   PrintStrings.Add(Fprjaccount);    //�����˺�
   PrintStrings.Add(FprjAddress);    //���̵ص�
   PrintStrings.Add(Money2ChineseCapital2(fieldbyname('chf').AsFloat));   //����
   PrintStrings.Add(FPrintDate);
   PrintStrings.Add(Loginuser);   // ������
  end;
   MyReport1.templatefilename:='chht';
   MyReport1.execute('',PrintStrings);
end;

procedure TFrm_Selectcontract.FormDestroy(Sender: TObject);
begin
  Printstrings.Free;
end;

end.
