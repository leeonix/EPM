unit Dm;
{***************************************************************************
 项目名称:  闵行供电公司供配电工程信息管理系统
 单元说明:    数据访问层
 描    述:   为系统提供数据访问的集中管理，简单业务规则
 日    期:   2001-12-12
 作    者:   程哨兵

 todo: 迁移到应用服务器,改成分布式架构，三层模式

 Copyright (c) 2001-? Shanghai Dawning Software Corporation
******************************************************************************}

interface

uses
  SysUtils,
  Classes,
  DB,
  ADODB,
  Dialogs,
  forms,
  StdCtrls,
  ComCtrls,
  FmxUtils,
  Controls,
  Variants,
  pubvar,
  ExtCtrls,
  windows,
  dateutils, StrUtils,
  IniFiles;

type

  {         tpPocessing:在建工程，tpDeleted：删除到废件箱中；tpArchived：归档;
            tfdelegated:委托设计;tpcanceled:作废工程;tfpaused:缓建;
            tfactive :流程处理中,tfHide:作为父工程隐藏，
    }
  TPrjState = (tpPocessing,tpDeleted,tpArchived,tpDelegated,tpCanceled);

  TflowState = (tfdisActive,tfActive,tfPuased,tfHide);
   

  TDm_Epm = class(TDataModule)
    cn_epm: TADOConnection;
    adoqry_pub:          TADOQuery;
    adoqry_input:        TADOQuery;
    qry_gettime:         TADOQuery;
    opendlg: TOpenDialog;
    ADOQry_doc: TADOQuery;
    ds_doc: TDataSource;
    ADOQry_docSSXMDM:    TStringField;
    ADOQry_docDOCCODE:   TAutoIncField;
    ADOQry_docDOCTYPE:   TStringField;
    ADOQry_docCREATEBY:  TStringField;
    ADOQry_docFILETYPE:  TStringField;
    ADOQry_docLAYOUT:    TStringField;
    ADOQry_docSCALE:     TStringField;
    ADOQry_docVERSION:   TStringField;
    ADOQry_docREMARK:    TMemoField;
    ADOQry_docCREATEDATE: TDateTimeField;
    ADOQry_docid:        TStringField;
    adoqry_plan:         TADOQuery;
    ds_plan:             TDataSource;
    adoqry_planJHKGRQ: TDateTimeField;
    adoqry_planJHJGRQ: TDateTimeField;
    adoqry_planSGKGRQ: TDateTimeField;
    adoqry_planSGJGRQ: TDateTimeField;
    adoqry_planJLF: TStringField;
    adoqry_planHTJE: TStringField;
    adoqry_planSGDW: TStringField;
    adoqry_planPrintDate: TDateTimeField;
    adoqry_planPRJCODE: TStringField;
    adoqry_rep: TADOQuery;
    adoqry_bud: TADOQuery;
    adoqry_budPRJCODE: TStringField;
    adoqry_budBUDFEE: TBCDField;
    adoqry_budFEENUM: TBCDField;
    adoqry_budITEM_K1: TBCDField;
    ds_bud: TDataSource;
    ADOQry_docDOCNAME: TStringField;
    ADOQry_docFILENAME: TStringField;
    adoqry_budBUDITEM: TStringField;
    ADOQry_export: TADOQuery;
    ADOQry_exportPRJNAME: TStringField;
    ADOQry_exportPRJACCOUNT: TStringField;
    ADOQry_exportCONSTRUCTBY: TStringField;
    ADOQry_exportDESIGNCOMPANY: TStringField;
    ADOQry_exportOTHERTYPE: TStringField;
    ADOQry_exportYHMC: TStringField;
    ADOQry_exportLXR: TStringField;
    ADOQry_exportLXDH: TStringField;
    ADOQry_exportYYSFJE: TStringField;
    ADOQry_exportYYSFRQ: TDateTimeField;
    ADOQry_exportPFWJWH: TStringField;
    ADOQry_exportKYSBRQ: TDateTimeField;
    ADOQry_exportKYPFRQ: TDateTimeField;
    ADOQry_exportKYSBBM: TStringField;
    ADOQry_exportDYDJ: TStringField;
    ADOQry_exportZJRL: TStringField;
    ADOQry_exportZJPFWH: TStringField;
    ADOQry_exportYSSBRQ: TDateTimeField;
    ADOQry_exportZJPFRQ: TDateTimeField;
    ADOQry_exportGSTZ: TStringField;
    ADOQry_exportPRIMMATERIAL: TMemoField;
    ADOQry_exportPRJADD: TStringField;
    ADOQry_exportSLYYY: TStringField;
    ADOQry_exportNODENAME: TStringField;
    ADOQry_exportEXECUTOR: TStringField;
    ADOQry_exportTYPENAME: TStringField;
    ADOQry_exportDESIGNBY: TStringField;
    ADOQry_exportCHECKBY: TStringField;
    ADOQry_exportBUDGETBY: TStringField;
    ADOQry_exportBUDCHECKBY: TStringField;
    ADOQry_exportAPPROVBY: TStringField;
    ADOQry_exportSENDDOCBY: TStringField;
    ADOQry_exportDESIGNDATE: TDateTimeField;
    ADOQry_exportCHECKDATE: TDateTimeField;
    ADOQry_exportBUDDATE: TDateTimeField;
    ADOQry_exportAPPROVDATE: TDateTimeField;
    ADOQry_exportSENDDOCDATE: TDateTimeField;
    ADOQry_exportRECIEVEDATE: TDateTimeField;
    adoqry_com: TADOQuery;
    adoqry_planAccCorpcode: TStringField;
    adoqry_budBudgetId: TAutoIncField;
    adoqry_budSjFee: TBCDField;
    ADOQry_exportBudFee: TBCDField;
    adoqry_plansghtbh: TStringField;
    adoqry_planDelayStart: TDateTimeField;
    adoqry_planDelayEnd: TDateTimeField;
    adoqry_planprepayment: TStringField;
    adoqry_planChf: TStringField;
    adoqry_planJldw: TStringField;
    adoqry_planchhtbh: TWideStringField;
    adoqry_planjlhtbh: TWideStringField;
    adoqry_planJlfee: TStringField;
    adoqry_planSglb: TStringField;
    adoqry_planJsje: TStringField;
    adoqry_planSbf: TStringField;
    adoqry_planJsrq: TDateTimeField;
    adoqry_planBudgetId: TIntegerField;
    adoqry_planKgbgbh: TStringField;
    adoqry_planSjf: TStringField;
    adoqry_planaqglbh: TStringField;
    adoqry_planJffzr: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure ADOQry_docAfterInsert(DataSet: TDataSet);
    procedure ADOQry_docCalcFields(DataSet: TDataSet); 
  private
    { Private declarations }
  //  Procedure Execute

  public
     function  Lindoc( prjcode:string;linktype:integer=0):Boolean; overload;
     function  Lindoc( prjid,corpcode:string):Boolean; overload;
     function  GetnewitemNo(const ctype:string):String;
     function  GeneratWorkplan(const Recordid,flowcode:string;startdate:Tdatetime):boolean;
     function  SetFlowlog(const RecordId,Sourcenode,Action,Desnode,setby:string;Toperson:TstringList):boolean;
     function  InsertParam(Const mcParamType,mcParamName:String):String;
     procedure InitParam(mComboBox:TComboBox;Const mcParamType,mcParamFunc:String);
     procedure InitCombobox(Tagetcombobox:Tcombobox);
     function  DisusePrj(const prjcode,Reason:string):Boolean;
     {日期型字段显示过程,在OnGetText事件中调用}
   //  procedure DateFieldGetText(Sender: TField; var Text: String);
     {日期型字段输入判断函数,在OnSetText事件中调用}
    // function DateFieldSetText(Sender: TField;const Text: String):Boolean;
     function  Wtdesign(const PrjCode,Nodecode,designby:string):Boolean;

  end;
  {*****************Static function and procedure*******************************}
  procedure QryWork(UseQuery:TADOQuery;cSQL:String;OpenQuery:Boolean=True); overload;
  procedure QryWork(cSQL:String;OpenQuery:Boolean=True); overload;
  procedure LoadData(Dataset:TADOQuery;cSql:string;sender:Tframe;const Targ:Integer=0);
  Procedure InputAllData(Const mSQL,mProjectID,Recordkey:String;mFrame:TFrame;cTag:Integer=0);
  function  GetTime():Tdatetime;
  function  SetTaskNode(const RecordId,Targetnode,SourceNode:string;Executors:TstringList):boolean;
  function  Delprj(const PrjCode:string):Boolean;
  function  Cleardel(const PrjCode:string):Boolean;

  function  PausePrj(const PrjCode,Nodecode,Reason:string):Boolean;
  function  ReActiveprj(const PrjCode,Nodecode:string):Boolean;
  function  Returnprj(const PrjCode:string):Boolean;
  function  ArcPrj(const prjcode,Nodecode:string):Boolean;
  function  FinishPrj(const prjcode,nodecode:string;cTag:Integer=0):Boolean;
  procedure InitCombobox(Tagetcombobox:Tcombobox);
  function GetContractNO(const contracttype:string; PrintDate:TDate): string;

