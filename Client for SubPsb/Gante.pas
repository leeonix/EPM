unit gante;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, TeeProcs, TeEngine, Chart, Series, GanttCh, OleCtrls,
  AgentObjects_TLB,dm,pubvar;

type
  TFramgangte = class(TFrame)
    procedure Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure Agent1BalloonShow(Sender: TObject;
      const CharacterID: WideString);
    procedure Agent1DblClick(Sender: TObject;
      const CharacterID: WideString; Button, Shift, x, y: Smallint);
  private
    { Private declarations }
  public
    procedure initial();
    { Public declarations }
  end;

implementation

{$R *.DFM}

{ TFramgangte }


procedure TFramgangte.Chart1ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var tmpTask:Longint;
begin
  tmpTask:=gantte.Clicked(x,y);  { <-- if mouse is over a gantt bar... }
  if tmpTask<>-1 then
  begin { set a sample label and a sample shape color }
    panel1.Caption:=gantte.XLabel[tmptask]+': '
                    +'开始日期: '+DateToStr(gantte.XValues[tmpTask]);
    panel1.Caption:=panel1.Caption+',  完成日期：'
                    +DateToStr(gantte.EndValues[tmpTask]);
    Agent1.Characters.Item['merlin'].Play('Congratulate');
    Agent1.Characters.Item['merlin'].SoundEffectsOn:=true;
    Agent1.Characters.Item['merlin'].Speak(panel1.Caption,'');

  end  else
  begin  { clear label and shape samples }
    panel1.Caption:='请点击甘特图条，查看节点执行情况';
    //Agent1.Characters.Item['merlin'].Hide(fast);
  end;
end;

procedure TFramgangte.Agent1BalloonShow(Sender: TObject;
  const CharacterID: WideString);
var state:olevariant;
begin
  Agent1.Characters.Item['merlin'].Activate(state)
end;

procedure TFramgangte.Agent1DblClick(Sender: TObject;
  const CharacterID: WideString; Button, Shift, x, y: Smallint);
begin
  Agent1.Characters.Item['merlin'].SoundEffectsOn;
  Agent1.ShowDefaultCharacterProperties;
end;

end.


