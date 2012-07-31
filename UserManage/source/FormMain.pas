
unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, RzButton, RzPanel, ExtCtrls, RzGroupBar, ActnList,
  Menus, ComCtrls, ToolWin, ComUnit, FrameBaseMod, RzStatus;

type
  TForm_Main = class(TForm)
    MainMenu1: TMainMenu;
    Men_ModuleSwitch: TMenuItem;
    N3: TMenuItem;
    ActionList1: TActionList;
    Act_New: TAction;
    Act_Open: TAction;
    Act_Modify: TAction;
    Act_Save: TAction;
    Act_ModCorp: TAction;
    Act_ModUser: TAction;
    Act_ModJobRole: TAction;
    Lst_Main: TRzGroupBar;
    RzGroup1: TRzGroup;
    RzStatusBar1: TRzStatusBar;
    ImageList1: TImageList;
    Act_Delete: TAction;
    Act_Cancel: TAction;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    Pan_Dock: TRzPanel;
    RzGlyphStatus1: TRzGlyphStatus;
    RzClockStatus1: TRzClockStatus;
    ToolButton8: TToolButton;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    ActModJobRole1: TMenuItem;
    ActModUser1: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure ShowModule(Sender: TObject);
    procedure EditRecord(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
  private
    { Private declarations }
    Procedure SMMODULESWITCH(Var Msg:TMessage); Message SM_MODULESWITCH;
    Procedure SMOPTFILTER(Var Msg:TMessage); Message SM_OPTFILTER;
    Procedure SMLOADACTFILTER(Var Msg:TMessage); Message SM_LOADACTFILTER;
  public
    { Public declarations }
    MagMod:TFrame_BaseMod;
    //Property MagMod:TFrame_BaseMod Read FManagerModule;
  end;

var
  Form_Main: TForm_Main;

implementation

uses DataModule, FrameModCorp, FrameModJobRole, FrameModUser;

{$R *.dfm}

{ TForm_Main }

procedure TForm_Main.SMLOADACTFILTER(var Msg: TMessage);
begin
  if Not Assigned(MagMod) then Exit;
  Act_New.Enabled := dsNew in MagMod.MenuList;
  Act_Open.Enabled := dsOpen in MagMod.MenuList;
  Act_Modify.Enabled := dsModify in MagMod.MenuList;
  Act_Save.Enabled := dsSave in MagMod.MenuList;
  Act_Delete.Enabled := dsDelete In MagMod.MenuList;
  Act_Cancel.Enabled := dsCancel In MagMod.MenuList;

  Act_New.Visible := Act_New.Enabled;
  Act_Open.Visible := Act_Open.Enabled;
  Act_Modify.Visible := Act_Modify.Enabled;
  Act_Save.Visible := Act_Save.Enabled;
  Act_Delete.Visible := Act_Delete.Enabled;
  Act_Cancel.Visible := Act_Cancel.Enabled;
end;

procedure TForm_Main.SMMODULESWITCH(var Msg: TMessage);
begin
  if Assigned(MagMod) then
  Begin
    if MagMod.ModName = TModuleName(Msg.WParam) then Exit
    else FreeandNil(MagMod)
  end;

  case TModuleName(Msg.WParam) of
    mnCorp    : MagMod := TFrame_BaseMod(TFrame_ModCorp.NewInstance);
    mnUser    : MagMod := TFrame_BaseMod(TFrame_ModUser.NewInstance);
    mnJobRole : MagMod := TFrame_BaseMod(TFrame_ModJobRole.NewInstance);
  else MagMod := TFrame_BaseMod(TFrame_BaseMod.NewInstance);
  end;

  MagMod.Create(Self);
  MagMod.Parent := Pan_Dock;
  MagMod.Align := alClient;
  MagMod.Show;
  SendMessage(Handle,SM_LOADACTFILTER,0,0);
  SendMessage(Handle,SM_OPTFILTER,Integer(MagMod.DataState),0);
end;

procedure TForm_Main.SMOPTFILTER(var Msg: TMessage);
Var
  DS:TDataState;
begin
  DS := TDataState(Msg.WParam);
  Act_New.Enabled := Act_New.Visible;
  Act_Open.Enabled := Act_Open.Visible;
  Act_Modify.Enabled := Act_Modify.Visible and (DS in [dsLink]);
  Act_Save.Enabled := Act_Save.Visible and (DS in [dsNew, dsModify]);
  Act_Delete.Enabled := Act_Delete.Visible and (DS in [dsLink]);
  Act_Cancel.Enabled := Act_Cancel.Visible and (DS in [dsNew, dsModify]);
end;

procedure TForm_Main.FormCreate(Sender: TObject);
begin
  Act_ModCorp.Tag := Integer(mnCorp);
  Act_ModUser.Tag := Integer(mnUser);
  Act_ModJobRole.Tag := Integer(mnJobRole);

  Act_New.Tag := Integer(dsNew);
  Act_Open.Tag := Integer(dsOpen);
  Act_Modify.Tag := Integer(dsModify);
  Act_Save.Tag := Integer(dsSave);
  Act_Delete.Tag := Integer(dsDelete);
  Act_Cancel.Tag := Integer(dsCancel);

  Lst_Main.Visible := GIsSuperAdm;
  Act_ModCorp.Visible := GIsSuperAdm;
  Act_ModUser.Visible := GIsSuperAdm;
  Act_ModJobRole.Visible := GIsSuperAdm;

  Act_ModCorp.Enabled := GIsSuperAdm;
  Act_ModUser.Enabled := GIsSuperAdm;
  Act_ModJobRole.Enabled := GIsSuperAdm;

  Men_ModuleSwitch.Visible := GIsSuperAdm;
  SendMessage(Handle,SM_MODULESWITCH,Integer(mnUser),0);
end;

procedure TForm_Main.ShowModule(Sender: TObject);
Var
  ModType:Integer;
begin
  if Not (Sender is TAction)  then Exit;
  ModType := TAction(Sender).Tag;
  SendMessage(Handle,SM_MODULESWITCH,ModType,0);
end;

procedure TForm_Main.EditRecord(Sender: TObject);
Var
  ModType:Integer;
begin
  if Not (Sender is TAction)  then Exit;
  ModType := TAction(Sender).Tag;
  SendMessage(MagMod.Handle,SM_EDITRECORD,ModType,0);
end;

procedure TForm_Main.N12Click(Sender: TObject);
begin
  Close;
end;

procedure TForm_Main.ToolButton9Click(Sender: TObject);
begin
  Close;
end;

end.