const
  strFinishPrj = 'Update flownodeinfo set finishflag=''1'''
      +' where xmdm=''%s'' and nodecode= ''%s''';
  strFinishHidePrj = 'Update FlowNodeinfo set Finishflag=''1'', Activeflag=''3'' '
      +'where xmdm=''%S'' and NodeCode= ''%S''';
  strPausePrj = 'Update flownodeinfo set activeflag=''2'' where xmdm=''%S'''
      +' and nodecode=''%S'' Insert prj_paused(prjcode,pausedby,pauseddate,pausedreason,Ispaused) '
      +'values(''%S'',''%S'',''%S'',''%S'',''1'')';
var
  Dm_Epm: TDm_Epm;

implementation

uses newdoc, MAIN;

{$R *.dfm}    

//procedure TDM_Epm.DateFieldGetText(Sender: TField;var Text: String);
//var
//  dDate:TDate;
//  wYear,wMonth,wDay:Word;
//  aryTestYMD:Array [1..2] of Char;{测试输入掩码用临时数组}
//  iYMD:Integer;
//begin
//  dDate:=Sender.AsDateTime;
//  if dDate=0 then
//    begin
//      Text:='';
//      exit;
//    end;
//  DecodeDate(dDate,wYear,wMonth,wDay);
//
// {测试输入掩码所包含的格式.}
//  aryTestYMD[1] := '年';
//  if StrScan(PChar(Sender.EditMask),aryTestYMD[1])<>nil then
//    iYMD:=1;
//    aryTestYMD[1]:='月';
//  if StrScan(PChar(Sender.EditMask),aryTestYMD[1])<>nil then
//    iYMD:=2;
//    aryTestYMD[1]:='日';
//  if StrScan(PChar(Sender.EditMask),aryTestYMD[1])<>nil then
//    iYMD:=3;
//
//  case iYMD of
//    1:{输入掩码为:”yyyy年”的格式.} // jieopen listing
//      Text:=IntToStr(wYear)+'年';
//    2: {输入掩码为:”yyyy年mm月”的格式.}
//      Text:=IntToStr(wYear)+'年'+IntToStr(wMonth)+'月';
//    3: {输入掩码为:”yyyy年mm月dd日”的格式.}
//      Text:=IntToStr(wYear)+'年'+IntToStr(wMonth)+'月'
//		+IntToStr(wDay)+'日';
//  else {默认为:”yyyy年mm月dd日”的格式.}
//    Text:=IntToStr(wYear)+'年'+IntToStr(wMonth)+'月'
//	               +IntToStr(wDay)+'日';
//  end;
//
//end;
//
//function TDM_Epm.DateFieldSetText(Sender: TField;const Text: String):Boolean;
//var
//  dDate:TDate;
//  sYear,sMonth,sDay:String;
//  aryTestYMD:Array [1..2] of Char;
//  iYMD:Integer;
//begin
//  {获得用户输入的日期}
//  sYear:=Copy(Text,1,4);
//  sMonth:=Copy(Text,7,2);
//  SDay:=Copy(Text,11,2);
//  if (sYear<>'    ') and  (sMonth<>'  ') and (SDay<>' ')  then
//  begin
//
//  {测试输入掩码所包含的格式.}
//    aryTestYMD[1]:='年';
//    if StrScan(PChar(Sender.EditMask),aryTestYMD[1])<>nil then
//      iYMD:=1;
//    aryTestYMD[1]:='月';
//    if StrScan(PChar(Sender.EditMask),aryTestYMD[1])<>nil then
//      iYMD:=2;
//    aryTestYMD[1]:='日';
//    if StrScan(PChar(Sender.EditMask),aryTestYMD[1])<>nil then
//      iYMD:=3;
//
//    {利用Try…Except进行输入的日期转换}
//    try
//    begin
//        case iYMD of
//          1: {输入掩码为:”yyyy年”的格式.}
//            begin
//              dDate:=StrToDate(sYear+'-01-01');{中文Windows默认的日期格式为:yyyy-mm-dd.下同}
//              Sender.AsDateTime:=dDate;
//            end;
//          2: {输入掩码为:”yyyy年mm月”的格式.}
//            begin
//              dDate:=StrToDate(sYear+'-'+sMonth+'-01');
//              Sender.AsDateTime:=dDate;
//            end;
//          3: {输入掩码为:”yyyy年mm月dd日”的格式.}
//            begin
//              dDate:=StrToDate(sYear+'-'+sMonth+'-'+sDay);
//              Sender.AsDateTime:=dDate;
//            end;
//        else {默认为:”yyyy年mm月dd日”的格式.}
//          begin
//            dDate:=StrToDate(sYear+'-'+sMonth+'-'+sDay);
//            Sender.AsDateTime:=dDate;
//          end;
//        end;
//        DateFieldSetText:=True;
//      end;
//     except
//      {日期转换出错}
//      begin
//        Application.MessageBox(PChar(Text+'不是有效的日期!'),'错误',mb_Ok+mb_IconError);
//        DateFieldSetText:=False;
//      end;
//    end;
//  end else
//  begin
//    sender.AsString:='';
//  end;
//end;

