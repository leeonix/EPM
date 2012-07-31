//****************************************************************************
//        Engineering Project Management Infomation System
//                 For Minhang Power Supply Bureau
//             Login User check and set the pubvar of login user
//                 Author: Tuzz    2001/10
//    Copyright (c) 2001-? Shanghai Dawning Software Corporation
//*********************************************Graphics*******************************
unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, DB, ADODB, StdCtrls, umd5,
  Controls, Graphics, Forms,   Dialogs, ExtCtrls,  Buttons,dm,pubvar;

type
  TFrm_Login = class(TForm)
    edtjobid: TEdit;
    edtdep: TEdit;
    edtpwd: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Image1: TImage;
    StaticText1: TStaticText;
    ADOQry_login: TADOQuery;
    Button1: TButton;
    Button2: TButton;
    edtname: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edtjobidExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Login: TFrm_Login;

implementation

{$R *.dfm}

procedure TFrm_Login.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  self.SelectNext(self.ActiveControl,true,true);
end;

procedure TFrm_Login.FormShow(Sender: TObject);
begin
  EdtJobId.SetFocus;
end;

procedure TFrm_Login.edtjobidExit(Sender: TObject);
var cSql:string;
begin
  if trim(EdtJobId.Text)<>'' then
  begin
     { TODO -o程哨兵 -cBug : 处理SQL安全性问题，防止注入攻击 }
     cSql:='select * from employee a inner join compose b on a.jobcode=b.jobcode'
     +' inner join jobrole c on b.rolid=c.rolid  where a.JOBCODE='''+trim(edtjobid.Text)+'''';
     QryWork(ADOQry_login,cSql);
     if ADOQry_login.IsEmpty then
     begin
       showmessage('用户代码不正确，请重新输入');
       Edtjobid.SelectAll;
       Edtjobid.SetFocus;
     end else
     begin
       EdtName.Text := ADOQry_Login.FieldbyName('EMPLOYEENAME').AsString;
       EdtDep.Text  := ADOQry_Login.FieldbyName('DEPARTMENT').AsString;
     end;
  end;
end;

procedure TFrm_Login.Button1Click(Sender: TObject);
begin
  if trim(EdtJobId.Text)='' then
  begin
    showmessage('请输入用户代码');
    EdtJobId.SelectAll;
    EdtJobId.SetFocus;
    Exit;
  end else
 if trim(ADOQry_login.FieldByName('Password').AsString)<> MD5Print(MD5String(edtpwd.Text)) then
  begin
    showmessage('口令不对，请输入口令');
    edtpwd.SelectAll;
    edtpwd.SetFocus;
    exit;
  end else
  begin
    CurCorpCode := trim(ADOQry_login.fieldbyname('corpcode').AsString);
    LoginUser := trim(edtname.Text);
    UserJobId := trim(edtJobid.Text);
    Permission := strtoint(trim(ADOQry_login.fieldbyname('permission').AsString));
    Userdepart := trim(ADOQry_login.fieldbyname('department').AsString);
    RolName:=   trim(ADOQry_login.fieldbyname('rolename').AsString);
    Modalresult := Mrok;
  end;
end;

end.
