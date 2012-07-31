unit Pubvar;
{***************************************************************************

    Description:
        This unit defined the Globle Public constant and varible for application
        The application level error also processed in this unit ; Some ommon
        function and procedures are included;

    CreateDate:     2001-12-12
    Author:         Bearing
    Last Modified:  2005-06-16
    todo: 1��������Ϣ�մ�ȷ��
          2������ѡ����Ż�
******************************************************************************}

interface

uses
  SysUtils, Classes,Windows, Messages, Forms, Controls, viewdoc, DateUtils,Dialogs;

  const
     croottxtask = '�ҵ�������';
     croottxthistory ='��ʷ��Ŀ';
     ErrorHint = '�Բ���,��������δ֪��ԭ������˴����������Ƶ�����֣��뽫���ⷴ����ϵͳ����Ա';
     SucsaveMessage = '�����ѱ���ɹ�';
     DelConfirm = '��ȷ��Ҫɾ����ѡ��Ŀ��?';
     InputHint = '�������������Ƿ�������';
     SysAdmin = 4;                               //ϵͳ����Ա
     VipUser = 2  ;                              //vip user
     Designchief = 5;                            //���������
     GeneralUser = 3;                            //������Ա
     NewMode = 0;                               //Fram�����½�ģʽ
     EditMode = 1;                              //Fram����༭ģʽ
     BroswerMode = 2;                           //Fram�������ģʽ
     SubNewMode = 3;
     TaskView = 1;                              //��Ŀ��������ͼ
     SearchView = 3;                            //������ͼ
     NavigatorView = 2;                             //���Ŀ������ͼ
     C_Nodetype =  'TaskByType';
     C_DisUsePrj = 'DisUsePrj'  ;
     C_PausePrj  = 'PausedTask' ;
     C_Recycle  = 'RecycleTask';
     C_DeletaPrj = 'Wtdesign';
  var
    Loginuser:    string;                     //��¼�û�����
    CurCorpCode:  string;                     //��˾����
    userjobid:    string;                     //��¼�û�����
    userdepart:   string;                     //��¼�û�����
    RolName :     string;
    permission:   integer;                   //��¼�û�Ȩ��
    Filepath:     string;                    //�ļ����·������
    function GetClendar:   string;           //��������form��ȡ����
    Procedure Previewdoc(const filename:string);//������������ͼ��
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
  TaskInfo=record          //������Ŀ��Ϣ��¼
       PrjDm:      string;    //��Ŀ����
       PrjName:    string;    //��Ŀ����
       NodeCode:   string;    //�ڵ����
       TaskName:   string;    //�����ʺ�
       Prjtype:    string;    //���񣨽ڵ㣩����
       PrjAcc:     string;    //��������
       Executor:   string;    //��ǰִ����
       PrjSource:  String;    //������Դ��¼����
       DesignBy:   string;     //�����
  end;

 {�����������ͼ�¼  }
  Ptasktype=^tasktype;
  tasktype=record
       tasknum:integer;    //��Ŀ��������
       //delaynum:   integer;  //������Ŀ����
       //finishflag: string;   //�Ƿ����־
       //backflag:   string;   // �Ƿ������Ŀ
       typename: string;     //��Ŀ����
  end;

  Pfile=^filename;
  filename=record
      DocName:   string;    //Ԥ��������ļ���
  end;

  Pfield=^fieldcode;
  fieldcode=record
       FieldCode:TstringList //�ֶδ���
  end;

implementation

uses getclendar;
const  mnUnit:WideString ='�ֽ�Ԫ';
const  OtherWords:WideString='����';
const  hzUnit:WideString = 'ʰ��Ǫ��ʰ��Ǫ��';
const  hzNum:WideString='��Ҽ��������½��ƾ�';



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
//      showmessage('�ļ�������Ϊ��')
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

 { ���������ʼ���ڼ�Ĺ����� ��ȥ��˫���պͷ�����Ϣ��}

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
      Result := '��Ԫ';
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
    Raise Exception.Create('��ֵ����!');
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
