unit FlowBase;

interface

uses
  Classes,Windows,SysUtils,Controls,AddFlow4Lib_TLB,Udm;


type

  PFlow=^Flow;
  Flow=record
       Flowcode:  string;
       FlowName:  string;
       Creator:   string;
       Chartfile: string;
  end;

  PNode=^Node;
  Node=record
       Nodecode:   string;
       NodeName:   string;
  end;
  TRole =class(TObject)
  private
    FRoleCode:string;
    FRoleName:string;
    procedure SetRoleCode(const value:string);
    procedure SetRoleName(const Value:string);
  public
    property  Rolecode:string Read FRoleCode write SetRoleCode;
    property  RoleName:string Read FRoleName Write SetRoleName;
    constructor Create;

  end;

  TPrjFlow=class(TObject)
  private
    Fflowcode:string;
    FflowName:string;
    Fcreator: string;
    Fchart: Taddflow;
  public
    //function Getchart(Chartcode:string):TaddFlow;
    //procedure Setchart(value:Taddflow);

    property FlowName:string Read Fflowname Write Fflowname;
    property FlowChart:Taddflow Read Fchart Write Fchart;

  end;

  TFlowNode =Class(TObject)
  private
    FNodecode:String;
    FNodename:string;
    Fexecutor:Trole;
    FSetdate:smallint;
    FParentCode:string;
    FEvaFlag:Boolean;
    FNodetip:string;
    FNodeSpc:string;
  Public


  end;



implementation

{ TRole }



constructor TRole.Create();
begin
  inherited;

end;

procedure TRole.SetRoleCode(const value: string);
begin
 if FRoleCode<>value then
 FRoleCode := Value;
end;

procedure TRole.SetRoleName(const Value: string);
begin
 if FRoleName<>value then
    FRoleName := Value;

end;

end.