{执行查询SQL操作; }
procedure QryWork(UseQuery:TADOQuery;cSQL:String;OpenQuery:Boolean=True); overload;
begin
  with UseQuery do
  begin
    if Active then Close;
    Sql.Clear;
    Sql.Add(cSQL);
    if OpenQuery then Active := true
    else ExecSQL;
  end;
end;

procedure QryWork(cSQL:String;OpenQuery:Boolean=True); overload;
begin
  with Dm_Epm.adoqry_pub do
  begin
    if Active then Close;
    Sql.Clear;
    Sql.Add(cSQL);
    if OpenQuery then Active := true
    else ExecSQL;
  end;

end;


procedure InitCombobox(Tagetcombobox:Tcombobox);
var cTemp:string;
begin
  cTemp:= TagetComBobox.Text;
  DM_epm.InitParam(TagetComBobox,TagetComBobox.Name,'');
  TagetComBobox.Text:=cTemp;
end;

//处理完成工程后,将其归入已处理项目;
function  FinishPrj(const prjcode,Nodecode:string;cTag:Integer=0):Boolean;
var Csql:string;

begin
   if cTag=0 then
    csql := Format(strFinishPrj,[prjcode,Nodecode])
   else
     csql := Format(strFinishHidePrj,[prjcode,Nodecode]) ;
   try
     Qrywork(dm_epm.adoqry_pub,cSql,false);
     Result := true;
   except
     Result := false;
     showmessage(ErrorHint);
   end;
end;

//将工程状态置为当前执行人的暂停项目
function  PausePrj(const Prjcode,Nodecode,Reason:string):Boolean;
var Csql:string;
begin
     cSql := Format(strPausePrj,
        [PrjCode,Nodecode,PrjCode,Loginuser, FormatDateTime('yyyy-mm-dd hh:mm',GetTime),Reason]);
   try
     Qrywork(dm_epm.adoqry_pub,cSql,false);
     Result:=true;
   Except
     ReSult:=False;
     Showmessage(ErrorHint);
  end;
end;

