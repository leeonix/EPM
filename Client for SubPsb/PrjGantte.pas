unit PrjGantte;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DB, ADODB, TeEngine, Series, GanttCh, TeeProcs, Chart,dm,pubvar;

type
  TFram_gante = class(TFrame)
    chart1: TChart;
    gantte: TGanttSeries;
    ADOQry_node: TADOQuery;
    ADOQry_nodeXMDM: TStringField;
    ADOQry_nodeNODECODE: TStringField;
    ADOQry_nodeNODENAME: TStringField;
    ADOQry_nodeEXECUTOR: TStringField;
    ADOQry_nodeNODESTART: TDateTimeField;
    ADOQry_nodeNODEEND: TDateTimeField;
    ADOQry_nodeACTIVEFLAG: TStringField;
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Panel2: TPanel;
    StaticText1: TStaticText;
    Panel4: TPanel;
    procedure chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure chart1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GenerateGantte(const prjcode:string);
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFram_gante }

procedure TFram_gante.GenerateGantte(const prjcode: string);
var i:integer;
    fast:olevariant;
    Csql,ctemp:string;          //&H0804;
begin
  if copy(Prjcode,1,1)='P' then
  begin
    csql:='select SOUCECODE from projectinfo where prjcode= '''+Prjcode+'''';
    qrywork(dm_epm.adoqry_pub,csql);
    CTEMP:= dm_epm.adoqry_pub.fieldbyname('soucecode').AsString;
    csql:='select * from flownodeinfo where XMDM='''+Prjcode+''''
      +' or XMDM='''+CTEMP+''' order by nodestart';
  end else
  csql:='select * from flownodeinfo where XMDM='''+Prjcode+''' order by nodestart';
  qrywork(ADOQry_node,csql);
   I:=0;
   gantte.Clear;
   with ADOQry_node do
   begin
     first;
     while not eof do
     begin
      if not fieldbyname('NODEEND').IsNull then
      gantte.AddGantt(fieldbyname('NODESTART').AsDateTime,fieldbyname('NODEEND').AsDateTime,
         I,fieldbyname('NODENAME').AsString)
      else
      gantte.AddGantt(fieldbyname('NODESTART').AsDateTime,gettime,
         I,fieldbyname('NODENAME').AsString);
      Next;
      inc(I);
     end;
   for i:=0 to gantte.Count-1 do
   begin
     gantte.NextTask[i]:=i+1;
   end;
   gantte.ConnectingPen.Width:=1;
   gantte.ConnectingPen.Color:=clBlue;
 { increase bar heights }
   gantte.Pointer.VertSize:=5;
 { remove legend }
 { arrange bottom axis to show exact datetime labels }
   gantte.GetHorizAxis.ExactDateTime:=True;
   gantte.GetHorizAxis.Increment:=DateTimeStep[dttwoDays];
 end ;
end;

procedure TFram_gante.chart1ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var tmpTask:Longint;
begin
  tmpTask:=gantte.Clicked(x,y);  { <-- if mouse is over a gantt bar... }
  if tmpTask<>-1 then
  begin { set a sample label and a sample shape color }
    panel4.Caption:=gantte.XLabel[tmptask]+': '
                    +'开始日期: '+DateToStr(gantte.XValues[tmpTask]);
    panel4.Caption:=panel4.Caption+',  完成日期：'
                    +DateToStr(gantte.EndValues[tmpTask]);
    //Agent1.Characters.Item['merlin'].Play('Congratulate');
    //Agent1.Characters.Item['merlin'].SoundEffectsOn:=true;
    //Agent1.Characters.Item['merlin'].Speak(panel3.Caption,'');

  end  else
  begin  { clear label and shape samples }
    panel4.Caption:='请点击甘特图条，查看节点执行情况';
    //Agent1.Characters.Item['merlin'].Hide(fast);
  end;
end;

procedure TFram_gante.chart1DblClick(Sender: TObject);
begin
   chart1.ZoomPercent(0.1);
end;

end.
