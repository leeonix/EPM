unit NamePlate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, FR_Ctrls,dm,pubvar, DB, ADODB,Variants;

type
  TFram_NamePlate = class(TFrame)
    Label1: TLabel;
    Label2: TLabel;
    Shape1: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape11: TShape;
    Shape15: TShape;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    huming: TEdit;
    bpdz1: TEdit;
    xl1: TEdit;
    mc1: TEdit;
    mcj1: TEdit;
    bz1: TEdit;
    bpdz2: TEdit;
    xl2: TEdit;
    mc2: TEdit;
    mcj2: TEdit;
    bz2: TEdit;
    bpdz3: TEdit;
    xl3: TEdit;
    mc3: TEdit;
    mcj3: TEdit;
    bz3: TEdit;
    bpdz4: TEdit;
    xl4: TEdit;
    mc4: TEdit;
    jcj4: TEdit;
    bz4: TEdit;
    Label19:  TLabel;
    dydj1: TEdit;
    dydj2:   TEdit;
    dydj3:   TEdit;
    dydj4:   TEdit;
    Shape16: TShape;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label8:  TLabel;
    Label7:  TLabel;
    Label6:  TLabel;
    Label22: TLabel;
    Label23: TLabel;
    ADOStp_InPut: TADOStoredProc;
    executor: TEdit;
    dispatcher: TEdit;
    Executedate: TEdit;
    applydepartment: TEdit;
    applyperson: TEdit;
    applydate: TEdit;
    approvby: TEdit;
    approvdate: TEdit;
    ADOStp_InPutdetail: TADOStoredProc;
    ADOStp_update: TADOStoredProc;
    ADOStp_updatedetail: TADOStoredProc;
  private
     Prj_code:string;
     ApplyID:string;
     NameIdList:TstringList;
     function CheckApplyInput():Boolean;
     function CheckNameplate(Tag:integer):Boolean;
    { Private declarations }
  public
     InputMode:Integer;
     procedure CreateNew();
     Procedure Approv();
     procedure Init(const PrjCode:string;IniMode:integer);
     function  InsertApply():Boolean;
     Function  InsertNameplate():Boolean;
     function  UpdateNameplate():Boolean;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFram_NamePlate }

// 新建申请单
procedure TFram_NamePlate.CreateNew;
begin
  applydepartment.Text := UserDepart;
  applyperson.Text := LoginUser;
  applydate.Text := Datetostr(GetTime);
  //huming.SetFocus;
  //Huming.SelectAll;
end;

//检查铭牌申请单主记录有效性
function TFram_NamePlate.CheckApplyInput: Boolean;
begin
  Result:=False;
  if trim(huming.Text)='' then
  begin
    showmessage(InputHint);
    Huming.SetFocus;
    Huming.SelectAll;
    exit;
  end;
  Result:=True;
end;

//检查铭牌输入有效性
function TFram_NamePlate.CheckNameplate(Tag:Integer): Boolean;
var I,j:integer;
begin
  Result:= false;
  for J:=1 to 3 do
  for I:=0 to self.ComponentCount-1 do
  if  (self.Components[I] is TEdit) and (self.Components[I].Tag=(Tag*10+j))then
  begin
    if trim(Tedit(self.Components[I]).Text)='' then
    begin
       //showmessage(InputHint);
       //Tedit(self.Components[I]).SetFocus;
       //Tedit(self.Components[I]).SelectAll;
       exit;
    end;
  end;
  Result:=true;
end;

 //初始化