//从暂缓项目中重新启动项目任务
function  ReActiveprj(const prjcode,Nodecode:string):Boolean;
var cSql:string;
begin
   Result:=false;
   csql:='execute ReActiveprj '''+Prjcode+''','''+Nodecode+'''';
   try
     Qrywork(dm_epm.adoqry_pub,cSql,false);
     result:=true;
   Except
     result:=false;
   end;
end;



function  ArcPrj(const prjcode,Nodecode:string):Boolean;
var Csql:string;
begin
  Result:=false;

  csql:= ' begin tran  update projectinfo set flag=''2'' where prjcode='''+prjcode+''' '
    +' update flownodeinfo set activeflag=''0'',NodeEnd='''+datetimetostr(gettime)+''',finishflag=''1'' '
    +' where xmdm='''+prjcode+''' and Nodecode='''+Nodecode+'''  commit tran';
  try
    qrywork(dm_epm.adoqry_pub,csql,false);
    Result:=true;
  Except
    showmessage(ErrorHint); //
  end;
end;

//从作废工程中恢复工程项目状态
function  Returnprj(const prjcode:string):Boolean;
var cSql:string;
begin
   result:=false;
   csql:='Update projectinfo set flag=''0'' where prjcode='''+prjcode+'''';
   try
     Qrywork(dm_epm.adoqry_pub,cSql,false);
     result:=true;
   Except                         //
     showmessage(ErrorHint);
   end;
end;

//从数据库中删除置为废件的工程记录，同时级联删除所有与该工程相关的信息；
function Cleardel(const Prjcode:string):Boolean;
var Csql:string;
begin
   result:=false;
   csql:='Delete projectinfo  where prjcode='''+prjcode+'''';
   try
     Qrywork(dm_epm.adoqry_pub,cSql,false);
     result:=true;
   Except

     showmessage(ErrorHint);
   end;
end;

//将工程置为废件
function  Delprj(const Prjcode:string):Boolean;
var cSql:string;
begin
   Result := false;
   cSql := 'Update projectinfo set flag=''1'' where prjcode='''+prjcode+'''';
   try
     Qrywork(Dm_epm.Adoqry_pub,cSql,False);
     Result:=true;
   Except
     ShowMessage(ErrorHint);
   end;
end;


//显示fram界面内容；
procedure Loaddata(Dataset:TADOQuery;cSql:string;sender:Tframe;const Targ:Integer=0);
var I:integer;
begin
  QryWork(Dataset,cSql);
  with Dataset do
  begin
    if not IsEmpty then
    begin
      for I:=0 to sender.ComponentCount-1 do
      if Targ = (sender.Components[I]).Tag  then
      begin
        if (sender.Components[I] is  Tedit) then
           Tedit(sender.Components[I]).Text := VarToStr(FieldValues[sender.Components[I].Name])
        else if (sender.Components[I] is  Tlabelededit) then
           Tlabelededit(sender.Components[I]).Text := VarToStr(FieldValues[sender.Components[I].Name])
        else if (sender.Components[I] is  Tcombobox) then
           TCombobox(sender.Components[I]).Text := VarToStr(FieldValues[sender.Components[I].Name])
        else if (sender.Components[I] is  Tdatetimepicker) then
        begin
          if FieldByName(sender.Components[I].Name).IsNull then
             Tdatetimepicker(sender.Components[I]).DateTime := DATE
          else
         Tdatetimepicker(sender.Components[I]).DateTime := VarToDateTime(FieldValues[sender.Components[I].Name]);
        end else if (sender.Components[I] is TRichEdit) then
           TRichedit(sender.Components[I]).text := VarToStr(FieldValues[sender.Components[I].Name])
        else if (sender.Components[I] is  Tradiobutton) then
           TRadiobutton(sender.Components[I]).Checked := VarToStr(FieldValues[sender.Components[I].Name])='1'
        else if (sender.Components[I] is  Tcheckbox) then
           Tcheckbox(sender.Components[I]).Checked := fieldbyname(sender.Components[I].Name).AsString='1'
        else if (sender.Components[I] is TMemo) then
           TMemo(sender.Components[I]).Lines.Add(VarToStr(FieldValues[sender.Components[I].Name]));

      end;
    end;
  end;
end;

//获得新建项目记录的流水号
function TDm_Epm.GetnewitemNo(const ctype:string):String;
var max_no,ctemp,csql:string;
begin
   ctemp:=FormatDateTime('YYYY',Date)+'00001';
   if ctype='DGXM' then
      csql:='select  Max(right(DGSQID,9)) as maxno from DGAPPLY'
   else if ctype='Doc' then
       csql:='Select  Max(doccode) as maxno from docinfo'
   else csql:='Select  Max(right(PRJcode,9)) as maxno from PROJECTINFO';
   QryWork(ADOQRY_PUB,CSQL);
   Max_no:=Trim(ADOQRY_PUB.fieldbyname('maxno').AsString);
   if ctype='doc' then
   begin
     if Max_no='' then Max_No:='0'
     else Max_no:=InttoStr(strtoint(Max_No)+1);
     Result:=Max_no;
   end else
   begin
     if  FormatDateTime('YYYY',gettime)=Copy(Max_No,1,4) then
     begin
       max_no:=inttostr(strtoint(max_no)+1);
       ctemp:=max_no;
     end;
     cTemp:=ctype+ctemp;
     Result:=cTemp;
   end;
end;

Procedure InputALLData(Const mSQL,mProjectID,Recordkey:String;mFrame:TFrame;cTag:Integer=0);
var cSQL,cTemp:String;
    I:Integer;
begin
  cSQL:=mSQL+' where '+Recordkey+'='''+mProjectID+'''';
  with dm_epm.adoqry_input do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add(cSQL);
    Active:=True;
    if isEmpty then
    begin
       Append;
       FieldByName(Recordkey).AsString := mProjectID;
    end  else Edit;
    For I:=0 to mFrame.ComponentCount -1 do
    begin
      if Tcomponent(mFrame.Components[I]).Tag=cTag then
      begin
        if (mFrame.Components[I] is TEdit) then
        begin
          cTemp:=trim(TEdit(mFrame.Components[I]).Text);
          FieldByName(TEdit(mFrame.Components[I]).Name).AsString:=cTemp;
        end
        else if (mFrame.Components[I] is Tlabelededit) then
           FieldByName(Tlabelededit(mFrame.Components[I]).Name).AsString:=
           Tlabelededit(mFrame.Components[I]).Text
        else if (mFrame.Components[I] is TRadiobutton) then
        begin
          if  Tradiobutton(mFrame.Components[I]).checked then
             FieldByName(TRadioButton(mFrame.Components[I]).Name).AsString:='1'
          else
             FieldByName(TRadioButton(mFrame.Components[I]).Name).AsString:='0'
        end else if (mFrame.Components[I] is Tcheckbox) then
        begin
          if  TCheckbox(mFrame.Components[I]).checked then
              FieldByName(TCheckbox(mFrame.Components[I]).Name).AsString:='1'
          else
             FieldByName(TCheckbox(mFrame.Components[I]).Name).AsString:='0'
        end
        else if (mFrame.Components[I] is TComboBox) then
           FieldByName(TComboBox(mFrame.Components[I]).Name).AsString:=
                TComboBox(mFrame.Components[I]).Text
        else if (mFrame.Components[I] is Tdatetimepicker) then
           FieldByName(TDatetimePicker(mFrame.Components[I]).Name).Asstring:=
           datetostr(TDatetimePicker(mFrame.Components[I]).date)
        else if (mFrame.Components[I] is TRichedit) then
           FieldByName(TRichedit(mFrame.Components[I]).Name).AsString:=
                                TRichedit(mFrame.Components[I]).Text
        else if (mFrame.Components[I] is TMemo) then
           FieldByName(TMemo(mFrame.Components[I]).Name).AsString:=
                                TMemo(mFrame.Components[I]).Text ;
      end;
    end;
    Post;
  end;
end;

 //取服务器时间 ,精确到分钟
Function gettime():Tdatetime;
begin
  Dm_epm.Qry_GetTime.Close;
  Dm_epm.Qry_GetTime.Open;
  Result:=StrToDateTime(FormatDatetime('yyyy-mm-dd hh:mm',
    Dm_epm.Qry_GetTime.Fieldbyname('currentdate').AsDateTime));
end;

//更新改变流程状态时写任务节点信息；{ TODO -o程哨兵 -c重构 : 并流的处理和交汇的处理 }
function  SetTaskNode(const RecordId,TargetNode,SourceNode:string;Executors:TstringList):boolean;
var csql,ctemp:string;  I:integer;
    TaskStrings:Tstringlist;
begin
   Result:=false;
  //判断是否具备递交条件
   csql:= 'select SourceTask from flowdirection where aimtask='''+SourceNode+''' AND direction=''P''';
   QryWork(Dm_epm.adoqry_pub,csql);
   Taskstrings:=Tstringlist.Create;
   for I:=0 to Dm_epm.adoqry_pub.RecordCount-1 do
   Taskstrings.Add(Dm_epm.adoqry_pub.fieldbyname('sourcetask').AsString);
   for I:=0 to Taskstrings.Count-1 do
   begin
      cSql:='select * from flownodeinfo where xmdm='''+RecordId+''' and '
      +'NodeCode='''+Taskstrings.Strings[I]+'''';
      QryWork(Dm_epm.adoqry_pub,csql);
      if not Dm_epm.adoqry_pub.IsEmpty then
      while not Dm_epm.adoqry_pub.Eof do
      begin
       if Dm_epm.adoqry_pub.FieldByName('FinishFlag').AsString='0' then
       begin
         showmessage('前面有没有完成的工作不具备条件');
         exit;
       end;
       Dm_epm.adoqry_pub.next;
      end;
   end;
  //获取目标节点的节点名称
   cSql:='select * from tasknode where taskcode='''+Targetnode+'''';
   QryWork(Dm_epm.Adoqry_pub,csql);
   cTemp:=Dm_epm.Adoqry_pub.fieldbyname('taskname').asstring;

  //判断项目目标节点是否已有进度记录 如没有则插入节点进度记录
   cSql:='select * from flownodeinfo where xmdm='''+RecordId+''' and NodeCode='''+TargetNode+'''';
   QryWork(Dm_epm.adoqry_pub,csql);
   if Dm_epm.Adoqry_pub.IsEmpty then
   Begin
     For I:=0 to Executors.Count-1 do
     begin
       csql:= 'Insert Into  FLOWNODEINFO(XMDM,NODECODE,NODENAME,EXECUTOR,'
           +'NODESTART,SENDFROM,ACTIVEFLAG) values('''+RecordId+''','''+Targetnode+''','
           +''''+ctemp+''','''+executors.Strings[I]+''','''+formatdatetime('yyyy-mm-dd hh:nn',gettime)+''','''+LOGINUSER+''',1)';
       Qrywork(Dm_epm.Adoqry_pub,cSql,False);
       if SourceNode<>'' then
       begin
         cSql:='Update FLOWNODEINFO set ACTIVEFLAG=0,NODEEND='''+formatdatetime('yyyy-mm-dd hh:nn',gettime)+''','
                +'FINISHFLAG=''1'' where xmdm='''+recordid+''' and ' ;
         if not Frm_Main.Lsv_Task.Visible then
         csql := csql+'Nodecode='''+SourceNode+''' and Executor='''+Loginuser+''''
         else csql :=  csql+'Nodecode='''+SourceNode+''' and Executor='''+Ptaskinfo(Frm_Main.Lsv_Task.Selected.Data).Executor+'''';
         QryWork(Dm_epm.adoqry_pub,cSql,False);
       end;
     end;
   end else
   Begin
    // 否则
    //1： 如果目标节点属于已完成节点则执行工程项目的回退逻辑，既删除当前进度记录，置目标节点为当前
    //     节点。
     if Dm_epm.Adoqry_pub.FieldByName('finishflag').AsString='1' then
     for I:=0 to executors.Count-1 do
     begin
       cSql:='update flownodeinfo set NodeStart='''+formatdatetime('yyyy-mm-dd hh:nn',gettime)+''', Sendfrom='''+Loginuser+''', '
              +' NodeEnd='''',Activeflag=''1'',executor='''+executors.Strings[I]+''','
              +'FINISHFLAG=''0'',backflag=''1'' where xmdm='''+RecordId+''' and NodeCode='''+TargetNode+'''' ;
       qrywork(Dm_epm.Adoqry_pub,csql,false);
       cSql:='delete flownodeinfo  where xmdm='''+RecordId+''' and NodeCode='''+SourceNode+'''' ;
       qrywork(Dm_epm.Adoqry_pub,csql,false);
     end
   //2： 如果目标节点属于未完成节点，则执行流程合并逻辑，既多个人员操作同一任务在目标节点合并
     else
     begin
       csql:='Update FLOWNODEINFO set ACTIVEFLAG=0,NODEEND='''+formatdatetime('yyyy-mm-dd hh:nn',gettime)+''','
              +'FINISHFLAG=''1'' where xmdm='''+recordid+''' and '
              +'Nodecode='''+SourceNode+'''';
       Qrywork(Dm_epm.adoqry_pub,cSql,False);
     end;
   end;
   Result:=True;
end;


 //记忆用户录入参数及参数的录入使用频度
Function TDm_Epm.InsertParam(Const mcParamType,mcParamName:String):String;
var
   cSQL:String;
   cMaxCode,cMaxMem:String;
   I,iLen:Integer;
begin
//查看参数列表中有无此参数记录；
   Adoqry_pub.Active:=False;
   Adoqry_pub.SQL.Clear;
   Adoqry_pub.SQL.Add('Select * from Param where ParaType='''+mcParamType+'''') ;
   adoqry_pub.SQL.Add(' and ParaName='''+mcParamName+''' and Corpcode='''+CurCorpCode+'''');
   Adoqry_pub.Active:=True;
// 如果没有则插入新的参数记录；
   if Adoqry_pub.IsEmpty then
   begin
     cSQL:='Select Max(ParaCode) MaxCode,Max(USEDNUM) as MaxMem from Param ';
     cSQL:=cSQL+' where ParaType='''+mcParamType+''' and Corpcode='''+CurCorpCode+'''';
     Adoqry_pub.Active:=False;
     Adoqry_pub.SQL.Clear;
     Adoqry_pub.SQL.Add(cSQL);
     Adoqry_pub.Active:=True;
     if Adoqry_pub.isEmpty then
     begin
       cMaxCode:='01';
       cMaxMem:='0000000001';
     end else
     begin
       cMaxCode:=trim(adoqry_pub.FieldByName('MaxCode').AsString);
       cMaxMem:=trim(adoqry_pub.FieldByName('MaxMem').AsString);
       if cMaxCode<>'' then
          cMaxCode:=IntToStr(StrToInt(cMaxCode)+1)
       else cMaxCode:='00';
       if cMaxMem<>'' then
          cMaxMem:=IntToStr(StrToInt(cMaxMem)+1)
       else cMaxMem:='0000000000';
       if Length(cMaxCode)=1 then cMaxCode:='0'+cMaxCode;
       iLen:=10-Length(cMaxMem);
       For I:=1 to iLen do
         cMaxMem:='0'+cMaxMem;
     end;
     cSQL:='Insert Into Param(PARATYPE,PARACODE,PARANAME,USEDNUM,corpcode)';
     cSQL:=cSQL+' Values('''+mcParamType+''','''+cMaxCode+''','''+mcParamName+''','''+cMaxMem+''','''+CurCorpCode+''')';
     Adoqry_pub.Active:=False;
     Adoqry_pub.SQL.Clear;
     Adoqry_pub.SQL.Add(cSQL);
     Adoqry_pub.ExecSQL;
   end else
   begin
     cMaxCode:=trim(adoqry_pub.FieldByName('ParaCode').AsString);
     cMaxMem:=trim(adoqry_pub.FieldByName('USEDNUM').AsString);
     if cMaxMem<>'' then
        cMaxMem:=IntToStr(StrToInt(cMaxMem)+1)
     else cMaxMem:='0000000000';
     iLen:=10-Length(cMaxMem);
     For I:=1 to iLen do
         cMaxMem:='0'+cMaxMem;
     cSQL:='Update PARAm Set USEDNUM='''+cMaxMem+''' where ParaType=''';
     cSQL:=cSQL+mcParamType+''' and ParaCode='''+cMaxCode+''' and corpcode='''+CurCorpCode+'''';
     Adoqry_pub.Active:=False;
     Adoqry_pub.SQL.Clear;
     Adoqry_pub.SQL.Add(cSQL);
     Adoqry_pub.ExecSQL;
   end;
   Result:=cMaxCode;
end;


//按参数使用频率初始化下拉框
Procedure TDm_Epm.InitParam(mComboBox:TComboBox;Const mcParamType,mcParamFunc:String);
var
   cSQL:String;
begin
    cSQL:='Select * from Param where ParaType='''+mcParamType+''' and corpcode='''+CurCorpCode+'''';
    if mcParamFunc<>'' then
       cSQL:=' and ParamFunc='''+mcParamFunc+'''';
    cSQL:=cSQL+' order by USEDNUM DESC,ParaCode DESC';
    Adoqry_pub.Active :=False;
    Adoqry_pub.SQL.clear;
    Adoqry_pub.SQL.Add(cSQL);
    Adoqry_pub.Active:=True;
    mComboBox.Clear;
    While not adoqry_pub.Eof do
       begin
          mComboBox.Items.Add(adoqry_pub.FieldByName('paraName').AsString);
          adoqry_pub.Next;
       end;
    adoqry_pub.Active:=False;
end;

//连接文件到指定规则的磁盘路径
function TDm_Epm.LinDoc( Prjcode: string;LinkType:Integer=0):Boolean;
var desfile,strtemp:string;
begin
  Result := False;
  if Opendlg.Execute then
  begin
    Adoqry_doc.Insert;
    Application.CreateForm(Tfrm_newdoc,frm_newdoc);
    try
      strTemp:=ExtractfileName(opendlg.FileName);
      Adoqry_doc.FieldByName('docname').AsString:=
           copy(strtemp,1,Length(strtemp)-length(extractfileext(strtemp)));
      with Frm_newdoc.DBComboBox1.Items do
      begin
        Clear;
        if Linktype<>0 then
        begin
          Add('可行性报告');
          Add('可研批复');
          Add('资金批复');
          Add('用户分期付款报告');
          Add('设计任务书');
          Add('其他');
        end else
        begin
          Add('设计图纸');
          Add('设计合同');
          Add('设计任务书');
          Add('其他');
        end;
      end;
      if Frm_newdoc.ShowModal=mrok then
      begin
        Desfile:=frm_newdoc.filename+prjcode+extractfileext(opendlg.FileName);
        try
          //if linktype<>0 then
            //movefile(opendlg.FileName,desfile)
          FmxUtils.Copyfile(opendlg.FileName,desfile);
        except
          Adoqry_doc.Cancel;
          Showmessage('不能复制或移动图档');
          Exit;
        end;
        Adoqry_doc.FieldByName('ssxmdm').AsString:=prjcode;
        Adoqry_doc.FieldByName('filename').AsString:=desfile;
        Adoqry_doc.Post;
        Adoqry_doc.Refresh;
        Result := true;
      end else Adoqry_doc.Cancel;
    finally
       Frm_newdoc.Free;
    end;
  end;
end;

// 图纸的版本，创建日期，创建者自动写入
procedure TDm_Epm.ADOQry_docAfterInsert(DataSet: TDataSet);
begin
  Adoqry_doc.FieldByName('version').AsString:='1';
  Adoqry_doc.FieldByName('createby').AsString:=loginuser;
  Adoqry_doc.FieldByName('createdate').Asstring:=formatdatetime('yyyy-mm-dd',gettime);
end;


//计算图档显示用的顺序号
procedure TDm_Epm.ADOQry_docCalcFields(DataSet: TDataSet);
begin
  ADOQry_docid.Value:=inttostr(ADOQry_doc.recno);
  if inttostr(ADOQry_doc.recno)='-1' then
     ADOQry_docid.Value:='1';

end;



//新建工程项目主记录时自动产生按照业务规则计算的此工程各节点计划时间
function TDm_Epm.generatworkplan(const Recordid, flowcode:string;startdate: Tdatetime): boolean;
var csql,ctemp:string;
begin
  ctemp:=datetimetostr(startdate);
  cSql:='exec NEWWORKFLOW '''+Recordid+''','''+flowcode+''','''+ctemp+'''';
  Qrywork(adoqry_pub,csql,false);
end;


//写入工程项目流转操作日志
function TDm_Epm.setflowlog(const RecordId,Sourcenode,Action,Desnode,
            setby:string;Toperson:TstringList):boolean;
var cSql:string;I:Integer;
begin
  if toperson<>nil then
  for I:=0 to Toperson.count-1 do
  begin
    cSql:='insert FLOWHISTORY values('''+formatdatetime('yyyy-mm-dd hh:nn',gettime)+''','''+setby+''','''+toperson.Strings[I]+''','
          +''''+Action+''','''+sourcenode+''','''+desnode+''','''+recordid+''')';
    Qrywork(adoqry_pub,csql,false);
    result:=true;
  end else
  begin
    cSql:='insert FLOWHISTORY values('''+formatdatetime('yyyy-mm-dd hh:nn',gettime)+''','''+setby+''','''','
          +''''+Action+''','''+sourcenode+''','''+desnode+''','''+recordid+''')';
    Qrywork(adoqry_pub,csql,false);
    result:=true;
  end;
