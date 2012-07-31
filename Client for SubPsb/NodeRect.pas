unit NodeRect;

interface

Uses
  Classes, TaskNodeInfo, Graphics, Windows;

type
	TDragBox = (dbNone,dbDrag,dbTopLeft,dbTopMid,dbTopRight,dbMidLeft,dbMidRight,dbBottomLeft,dbBottomMid,dbBottomRight,dbLink);

	//TOnPaintEvent = procedure (Sender: TObject; Canvas: TCanvas; Rect: TRect) of object;

  TRectBox = class(TObject)
  private
    FHasFocus: Boolean;
    FWidth: Integer;
    FHeight: Integer;
    FTop: Integer;
    FLeft: Integer;
    FCaption: String;
    FContent: TStrings;
    FTaskInfo: TTaskNodeinfo;
    FFrameColor:TColor;
    FCanvas :TCanvas;
    procedure SetContent(const Value: TStrings);
    procedure SetHasFocus(const Value: Boolean);
    procedure SetHeight(const Value: Integer);
    procedure SetLeft(const Value: Integer);
    procedure SetTop(const Value: Integer);
    procedure SetWidth(const Value: Integer);
    procedure SetTaskInfo(const Value: TTaskNodeinfo);
    procedure SetFrameColor(const Value: TColor);
    procedure DrawContent;
  protected
    Procedure Paint;
  public
    constructor Create(ACanvas:TCanvas);
    destructor Destroy; override;
    //Procedure Paint(Canvas:TCanvas);
  published
    Property FrameColor:TColor Read FFrameColor Write SetFrameColor Default clBlack;
    Property Caption :String Read FCaption Write FCaption;
    Property Content :TStrings Read FContent Write SetContent;
    Property Left:Integer Read FLeft Write SetLeft;
    Property Top:Integer read FTop Write SetTop;
    Property Height:Integer Read FHeight Write SetHeight;
    Property Width:Integer Read FWidth Write SetWidth;
    Property HasFocus:Boolean Read FHasFocus Write SetHasFocus;
    Property TaskInfo:TTaskNodeinfo Read FTaskInfo Write SetTaskInfo;
    Property Canvas:TCanvas Read FCanvas;
  end;

implementation

{ TRectBox }

constructor TRectBox.Create(ACanvas:TCanvas);
begin
  inherited Create;
  FContent := TStringList.Create;
  FTaskInfo := TTaskNodeinfo.Create;
  FCanvas := ACanvas;
end;

destructor TRectBox.Destroy;
begin
  FContent.Free;
  FTaskInfo.Free;
  inherited Destroy;
end;

procedure TRectBox.Paint;
Const BOXSIZE = 5;
var
	LHalfBox: Integer;
	LRect: TRect;
	LClient: TRect;
begin
	LRect := Rect(Left,Top,Width+Left,Top+Height);
	LHalfBox := (BOXSIZE div 2);

	//Calculate Client area that does not intercept the drag boxes;
	LRect.Left := LRect.Left + LHalfBox + 1;
	LRect.Right := LRect.Right - LHalfBox - 1;
	LRect.Top := LRect.Top - LHalfBox;
	LRect.Bottom := LRect.Bottom - LHalfBox - 1;

	//client Area as defined by the frame drawn
  {
	LClient.Left := LHalfBox;
	LClient.Top := LHalfBox;
	LClient.right := width-1 - LHalfBox;
	LClient.Bottom :=	Height - 1 - LHalfBox;
   }
  LClient := LRect;
	//draw the frame
  Canvas.Brush.Color := clWhite;
  Canvas.FillRect(LClient);
  Canvas.Pen.Color := FFrameColor;
  Canvas.MoveTo(LClient.Left,LClient.Top);
  Canvas.LineTo(LClient.Right,LClient.Top);
  Canvas.LineTo(LClient.Right,LClient.Bottom);
  Canvas.LineTo(LClient.Left,LClient.Bottom);
  Canvas.LineTo(LClient.Left,LClient.Top);
  {
	//Draw the drag boxes
  if HasFocus then
  Begin
    Canvas.Brush.Color := clBlack;
    Canvas.FillRect(rect(0,0,FBoxSize,FBoxSize));
    Canvas.FillRect(rect((width div 2) - LHalfBox,0,(width div 2) - LHalfBox + FBoxSize,FBoxSize));
    Canvas.FillRect(rect(width - FBoxSize,0,width,FBoxSize));
    Canvas.FillRect(rect(width - FBoxSize,Height div 2 - LHalfBox,width,Height div 2 - LHalfBox + FBoxSize));
    Canvas.FillRect(rect(width - FBoxSize,Height - FBoxSize,width,Height));
    Canvas.FillRect(rect((width div 2) - LHalfBox,Height - FBoxSize,(width div 2) - LHalfBox + FBoxSize,Height));
    Canvas.FillRect(rect(0,Height - FBoxSize,FBoxSize,Height));
    Canvas.FillRect(rect(0,Height div 2 - LHalfBox,FBoxSize,Height div 2 - LHalfBox + FBoxSize));
  end;

	//Set the fixed font for the optional position information
	if FShowPos and FHasFocus then
    Canvas.Brush.style := bsClear;

  //Draw caption content and des content

  DrawContent;
  }
