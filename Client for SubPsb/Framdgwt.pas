//****************************************************************************
//        Engineering Project Management Infomation System
//                 For Minhang Power Supply Bureau
//
//          代工委托书的显示和录入界面
//
//                 Author: Tuzz    2001/10
//    Copyright (c) 2001-? Shanghai Dawning Software Corporation
//****************************************************************************
unit Framdgwt;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls,dm,pubvar, Buttons, Menus;

const Wm_upnode=wm_user+3;

type
  TFram_dg = class(TFrame)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    WTNR: TRichEdit;
    TabSheet2: TTabSheet;
    XLHSR: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    XLTY: TRadioButton;
    XLBTY: TRadioButton;
    xlbz: TRichEdit;
    Label6: TLabel;
    HSDATE: TEdit;
    sptn_sig: TSpeedButton;
    TabSheet3: TTabSheet;
    Label12: TLabel;
    Label13: TLabel;
    TZYHFFR: TEdit;
    Label11: TLabel;
    Label14: TLabel;
    SpeedButton1: TSpeedButton;
    TZRQ: TEdit;
    SFJE: TEdit;
    SFRQ: TEdit;
    Bevel3: TBevel;
    Panel1: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel2: TBevel;
    Label29: TLabel;
    Label1: TLabel;
    SQDATE: TDateTimePicker;
    LXDH: TEdit;
    SLYYY: TEdit;
    YHMC: TEdit;
    YHDZ: TEdit;
    prjaccount: TEdit;
    Bevel1: TBevel;
    Button1: TButton;
    path: TEdit;
    procedure sptn_dateClick(Sender: TObject);
    procedure sptn_sigClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SFRQDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    prjacc:string;

  public

    inputmode:integer;        //输入模式：0：新建；1：编辑；2：浏览
    DGSQID:string;            //代工委托记录编号；
    CurrentTaskNode: string;  //当前节点代码
    ParentPrj : string;       //父代工申请编号
    parentcode:string;
    DGtype:Integer;            //代工类型：2:闵代,3路灯
    procedure Initfram(const TaskNode, Executor, RecordID: string);
    procedure Createsubprj;
    Function SaveInfo():Boolean;
    procedure GenSubprj;
  end;

implementation

uses MAIN, newitem, tasktree, PrjAcount;

{$R *.DFM}


 // 初始化代工数据显示和录入fram
 // 输入参数：1,TaskNode 节点代码，2，Executor 当前执行人; 3.代工记录编号
 //显示代工工程信息并根据当前工程节点状态,判断权限.
procedure TFram_dg.Initfram(const TaskNode, Executor, RecordID: string);
var csql:string;
    I:Integer;