end;



function TDm_Epm.Wtdesign(const PrjCode, Nodecode, designby: string): Boolean;
var cSql:string;
begin
   csql := ' begin tran Update projectinfo set flag=''3'',designcompany='''+designby+''' '
          +' where prjcode='''+prjcode+''' update flownodeinfo set NODENAME=''委托设计 '''
          +' where xmdm='''+prjcode+''' and Nodecode='''+Nodecode+''' commit tran';

  try
     QryWork(cSql,false);
     Result := true;
  Except
     Result := false;
  end;
end;

//初始化组合框下拉项 根据需自动记忆的参数
procedure TDm_Epm.InitCombobox(Tagetcombobox: Tcombobox);
var cTemp:string;
begin
  cTemp:= TagetComBobox.Text;
  InitParam(TagetComBobox,TagetComBobox.Name,'');
  TagetComBobox.Text:=cTemp;
end;

function TDm_Epm.DisusePrj(const prjcode,Reason: string): Boolean;
var Csql:string;
begin
  Result:=false;
  csql:= 'update projectinfo set flag=''4'',ZFReason='''+Reason+''' where prjcode='''+prjcode+'''';
  try
    qrywork(dm_epm.adoqry_pub,csql,false);
    self.setflowlog(prjcode,'','将工程作废','',LoginUser,nil);
    Result:=true;
  Except
    showmessage(ErrorHint);
  end;
end;

function TDm_Epm.Lindoc( prjid,corpcode: string):Boolean;
var desfile,strtemp,docname:string;
    I:Integer;
begin
  Result := false;
  if Opendlg.Execute then
  for I:=0 to  opendlg.Files.Count-1 do
  begin
    Adoqry_doc.Insert;
    strTemp:=ExtractfileName(opendlg.Files[I]);
    docname := copy(strtemp,1,Length(strtemp)-length(ExtractFileExt(strTemp)));
    Adoqry_doc.FieldByName('docname').AsString:= docname;

    Desfile := FilePath+Trim(LoginUser)+'\'+'设计图纸'+'\'+DocName;
    Desfile := Desfile+prjid +extractfileext(opendlg.FileName);
     try
        FmxUtils.Copyfile(opendlg.Files[I],desfile);
     except
        Adoqry_doc.Cancel;
        Showmessage('不能复制或移动图档');
        Exit;
     end;
     Adoqry_doc.FieldByName('ssxmdm').AsString := PrjId;
     Adoqry_doc.FieldByName('doctype').AsString := '设计图纸';
     Adoqry_doc.FieldByName('filename').AsString := DesFile;
     Adoqry_doc.Post;
     Adoqry_doc.Refresh;
  end;
  Result := true;
end;

// 按照 2010-31-1-0001 （年-工程类别代码-单位代码-流水号）的编码规则获取最新的合同编号
 // 按照市南新颁布的合同编号管理规定生成新编号   2011-10-08
function GetContractNO(const contracttype:string; PrintDate:TDate): string;
var contractNo,temp,monthstr,csql,searstr:string;
    maxno:Integer;
begin
    monthstr := InttoStr(MonthOf(PrintDate))  ;
    if length(monthstr)=1 then
         monthstr:='0'+monthstr;
    // 施工合同编号
    if contracttype='1' then
    begin
       contractNo := 'SNDJDGCSG['+  IntToStr(YearOf(PrintDate)) + monthstr +']' ;
      searstr :=   'SNDJDGCSG/[' +  IntToStr(YearOf(PrintDate)) + monthstr +'/]%' ;
      csql := 'select Max(sghtbh) as latestno from Arrange where sghtbh like '''+searstr+'''';
      csql := csql +' ESCAPE '''+ '/' +'''';
    end;
    //测绘合同编号
    if contracttype='2' then
    begin
      contractNo := 'SNDJJSFW['+  IntToStr(YearOf(PrintDate)) + monthstr +']' ;
      searstr :=   'SNDJJSFW/[' +  IntToStr(YearOf(PrintDate)) + monthstr +'/]%' ;
      csql := 'select Max(chhtbh) as latestno from Arrange where chhtbh like '''+searstr+'''';
      csql := csql +' ESCAPE '''+ '/' +'''';
    end;
     //监理合同编号
    if contracttype='3' then
    begin
       contractNo := 'SNDJDGCJL['+  IntToStr(YearOf(PrintDate)) + monthstr +']' ;
      searstr :=   'SNDJDGCJL/[' +  IntToStr(YearOf(PrintDate)) + monthstr +'/]%' ;
      csql := 'select Max(jlhtbh) as latestno from Arrange where jlhtbh like '''+searstr+'''';
      csql := csql +' ESCAPE '''+ '/' +'''';
    end;
    //设计合同编号
    if contracttype='4' then
    begin
       contractNo := 'SNDJDGCKC['+  IntToStr(YearOf(PrintDate)) + monthstr +']' ;
      searstr :=   'SNDJDGCKC/[' +  IntToStr(YearOf(PrintDate)) + monthstr +'/]%' ;
      csql := 'select Max(htbh) as latestno from descontract where htbh like '''+searstr+'''';
      csql := csql +' ESCAPE '''+ '/' +'''';
    end;
    QryWork(Dm_Epm.adoqry_pub,csql);
    temp := trim(Dm_Epm.adoqry_pub.FieldByName('latestno').AsString);
    if temp<>'' then
    begin
      temp := RightStr(temp,3);
      maxno := StrtoInt(temp);
      maxno := maxno +1;
      temp := IntToStr(maxno);
      if length(temp)=1 then
         temp:='00'+temp;
      if length(temp)=2 then
         temp:='0'+temp;
      contractNo := contractNo+ temp;
    end else
    contractNo := contractNo+'001'  ;
    result := contractNo;
end;


procedure TDm_Epm.DataModuleCreate(Sender: TObject);
var Appconfig: TIniFile;
begin

  Appconfig:= TIniFile.Create('.\Appconfig.ini');
  try
    cn_epm.ConnectionString := Appconfig.ReadString('SQLConnectionStrings','epmconn','');
  //  cn_nameplate.ConnectionString := Appconfig.ReadString('SQLConnectionStrings','Namplatecomm','');
  finally
     Appconfig.Free;
  end;
end;

end.