procedure TFram_NamePlate.Init(const PrjCode: string;IniMode:integer);
var Csql:string; I,J,K:integer;
begin
  InputMode:=IniMode;
  Prj_code:=PrjCode;
  NameIdList:=Tstringlist.Create;
  //如果是新建申请单则根据登录用户初始申请人和申请时间
  if InputMode=NewMode then
  begin
     CreateNew;
  end
  else
  begin
    csql:='select * from ApplyNamePlate where PrjCode='''+prjcode+'''';
    Loaddata(Dm_epm.adoqry_pub,Csql,self,1);
    ApplyID := Dm_epm.adoqry_pub.fieldbyname('ApplyId').AsString;
    Csql:='select * from Nameplatedetail where applyid='''+applyid+'''';
    Qrywork(Dm_epm.adoqry_pub,Csql);
    if  not Dm_epm.adoqry_pub.IsEmpty then
    begin
      for J:=1 to Dm_epm.adoqry_pub.RecordCount do
      begin
        for K:=1 to 6 do
         for I:=0 to self.ComponentCount-1 do
          if (self.Components[I] is TEdit) and (self.Components[I].Tag=((j*10)+k))then
              Tedit(self.Components[I]).Text := Dm_epm.adoqry_pub.Fields[K].AsString;
         NameIdList.Add(Dm_epm.adoqry_pub.fieldbyname('NameplateId').AsString);
         Dm_epm.adoqry_pub.Next;
      end;
    end;
    if InputMode=BroswerMode then
    for I:=0 to self.ComponentCount-1 do
     if (self.Components[I] is TEdit) then
     Tedit(self.Components[I]).Enabled:=False;
  end ;
end;

//插入铭牌申请记录
function TFram_NamePlate.InsertApply: Boolean;
var Csql:string;
begin
 Result:=False;
 if not CheckApplyInput Then exit;

   ADOStp_InPut.Close;
   //ADOStp_InPut.Parameters.Clear;
   //ADOStp_InPut.ProcedureName := 'InsertApplyNameplate';
  { ADOStp_InPut.Parameters.CreateParameter('@huming', ftString, pdInput, 50, trim(huming.text));
   ADOStp_InPut.Parameters.CreateParameter('@prjcode', ftString, pdInput, 13, prj_code);
   ADOStp_InPut.Parameters.CreateParameter('@applyperson', ftString, pdInput, 8, trim(applyperson.text));
   ADOStp_InPut.Parameters.CreateParameter('@applydate', ftstring, pdInput, 20, trim(applydate.Text));
   ADOStp_InPut.Parameters.CreateParameter('@applydepartment', ftString, pdInput, 30, trim(applyDepartment.Text));
   ADOStp_InPut.Parameters.CreateParameter('@PKID', ftInteger, pdOutput, 30, 1); }
   ADOStp_InPut.Parameters.ParamByName('@huming').Value := trim(huming.text);
   ADOStp_InPut.Parameters.ParamByName('@Prjcode').Value := Prj_code;
   ADOStp_InPut.Parameters.ParamByName('@applyperson').Value := trim(applyperson.Text);
   ADOStp_InPut.Parameters.ParamByName('@applyDepartment').Value := trim(applyDepartment.Text);
   ADOStp_InPut.Parameters.ParamByName('@applydate').Value := trim(applydate.Text);
   ADOStp_InPut.Prepared := True;
   try
       ADOStp_InPut.ExecProc;
       ApplyId := inttostr(ADOStp_InPut.Parameters.ParamByName('@PKID').Value);
   EXCEPT
       Showmessage(ErrorHint);
       exit;
   end;
   Result:=true;

end;

// 插入铭牌申请明细
function TFram_NamePlate.InsertNameplate(): Boolean;
var I,J,k:integer;
begin
  Result:=false;
  ADOStp_InPutdetail.Close;
 // ADOStp_InPutdetail.ProcedureName:='InsertNameplate';
  //ADOStp_InPutdetail.Parameters.Clear;
  ADOStp_InPutdetail.Prepared:=true;
  ADOStp_InPutdetail.Parameters.ParamByName('@applyid').Value:=ApplyId;
  try
    for J:=1 to 4 do
    begin
      //if not CheckNameplate(J) then break;
       for K:=1 to 6 do
         for I:=0 to self.ComponentCount-1 do
         if (self.Components[I] is TEdit) and (self.Components[I].Tag=((j*10)+k))then
              ADOStp_InPutdetail.Parameters[k+1].Value:=trim(Tedit(self.Components[I]).Text);
       ADOStp_InPutdetail.ExecProc;
    end;
  except
    ShowMessage(ErrorHint);
    exit;
  end;
  Result:=true;
end;

//更新铭牌
function TFram_NamePlate.UpdateNameplate(): Boolean;
var I,J,K:integer;
begin
  with ADOStp_update do
  begin
    Close;
    //ProcedureName:='UpdateApplyNameplate';
   // Parameters.Clear;
    Parameters.ParamByName('@applyid').Value:=ApplyId;
    Parameters.ParamByName('@ApprovBy').Value:=ApprovBy.Text;
    Parameters.ParamByName('@Huming').Value:=trim(huming.Text);
    Parameters.ParamByName('@Executor').Value:=trim(Executor.Text);
    Parameters.ParamByName('@ApprovDate').Value:=ApprovDate.Text;          
    Parameters.ParamByName('@ExecuteDate').Value:=trim(ExecuteDate.Text);
    Parameters.ParamByName('@Dispatcher').Value:=trim(Dispatcher.Text);
    ExecProc;
  end;
  with ADOStp_updatedetail do
  begin
    for J:=1 to 4 do
    begin
     // if not CheckNameplate(J) then  exit;
        for K:=1 to 6 do
          for I:=0 to self.ComponentCount-1 do
          if (self.Components[I] is TEdit) and (self.Components[I].Tag=((j*10)+k))then
               Parameters[k+1].Value:=trim(Tedit(self.Components[I]).Text);
        parameters.ParamByName('@NamePlateID').Value:=strtoint(NameIdList.Strings[j-1]);
        ExecProc;
    end;
  end;
end;

procedure TFram_NamePlate.Approv;
begin
  approvby.Text:=LoginUser;
  approvdate.Text:=Datetostr(Gettime);
end;

end.
