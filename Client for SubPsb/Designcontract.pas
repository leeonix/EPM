unit designcontract;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,dm,
  pubvar, DB, ADODB, ExtCtrls, StdCtrls, ComCtrls, Spin, MyReport, RzPanel, StrUtils,
  Mask, RzEdit, Grids, DBGrids;

type
  TFram_descontract = class(TFrame)
    Bevel1: TBevel;
    Label14: TLabel;
    Bevel3: TBevel;
    gcnr: TRichEdit;
    Label19: TLabel;
    RzGroupBox5: TRzGroupBox;
    Label1: TLabel;
    stdw: TComboBox;
    Label2: TLabel;
    Bevel2: TBevel;
    Label3: TLabel;
    DBGrid2: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1PRJACCOUNT: TStringField;
    ADOQuery1PRJNAME: TStringField;
    ADOQuery1Sjf: TStringField;
    ADOQuery1sumfee: TStringField;
    Label4: TLabel;
    htbh: TEdit;
    Button1: TButton;
    Button2: TButton;
    htje: TEdit;
    MyReport1: TMyReport;
    prjname: TEdit;
    prjtype: TEdit;
    qdrq: TRzDateTimeEdit;


    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }

  public
     projectid:string;
     strPrjName :string; //工程名称
     Erpcode:string;
     PrjAdd:string;  //工程地址
     strprjtype:string;   //工程性质
     InputMode:Integer;
     Tzze :string ; // 投资总额
     zsjf:string; //设计合同金额- 总的设计费
     xl_zj:string; // 线路总概算
     xl_sjf :string; //线路设计费
     dl_zj:string;     //  电缆总概算
     dl_sjf:string;    // 电缆设计费
     bd_zj:string;     // 变电总概算
     bd_sjf:string;    // 变电设计费
     gl_zj:string;     // 通信概算
     gl_sjf:String;    //光缆通信设计费
     postcode:string;
     tel:string;
     fax:string;
     address:string;
     bankaccount:string;
     bankname:string;
     procedure Init(const Prjcode:string);
     function SaveInfo():Boolean;
     procedure PrintContract();
     function GetPrintParam():Boolean;
    { Public declarations }
  end;

implementation

uses Prj_Design;

{$R *.dfm}

{ TFram_descontract }

procedure TFram_descontract.Button1Click(Sender: TObject);
begin
// save contractinfo
  SaveInfo;
end;

procedure TFram_descontract.Button2Click(Sender: TObject);
begin
  //print design contract
  PrintContract;
end;

function TFram_descontract.GetPrintParam:Boolean;
var cSql:string;
    zj,sjf ,xzj,bzj,dzj,gzj,xsjf,bsjf,dsjf,gsjf,tempsum,tempsjf,singlesjf,Singlezj :integer;
