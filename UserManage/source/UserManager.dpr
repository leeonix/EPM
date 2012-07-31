program UserManager;

uses
  Windows,
  Forms,
  SysUtils,
  FormMain in 'FormMain.pas' {Form_Main},
  ComUnit in 'ComUnit.pas',
  DataModule in 'DataModule.pas' {DM: TDataModule},
  FrameBaseMod in 'FrameBaseMod.pas' {Frame_BaseMod: TFrame},
  FrameModUser in 'FrameModUser.pas' {Frame_ModUser: TFrame},
  FrameModCorp in 'FrameModCorp.pas' {Frame_ModCorp: TFrame},
  FrameModJobRole in 'FrameModJobRole.pas' {Frame_ModJobRole: TFrame};

{$R *.res}

begin
  Application.Initialize;
  if ParamCount > 0 then
  Begin
    GUserID := ParamStr(1);
    GIsSuperAdm := False;
    Application.CreateForm(TDM, DM);
    if DM.ADOconn.Connected then
    Begin
      DM.QueryWork('Select RolID from dbo.COMPOSE where JobCode = '''+GUserID+''' and RolID in (''9991'',''9992'')');
      if Not DM.DefQuery.IsEmpty then
      Begin
        with DM.DefQuery do
        while Not Eof do
        begin
          GIsSuperAdm := GIsSuperAdm or (Trim(Fields[0].AsString) = '9991');
          Next;
        end;
        Application.CreateForm(TForm_Main, Form_Main);
        Application.Run;
      end
      else MessageBox(0, '你没有权限操作本模块！','提示',MB_OK+MB_ICONINFORMATION);
    end;
  end
  else MessageBox(0, '请提供运行参数！','提示',MB_OK+MB_ICONINFORMATION);
end.