begin
  //对公有变量赋值
  DGSQID :=  RecordID;
  CurrentTaskNode := TaskNode;
  // DGtype:=2;
  //从代工委托表中取代工工程的委托记录数据并显示 利用界面控件的TAG属性分别赋值
  //tag 标识 ：1 表示是营业员受理录入字段 ；2 表示线路专职核实录入字段；3表示营业收费录入字段
  csql:='select * from DGAPPLY where DGSQID='''+RecordID+'''';
  Loaddata(dm_epm.adoqry_pub,csql,self,1);
  Loaddata(dm_epm.adoqry_pub,csql,self,2);
  Loaddata(dm_epm.adoqry_pub,csql,self,3);
  // permission allocation
  if Executor=loginuser then
  begin
    if TaskNode='030100' then         //工程处于营业受理阶段
    begin
      for I:=0 to self.ComponentCount-1 do
      if  (TComponent(self.components[I]) is TEdit) then
      Tedit(TComponent(self.components[I])).ReadOnly := TComponent(self.components[I]).Tag=1
      else if  (TComponent(self.components[I]) is TRichEdit) then
      TRichEdit(TComponent(self.components[I])).ReadOnly :=  TComponent(self.components[I]).Tag=1
      else TControl(self.components[I]).Enabled:= (TComponent(self.components[I]).Tag=1) or
           (TComponent(self.components[I]).Tag=0) ;
      InputMode:=EditMode;
    end else
    if TaskNode='030200' then    //工程处于线路工区核实代工委托阶段
    begin
      for I:=0 to self.ComponentCount-1 do
      TControl(self.components[I]).Enabled := (TComponent(self.components[I]).Tag=2) or
        (TComponent(self.components[I]).Tag=0);
      inputmode:=editmode;
    end else
    if (TaskNode='030401') or (TaskNode='030402') then  //处于通知收费和收费阶段
    begin
      for I:=0 to self.ComponentCount-1 do
      TControl(self.components[I]).Enabled := (TComponent(self.components[I]).Tag=2) or
        (TComponent(self.components[I]).Tag=0) ;
       inputmode := EditMode;
    end else
    begin
      for I:=0 to self.ComponentCount-1 do
      if  (TComponent(self.components[I]) is TEdit) then
      Tedit(TComponent(self.components[I])).ReadOnly :=  true
      else if  (TComponent(self.components[I]) is TRichEdit) then
      TRichEdit(TComponent(self.components[I])).ReadOnly :=  True
      else TControl(self.components[I]).Enabled:= (TComponent(self.components[I]).Tag=0) ;
      InputMode := BroswerMode;
    end;
  end else
  begin
     for I:=0 to self.ComponentCount-1 do
      if  (TComponent(self.components[I]) is TEdit) then
      Tedit(TComponent(self.components[I])).ReadOnly :=  true
      else if  (TComponent(self.components[I]) is TRichEdit) then
      TRichEdit(TComponent(self.components[I])).ReadOnly :=  True
      else TControl(self.components[I]).Enabled:= (TComponent(self.components[I]).Tag=0) ;
      InputMode := BroswerMode;
  end;
  //系统管理员具有录入和修改所有数据的权限
  if  Permission=SysAdmin then
  begin
     for I:=0 to self.componentCount-1 do
       Tcontrol(self.Components[I]).Enabled:=true;
     InputMode:=EditMode;
  end;
  HSDATE.Enabled:=false;
  TZRQ.Enabled:=false;
  Prjacc:=trim(prjaccount.Text);
end;

procedure TFram_dg.sptn_dateClick(Sender: TObject);
begin
  hsdate.Text:=getclendar;
end;

procedure TFram_dg.sptn_sigClick(Sender: TObject);
begin
   xlhsr.Text:=loginuser;
   hsdate.Text:=datetimetostr(gettime);
end;

//自动签名和通知收费日期
procedure TFram_dg.SpeedButton1Click(Sender: TObject);
begin
   TZYHFFR.Text:=loginuser;
   TZRQ.Text:=Datetimetostr(gettime);
end;

procedure TFram_dg.SFRQDblClick(Sender: TObject);
begin
  sfrq.Text:=getclendar;
end;

//保存界面录入数据
function TFram_dg.SaveInfo:Boolean;
//检查数据录入有效性
  function CheckInput():Boolean;
  var csql:string;
  Begin
    Result:=false;
    if trim(YhMc.Text)='' then
    begin
      showmessage('请输入委托单位');
      yhmc.SetFocus;
      yhmc.SelectAll;
      exit;
    end else
    if trim(prjaccount.Text)='' then
    begin
      showmessage('请输入工程帐号');
      prjaccount.SetFocus;
      prjaccount.SelectAll;
      exit;
    end else
    if trim(yhdz.Text)='' then
    begin
      showmessage('请输入单位地址');
      yhdz.SetFocus;
      yhdz.SelectAll;
      exit;
    end;
    if prjacc<>trim(prjaccount.Text) then
    begin
      csql:='select *  from projectinfo where prjaccount='''+trim(prjaccount.text)+'''';
      QryWork(dm_epm.adoqry_pub,csql);
      if not  dm_epm.adoqry_pub.IsEmpty then
      begin
        showmessage('工程帐号不可以重复，请检查工程帐号');
        prjaccount.SetFocus;
        exit;
      end;
    end;
    Result:=True;
  end;

var ctemp1,ctemp2, csql:string;
    Executors:Tstringlist;
begin
 Result:=false;
 if not checkInput then   exit;
 if inputmode=subnewmode then   GenSubprj;
 if inputmode=NewMode then       //新建代工工程
  begin
    try
      csql:='select * from DGAPPLY';
      ctemp1:=dm_epm.GetnewitemNo('DGXM');
      InputallData(cSql,ctemp1,'DGSQID',self,1);
      ctemp2:=dm_epm.GetnewitemNo('P001');
      csql:='Insert Into ProjectInfo(Prjcode,Prjaccount,Prjname,Prjtype,SouceCode,Designcompany,CorpCode) '
             +'values('''+ctemp2+''','''+trim(prjaccount.text)+''','''+trim(yhmc.text)+''','
             +'''001'','''+ctemp1+''',''市南供电设计公司'','''+CurCorpCode+''')';
      QryWork(dm_epm.adoqry_pub,csql,false);
      Executors:=TstringList.Create;
      Executors.Add(Loginuser);
      SetTaskNode(ctemp2,'030100','',Executors);
      Executors.Free;
    except
      showmessage('不能保存数据');
      exit;
    end;
    dm_epm.generatworkplan(ctemp2,'03',gettime);
    dm_epm.setflowlog(ctemp2,'','受理新建代工委托项目','030100',loginuser,nil);
    showmessage('数据保存成功');
    frm_new.ModalResult:=mrok;
    frm_main.Arefresh.Execute;
  end else
  if inputmode=editmode  then   //根据当前节点和执行人修改录入数据
  begin
    csql:='select * from DGAPPLY';
    try
      if Permission=SysAdmin then
      begin
        InputallData(csql,DGSQID,'DGSQID',self,1);
        InputallData(csql,DGSQID,'DGSQID',self,2);
        InputallData(csql,DGSQID,'DGSQID',self,3);
      end else
      If CurrentTaskNode='030100' then inputalldata(csql,DGSQID,'DGSQID',self,1)
      else if CurrentTaskNode='030200' then inputalldata(csql,DGSQID,'DGSQID',self,2)
      else if (CurrentTaskNode='030402') or (CurrentTaskNode='030401') then
      inputalldata(csql,DGSQID,'DGSQID',self,3);
    except
      showmessage('不能保存数据');
      exit;
    end;
    showmessage('数据保存成功');
  end ;
  Result:= true;