begin
// 设置设计单位地址电话...
  csql := 'select Address,Postcode,Tel,Fax,Bankname,Bankaccount from corp where Name='''+ trim(stdw.Text)+'''';
  QryWork(Dm_Epm.adoqry_pub,csql);
  address :=  Dm_Epm.adoqry_pub.FieldByName('Address').AsString;
  postcode :=  Dm_Epm.adoqry_pub.FieldByName('Postcode').AsString;
  tel :=  Dm_Epm.adoqry_pub.FieldByName('Tel').AsString;
  fax :=  Dm_Epm.adoqry_pub.FieldByName('Fax').AsString;
  bankname :=  Dm_Epm.adoqry_pub.FieldByName('Bankname').AsString;
  bankaccount :=  Dm_Epm.adoqry_pub.FieldByName('Bankaccount').AsString;

 ADOQuery1.First;
 zj :=0; sjf:=0;
 xzj := 0; bzj :=0; dzj:=0;gzj:=0;
 xsjf :=0;  bsjf:=0;dsjf :=0;gsjf:=0;


 while not ADOQuery1.Eof do
 begin
   if ADOQuery1.FieldByName('prjaccount').AsString<>Erpcode then
   begin
     if  (ADOQuery1.FieldByName('sumfee').AsString='')  then
     begin
         ShowMessage('该Erp账号下有分账号的预算投资金额为空，请检查并确认导入正确的数据.');
         tempsum :=   0;
     end else tempsum := ADOQuery1.FieldByName('sumfee').AsInteger;
     if (ADOQuery1.FieldByName('sjf').AsString='') then
     begin
        ShowMessage('该Erp账号下有分账号的设计费为空，请检查并确认导入正确的数据.');
        tempsjf :=   0;
     end else    tempsjf :=   ADOQuery1.FieldByName('sjf').AsInteger;

     zj := zj + tempsum;     // 累计总投资概算
     sjf := sjf + tempsjf;     // 累计设计费
     if   ContainsStr(trim(ADOQuery1.FieldByName('prjaccount').AsString),'-0.4X')
       or  ContainsStr(trim(ADOQuery1.FieldByName('prjaccount').AsString),'-10X')  then    //线路
     begin
       xzj := xzj + tempsum;
       xsjf := xsjf + tempsjf;
     end;
     if   ContainsStr(trim(ADOQuery1.FieldByName('prjaccount').AsString),'-0.4D')
       or  ContainsStr(trim(ADOQuery1.FieldByName('prjaccount').AsString),'-10D')  then  // 电缆
     begin
       dzj := dzj + tempsum;
       dsjf := dsjf + tempsjf;
     end;
     if   ContainsStr(trim(ADOQuery1.FieldByName('prjaccount').AsString),'-G')    //通信光缆...
       then
     begin
       gzj := gzj + tempsum;
       gsjf := gsjf + tempsjf;
     end;
     if   ContainsStr(trim(ADOQuery1.FieldByName('prjaccount').AsString),'-0.4B')
       or  ContainsStr(trim(ADOQuery1.FieldByName('prjaccount').AsString),'-10B')
        or  ContainsStr(trim(ADOQuery1.FieldByName('prjaccount').AsString),'-C') then //变电包含仓位
     begin
       bzj := bzj + tempsum;
       bsjf := bsjf + tempsjf;
     end;
   end  else
   begin
    singlesjf :=  ADOQuery1.FieldByName('sjf').AsInteger;
    Singlezj :=   ADOQuery1.FieldByName('sumfee').AsInteger;
   end;
   ADOQuery1.Next;
 end;
 if (sjf=0) and (ADOQuery1.RecordCount>0) then
 begin
   sjf :=  singlesjf;
   zj :=   Singlezj;
 end;
  xl_zj :=IntToStr(xzj);
  xl_sjf := IntToStr(xsjf);
  bd_zj:= IntToStr(bzj);
  bd_sjf:=IntToStr(bsjf);
  dl_zj:=IntToStr(dzj);
  dl_sjf := IntToStr(dsjf);
  gl_zj := IntToStr(gzj);
  gl_sjf := IntToStr(gsjf);
  Tzze := IntToStr(zj);
  zsjf := IntToStr(sjf);;
  result := true;
end;

procedure TFram_descontract.Init(const Prjcode: string);
var cSql,strerpcode:string;  I:Integer;
begin
  csql := 'select prjname,prjadd from projectinfo where prjcode='''+Prjcode+'''';
  Qrywork(csql);
  strPrjName := dm_epm.adoqry_pub.FieldByName('prjname').AsString;
  PrjAdd :=   dm_epm.adoqry_pub.FieldByName('prjadd').AsString;
  Erpcode := trim(Frm_PrjDesign.Fram_prjbase.stxt_prjacc.Caption);
  strprjtype :=   trim(Frm_PrjDesign.Fram_prjbase.stxt_prjtype.Caption);
  if ContainsStr(Erpcode,'-') then
    Erpcode := Copy(Erpcode,1,Pos('-',Erpcode)-1);

  csql:='select * from Descontract where Erpcode='''+Erpcode+'''';
  Loaddata(dm_epm.adoqry_pub,csql,self);

  if Dm_Epm.adoqry_pub.FieldByName('qdrq').AsString='' then
   qdrq.Date := Date;
  Projectid:=PrjCode;
  if gcnr.Text='' then gcnr.Text :='见设计图纸';
   //转义[]
  if  ContainsStr(Erpcode,'[')  and ContainsStr(Erpcode,']')  then
  strerpcode :=  Copy(Erpcode,1,Pos('[',Erpcode)-1)
             +'!['
             + Copy(Erpcode,Pos('[',Erpcode)+1,Pos(']',Erpcode)-Pos('[',Erpcode)-1)
             +'!]'
             +Copy(Erpcode,Pos(']',Erpcode)+1,Length(Erpcode)-Pos(']',Erpcode))
  else strerpcode := Erpcode;
  csql := 'select b.PRJACCOUNT,b.PRJNAME,a.Sjf,a.sumfee '
        +'from ARRANGE a  inner join PROJECTINFO b on a.PrjCode = b.PRJCODE'
            +' where b.PrjAccount like '''+strerpcode+'%'''
            +'Escape ''!''';
  with ADOQuery1 do
  begin
    active:=false;
    SQL.Clear;
    SQL.Add(csql);
    active:=true;
  end;
  if  userdepart ='电网建设中心' then
  begin
    Inputmode:=EditMode ;
    Button1.Enabled := true;
    button2.Enabled := trim(htje.Text)<>'';
  end  else InputMode:=BroswerMode;
    stdw.Items.Clear;
    csql := 'select name from corp where Type=''设计'' ';
    QryWork(Dm_Epm.adoqry_pub,csql);
    for I :=0  to Dm_Epm.adoqry_pub.Recordcount-1  do
    begin
      stdw.Items.Add(trim(Dm_Epm.adoqry_pub.fieldbyname('name').asstring));
      Dm_Epm.adoqry_pub.Next;
    end;