end;

Procedure TRectBox.DrawContent;
Const
  VSPACE = 5 ;
  HSPACE = 5;
Var
  UHAuto:Integer;
  I:Integer;
  Str:Pchar;
  StrCount:Integer;
  OutRect:TRect;
  VerticallySpace :Integer;
  SavePenWidth:Integer;
begin
  {
  if FHasFocus then
    Canvas.Brush.Color :=  FActiveFrameColor
  else
    Canvas.Brush.Color := FPassiveFrameColor;
  Canvas.Pen.Color := FTextColor;
  VerticallySpace := VSPACE + Canvas.Pen.Width;
  SavePenWidth := Canvas.Pen.Width;
  UHAuto := VerticallySpace;

  OutRect:= Rect(HSPACE,UHAuto,Width-HSPACE,Height-VerticallySpace);
  UHAuto := UHAuto +VerticallySpace+ DrawText(Canvas.Handle,Pchar(FCaption),Length(FCaption),OutRect,
      DT_CENTER or DT_WORDBREAK );
  if UHAuto > (Height - VerticallySpace) then Exit;
  Canvas.Pen.Width := 1;
  Canvas.MoveTo(0,UHAuto);
  Canvas.LineTo(Width,UHAuto);
  Inc(UHAuto,VSPACE+1);
  Canvas.Pen.Width := SavePenWidth;

  StrCount := FContent.Count -1;
  I := 0;
  while (UHAuto < (Height - VerticallySpace)) and (I <= StrCount) do
  begin
    Str := Pchar(FContent.Strings[I]);
    if Str = ContentCompartSymbol then
    Begin
      Inc(UHAuto,3);
      Canvas.Pen.Width := 1;
      Canvas.MoveTo(0,UHAuto);
      Canvas.LineTo(Width,UHAuto);
      Inc(UHAuto,VSPACE+1);
      Canvas.Pen.Width := SavePenWidth;
    end
    else
    Begin
      OutRect:= Rect(HSPACE,UHAuto,Width-HSPACE,Height-VerticallySpace);
      UHAuto := UHAuto +DrawText(Canvas.Handle,Str,Length(Str),OutRect, DT_WORDBREAK );
    end;
    Inc(I);
  end;
  }
end;


procedure TRectBox.SetContent(const Value: TStrings);
begin
  FContent.Assign(Value);
end;

procedure TRectBox.SetFrameColor(const Value: TColor);
begin
  FFrameColor := Value;
end;

procedure TRectBox.SetHasFocus(const Value: Boolean);
begin
  if FHasFocus = Value then Exit;
  FHasFocus := Value;
end;

procedure TRectBox.SetHeight(const Value: Integer);
begin
  if FHeight = Value then Exit;
  FHeight := Value;
end;

procedure TRectBox.SetLeft(const Value: Integer);
begin
  if FLeft = Value then Exit;
  FLeft := Value;
end;


procedure TRectBox.SetTaskInfo(const Value: TTaskNodeinfo);
begin
  FTaskInfo.Assign(Value);
  Caption := Value.Title;
  Content.Text := Value.Describe;
end;

procedure TRectBox.SetWidth(const Value: Integer);
begin
  if FWidth = Value then Exit;
  FWidth := Value;
end;

procedure TRectBox.SetTop(const Value: Integer);
begin
  if FTop = Value then Exit;
  FTop := Value;
end;

end.
