unit FrameBaseMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComUnit;

type
  TFrame_BaseMod = class(TFrame)
  private
    FDataState: TDataState;
    procedure SetDataState(const Value: TDataState);

  protected
    Procedure LoadData;  Virtual;
    Procedure FiltrateOperation; Virtual;
  public
    //DataState: TDataState;
    ModName:TModuleName;
    MenuList:TDataStates;
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    Property DataState:TDataState Read FDataState Write SetDataState;
    //destructor Destroy; override;
  end;

implementation

{$R *.dfm}

{ TFrame_BaseMod }

constructor TFrame_BaseMod.Create(AOwner: TComponent);
begin
  inherited;
  DataState := dsEmpty;
  ModName := mnBase;
  MenuList := [dsNew, dsDelete, dsCancel, dsSave, dsOpen];
  LoadData;
  FiltrateOperation;
end;

{
destructor TFrame_BaseMod.Destroy;
begin

  inherited;
end;
 }
procedure TFrame_BaseMod.FiltrateOperation;
begin
  //
end;

procedure TFrame_BaseMod.LoadData;
begin
  //
end;

procedure TFrame_BaseMod.SetDataState(const Value: TDataState);
begin
  if FDataState = Value then Exit;
  FDataState := Value;
  FiltrateOperation;
  SendMessage(TWinControl(Owner).Handle,SM_OPTFILTER,Integer(FDataState),0);
end;

end.