end;

procedure TFram_dg.Createsubprj;
var Csql:string;
begin
  csql:='select a.*,path from dgapply a inner join projectinfo on soucecode=DGSQID  where  DGSQID='''+Parentprj+'''';
  Loaddata(dm_epm.adoqry_pub,csql,self,1);
  Loaddata(dm_epm.adoqry_pub,csql,self,2);
  Loaddata(dm_epm.adoqry_pub,csql,self,3);
  prjacc := trim(prjaccount.Text);
end;

procedure TFram_dg.Button1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_GenPrjacc,frm_GenPrjacc);
  if dgtype=6 then frm_GenPrjAcc.PrjAcount:=prjacc;
  frm_GenPrjacc.Init(DGtype);
  try
   if  frm_GenPrjacc.ShowModal=mrok then
    PRJACCOUNT.Text := frm_GenPrjacc.PrjAcount;
  finally
    frm_GenPrjacc.Free;
  end;
end;

procedure TFram_dg.GenSubprj;
var csql,ctemp1,ctemp2,pathstr:string;
    Executors:Tstringlist;
begin
   try
     csql:='select * from DGAPPLY';
     ctemp1:=dm_epm.GetnewitemNo('DGXM');
     inputalldata(csql,ctemp1,'DGSQID',self,1);
     if path.Text<>'' then pathstr := trim(path.Text)+'\'+ parentcode
     else pathstr := parentcode;
     ctemp2:=dm_epm.GetnewitemNo('P001');
     csql:='insert into projectinfo(prjcode,parentcode,path,prjaccount,prjname,prjtype,soucecode,designcompany,CorpCode) '
       +'values('''+ctemp2+''','''+parentcode+''','''+pathstr+''','''+trim(prjaccount.text)+''','''+trim(yhmc.text)+''','
       +'''001'','''+ctemp1+''',''市南供电设计公司'','''+CurCorpCode+''')';
     QryWork(dm_epm.adoqry_pub,csql,false);
     Executors:=TstringList.Create;
     Executors.Add(Loginuser);
     if permission=5 then
     SetTaskNode(ctemp2,'030301','',Executors)
     else   if permission=3 then
       SetTaskNode(ctemp2,'030302','',Executors);
     Executors.Free;
    except
     showmessage('不能保存数据');
     exit;
    end;
    if permission=5 then
      dm_epm.setflowlog(ctemp2,'','新建代工子工程',
                            '030301',loginuser,nil)
    else  if permission= 3 then
       dm_epm.setflowlog(ctemp2,'','新建代工子工程','030302',loginuser,nil);
    showmessage('数据保存成功');
    frm_new.ModalResult:=mrok;
    frm_main.Arefresh.Execute;
end;

end.




