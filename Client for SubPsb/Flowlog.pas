unit Flowlog;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls,dm,pubvar,treefram;

type
  TFram_log = class(TFrame)
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Panel2: TPanel;
    StaticText1: TStaticText;
    Lsv_log: TListView;
  private
    { Private declarations }
  public
     procedure Init(const prjcode:string);
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFram_log }

procedure TFram_log.Init(const prjcode: string);
var csql,ctemp:string;
    loglist:Tstringlist;
    I:integer;
begin
   if copy(prjcode,1,1)='P' then
   begin
     csql:='select SOUCECODE from projectinfo where prjcode= '''+prjcode+'''';
     qrywork(dm_epm.adoqry_pub,csql);
     CTEMP:= dm_epm.adoqry_pub.fieldbyname('soucecode').AsString;
     csql:='select * from flowhistory where czxmdm in ('''+prjcode+''','''+ctemp+''') order by actiontime';
   end else
   csql:='select * from flowhistory where czxmdm='''+prjcode+''' order by actiontime';
   qrywork(dm_epm.adoqry_pub,csql);
   with  dm_epm.adoqry_pub do
   begin
     first;
     loglist:=Tstringlist.Create;
     try
        while not eof do
        begin
          loglist.Clear;
          loglist.Add(fieldbyname('actiontime').AsString);
          loglist.Add(fieldbyname('actby').AsString);
          loglist.Add(fieldbyname('maction').AsString);
          loglist.Add(fieldbyname('tosombody').AsString);
          AddItems(lsv_log,loglist);
          next;
        end;
     finally
       loglist.Free;
     end;
   end;
   for I:=0 to Lsv_log.Columns.Count-1 do
    Lsv_log.Columns[I].Width:=ColumnTextWidth;
end;

end.