end;
//打印设计合同输出到word中;
procedure TFram_descontract.PrintContract;
var Printstr:TstringList;
begin
   GetPrintParam;
   PrintStr:=TstringList.Create;
   try
     PrintStr.Add(frm_prjdesign.Fram_prjbase.stxt_prjname.Caption+'('+Erpcode+')'); //1:项目名称
     PrintStr.Add(htbh.Text);                                      //2: 合同编号
     PrintStr.Add(stdw.Text);                                      //3:合同乙方：设计单位
     PrintStr.Add(qdrq.Text);                           //4：签订日期
     PrintStr.Add(stdw.Text);                            // 5:设计单位
     PrintStr.Add(frm_prjdesign.Fram_prjbase.stxt_prjname.Caption);// 6：工程名称
     PrintStr.Add(frm_prjdesign.Fram_prjbase.stxt_prjname.Caption);// 7：工程名称
     PrintStr.Add(PrjAdd);// 8：工程地址
     PrintStr.Add(frm_prjdesign.Fram_prjbase.stxt_prjtype.Caption);     // 9 工程性质
     PrintStr.Add(Tzze);                                                //10,投资总额
     if xl_zj<>'0' then
     begin
       PrintStr.Add('线路');
       PrintStr.Add('施工');
       PrintStr.Add('20');
       PrintStr.Add('初设批复后一个月');
     end else
     begin
       PrintStr.Add('');
       PrintStr.Add('');
       PrintStr.Add('');
       PrintStr.Add('');
     end;
     if dl_zj<>'0' then
     begin
       PrintStr.Add('电缆');
       PrintStr.Add('施工');
       PrintStr.Add('20');
       PrintStr.Add('初设批复后一个月');
     end else
     begin
       PrintStr.Add('');
       PrintStr.Add('');
       PrintStr.Add('');
       PrintStr.Add('');
     end;
      if bd_zj<>'0' then
     begin
       PrintStr.Add('变电');
       PrintStr.Add('施工');
       PrintStr.Add('20');
       PrintStr.Add('初设批复后一个月');
     end else
     begin
       PrintStr.Add('');
       PrintStr.Add('');
       PrintStr.Add('');
       PrintStr.Add('');
     end;
      if gl_zj<>'0' then
     begin
       PrintStr.Add('光缆');
       PrintStr.Add('施工');
       PrintStr.Add('20');
       PrintStr.Add('初设批复后一个月');
     end else
     begin
       PrintStr.Add('');
       PrintStr.Add('');
       PrintStr.Add('');
       PrintStr.Add('');
     end;
     
     PrintStr.Add(zsjf);   //27 总设计费
     PrintStr.Add(datetostr(qdrq.Date));  // 28
     PrintStr.Add(stdw.Text);         //29
     PrintStr.Add(datetostr(qdrq.Date));  //30
     // 填充设计费计算表格
     if xl_zj<>'0' then
     begin
       PrintStr.Add('线路');
       PrintStr.Add('详见2.3');
       PrintStr.Add(xl_zj);
       PrintStr.Add(xl_sjf);
     end else
     begin
       PrintStr.Add('');
       PrintStr.Add('');
       PrintStr.Add('');
       PrintStr.Add('');
     end;
     if dl_zj<>'0' then
     begin
       PrintStr.Add('电缆');
       PrintStr.Add('详见2.3');
       PrintStr.Add(dl_zj);
       PrintStr.Add(dl_sjf);
     end else
     begin
       PrintStr.Add('');
       PrintStr.Add('');
       PrintStr.Add('');
       PrintStr.Add('');
     end;
      if bd_zj<>'0' then
     begin
       PrintStr.Add('变电');
       PrintStr.Add('详见2.3');
       PrintStr.Add(bd_zj);
       PrintStr.Add(bd_sjf);
     end else
     begin
       PrintStr.Add('');
       PrintStr.Add('');
       PrintStr.Add('');
       PrintStr.Add('');
     end;
      if gl_zj<>'0' then
     begin
       PrintStr.Add('光缆');
       PrintStr.Add('详见2.3');
       PrintStr.Add(gl_zj);
       PrintStr.Add(gl_sjf);
     end else
     begin
       PrintStr.Add('');
       PrintStr.Add('');
       PrintStr.Add('');
       PrintStr.Add('');
     end;
     PrintStr.Add(frm_prjdesign.Fram_prjbase.stxt_prjname.Caption); //47:项目名称
      PrintStr.Add(PrjAdd); //48:项目地址
      PrintStr.Add(stdw.Text);
      PrintStr.Add(datetostr(qdrq.Date));
      PrintStr.Add(datetostr(qdrq.Date));
     PrintStr.Add(postcode);
     PrintStr.Add(tel);
     PrintStr.Add(fax);
     PrintStr.Add(bankname);
     PrintStr.Add(bankaccount);
     PrintStr.Add(address);
     PrintStr.Add(tel);
     PrintStr.Add(address);      //59
     PrintStr.Add(gcnr.Text);    //60
     PrintStr.Add(PrjAdd);    //61
     MyReport1.templatefilename:='designcontract';
     MyReport1.execute('',PrintStr);
   finally
     PrintStr.Free;
   end;
end;

function TFram_descontract.SaveInfo: Boolean;
var cSql:string;
begin
  if  GetPrintParam then
  begin
    // if htbh.Text ='' then
     // htbh.Text := GetContractNO('4',qdrq.Date);
      htje.Text := zsjf;
       if strprjtype='业扩' then strprjtype:='002';
         if strprjtype='代工' then strprjtype:='001';
         if strprjtype='住宅配套' then strprjtype:='010';
         if strprjtype='更改' then strprjtype:='006';
         if strprjtype='基建' then strprjtype:='004';
         if strprjtype='业扩配套' then strprjtype :='007';
      prjname.Text := strPrjName;
      prjtype.Text := strprjtype;
      cSql:='select * from descontract ';
      if InputMode=EditMode then
         InputAllData(cSql,Erpcode,'Erpcode',self);
      Button2.Enabled := StrToInt(zsjf)>0;
      Showmessage('数据保存成功');
      result := true;
  end else
  begin
    result:= false;
  end;

end;



end.
