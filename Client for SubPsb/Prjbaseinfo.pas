unit prjbaseinfo;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, ExtCtrls,dm,pubvar, ComCtrls, framdgwt;
type
  TFrambaseinfo = class(TFrame)
    btnok: TButton;
    btncancel: TButton;
    procedure btnokClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
  private
    { Private declarations }
  public
     inputmode:integer;
     procedure Initfram(const TaskNode, Executor,RecordID:string);
    { Public declarations }
  end;

implementation

{$R *.DFM}

{ TFrambaseinfo }

procedure TFrambaseinfo.Initfram(const TaskNode, Executor,
  RecordID: string);
var csql:string;
begin
  csql:='select * from PROJECTINFO where PRJCODE='''+RecordID+'''';
  Loaddata(dm_epm.adoqry_pub,csql,self);
  if Executor=loginuser then
  begin
  //
  end;
end;

procedure TFrambaseinfo.btnokClick(Sender: TObject);
begin
  // need to process the new project to send to executor;
end;

procedure TFrambaseinfo.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
   //allowchange:=false;
end;

end.

