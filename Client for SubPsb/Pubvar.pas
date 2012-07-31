unit Pubvar;
{***************************************************************************

    Description:
        This unit defined the Globle Public constant and varible for application
        The application level error also processed in this unit ; Some ommon
        function and procedures are included;

    CreateDate:     2001-12-12
    Author:         Bearing
    Last Modified:  2005-06-16
    todo: 1、法定休息日待确定
          2、日历选择待优化
******************************************************************************}

interface

uses
  SysUtils, Classes,Windows, Messages, Forms, Controls, viewdoc, DateUtils,Dialogs;

  const
     croottxtask = '我的任务箱';
     croottxthistory ='历史项目';
     ErrorHint = '对不起,程序由于未知的原因出现了错误。如果问题频繁出现，请将问题反馈至系统管理员';
     SucsaveMessage = '数据已保存成功';
     DelConfirm = '您确定要删除所选项目吗?';
     InputHint = '请检查数据输入是否完整？';
     SysAdmin = 4;                               //系统管理员
     VipUser = 2  ;                              //vip user
     Designchief = 5;                            //设计室主任
     GeneralUser = 3;                            //工作人员
     NewMode = 0;                               //Fram界面新建模式
     EditMode = 1;                              //Fram界面编辑模式
     BroswerMode = 2;                           //Fram界面浏览模式
     SubNewMode = 3;
     TaskView = 1;                              //项目任务树视图
     SearchView = 3;                            //查找视图
     NavigatorView = 2;                             //活动项目导航视图
     C_Nodetype =  'TaskByType';
     C_DisUsePrj = 'DisUsePrj'  ;
     C_PausePrj  = 'PausedTask' ;
     C_Recycle  = 'RecycleTask';
     C_DeletaPrj = 'Wtdesign';
  var
    Loginuser:    string;                     //登录用户名称
    CurCorpCode:  string;                     //公司代码
    userjobid:    string;                     //登录用户工号
    userdepart:   string;                     //登录用户部门
    RolName :     string;
    permission:   integer;                   //登录用户权限
    Filepath:     string;                    //文件存放路径规则
    function GetClendar:   string;           //调用日历form获取日期
    Procedure Previewdoc(const filename:string);//调用浏览器浏览图档
    function  GetWorkDays(Bdate,Edate:Tdatetime):integer;
    function Money2ChineseCapital2(const Num:double ): WideString;

type
  TLoginUser = class(TObject)

  private
    FUserName:string;
    FDepart:string;
    FCorp:string;
    FUserId:string;
    FRoles:Tstrings;
    FPermission:Byte;
  protected

  public

    property UserName:string read FUserName write FUserName;
    property UserDepart:string read FDepart write FDepart;
    property CorpCode:string read FCorp write FCorp;
    property Roles:Tstrings read FRoles write FRoles;
    property Permission:Byte read FPermission write FPermission;

  published

  end;



  Ptaskinfo=^taskinfo;
  TaskInfo=record          //工程项目信息记录
       PrjDm:      string;    //项目代码
       PrjName:    string;    //项目名称
       NodeCode:   string;    //节点代码
       TaskName:   string;    //工程帐号
       Prjtype:    string;    //任务（节点）名称
       PrjAcc:     string;    //工程性质
       Executor:   string;    //当前执行人
       PrjSource:  String;    //工程来源记录代码
       DesignBy:   string;     //设计人
  end;

 {工程任务类型记录  }
  Ptasktype=^tasktype;
  tasktype=record
       tasknum:integer;    //项目任务数量
       //delaynum:   integer;  //超期项目数量
       //finishflag: string;   //是否处理标志
       //backflag:   string;   // 是否回退项目
       typename: string;     //项目性质
  end;

  Pfile=^filename;
  filename=record
      DocName:   string;    //预算书磁盘文件名
  end;

  Pfield=^fieldcode;
  fieldcode=record
       FieldCode:TstringList //字段代码
  end;

implementation

uses getclendar;
const  mnUnit:WideString ='分角元';
const  OtherWords:WideString='整负';
const  hzUnit:WideString = '拾佰仟万拾佰仟亿';
const  hzNum:WideString='零壹贰叁肆伍陆柒捌玖';



function GetClendar:string;
begin
  application.CreateForm(Tfrm_getclendar,frm_getclendar);
  try
    if  frm_getclendar.ShowModal=mrok then
    result:=datetostr(frm_getclendar.MonthCalendar1.date);
  finally
    frm_getclendar.Free;
  end;
end;

Procedure Previewdoc(const filename:string);
begin
//    if filename='' then
//      showmessage('文件名不能为空')
//    else
//    begin
//      application.CreateForm(Tfrm_ViewDoc,frm_ViewDoc);
//      try
//        frm_ViewDoc.filename:=filename;
//        frm_ViewDoc.ShowModal;
//      finally
//        frm_ViewDoc.Free;
//      end;
//    end;
end;

 { 计算给定起始日期间的工作日 ，去掉双休日和法定休息日}

function  GetWorkDays(Bdate,Edate:Tdatetime):Integer;
var DurDays,DiffWeeks,Moddate:Integer;
    TempDate:Tdatetime;
begin
   Moddate := 0;
   DurDays := DaysBetween(Bdate,Edate);
   DiffWeeks := WeeksBetween(Bdate,Edate);
   TempDate :=IncDay(Bdate, DiffWeeks*7);
   while TempDate <= Edate do
   begin
     if (DayOfWeek(TempDate) = 1) or (DayOfWeek(TempDate) = 7) then
       Moddate := Moddate+1;
       TempDate := IncDay(TempDate,1);
   end;
   Result := DurDays-DiffWeeks*2-Moddate;
end;


function Money2ChineseCapital2(const Num:double ): WideString;
var
   szNum:PWideChar;
   i,iLen,iLen2, iNum, iAddZero,ResultCount:Integer;
   buff:AnsiString;
   buf:PAnsiChar;

   dblNum: Double;
begin
   if Num = 0 then
   begin
      Result := '零元';
      Exit;
   end;

   SetLength(Result,33*2 + 1);
   iAddZero := 0;
   if Num < 0.0 then
    dblNum := Num * 100.0 + 0.5
  else
    dblNum := Num * 100.0 - 0.5;

   buff := format('%0.0f',[dblNum]);
   if Pos(buff,'e')>0 then begin
    SetLength(Result,0);
    Raise Exception.Create('数值过大!');
    Exit;
   end;
   iLen := Length(buff);
   szNum := PWideChar(Result);
   buf := PAnsiChar(buff);
   if(Num<0.0) then
   begin
      szNum^:=OtherWords[2];
      Inc(szNum);
      Inc(buf);
      Dec(iLen);
   end;

   for i:=1 to iLen do
   begin
      iNum :=Ord(buf^)-48;
      Inc(buf);
      iLen2 := iLen-i;
      if(iNum=0) then
      begin
         if(((iLen2-2) mod 4)=0) and ((iLen2-3)>0) and (((iLen2>=8) or (iAddZero<3))) then
         begin
            szNum^ := hzUnit[(iLen2-3) mod 8 + 1];
            Inc(szNum);
         end;
         Inc(iAddZero);
         if(iLen>1) and (iLen2=1) and (buff[iLen] <> '0') then
         begin
            szNum^:=hzNum[1];
            Inc(szNum);
         end;
      end
      else
      begin
         if(((iAddZero>0) and (iLen2>=2)) and (((iLen2-1) mod 4)<>0) or ((iAddZero>=4) and ((iLen2-1)>0))) then
         begin
            szNum^:=hzNum[1];
            Inc(szNum);
         end;
         szNum^:=hzNum[iNum+1];
         Inc(szNum);
         iAddZero:=0;
      end;
      if (iAddZero<1) or (iLen2=2) then
      begin
         if(iLen-i>=3) then
         begin
            szNum^:=hzUnit[(iLen2-3) mod 8 + 1];
            Inc(szNum);
         end
         else
         begin
            szNum^:=mnUnit[(iLen2) mod 3 +1 ];
            Inc(szNum);
         end;
      end;
   end;
   ResultCount := szNum-PWideChar(Result);
   if((Num < 0.0) and (ResultCount - 1 = 0)) or ((Num>=0.0) and (ResultCount=0)) then
   begin
      szNum^:=hzNum[1];
      Inc(szNum);
      szNum^:=mnUnit[3];
      Inc(szNum);
      szNum^:=OtherWords[1];
      Inc(szNum);
      Inc(ResultCount,3);
   end
   else
   if((Num<0.0) and (buff[iLen+1] ='0')) or ((Num>=0.0) and (buff[iLen] ='0')) then
   begin
      szNum^:=OtherWords[1];
      Inc(ResultCount);
   end;

   SetLength(Result, ResultCount);
end;
{ TLoginUser }

end.
