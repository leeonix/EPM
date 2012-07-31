unit ComUnit;

interface

Uses
  Messages, Grids, BaseGrid, AdvGrid, DB, ADODB, Classes, SysUtils;


Const
  //ģ���л�
  SM_MODULESWITCH = WM_USER + 100;
  //���ͼ�¼������������
  SM_EDITRECORD = WM_USER + 110;
  //��������
  SM_OPTFILTER = WM_USER + 120;
  //ת�ع���
  SM_LOADACTFILTER = WM_USER + 130;


type

  TDataState = ( dsEmpty   ,    //������״̬��
                 dsLink    ,    //��������״̬
                 dsNew     ,    //Ʊ���½�״̬
                 dsModify  ,    //Ʊ���ڱ༭״̬
                 dsDelete  ,    //��¼ɾ��
                 dsCancel  ,   //ȡ������
                 dsSave    ,    //�����¼              //
                 dsOpen
                           );

  TDataStates = set of TDataState;

  TModuleName = (mnBase,
                 mnCorp,        //��˾ģ��
                 mnUser,        //�û�����
                 mnJobRole     //Ȩ�޹���
                 );

  procedure ShowData(Grid:TAdvStringGrid; DataSource:TADOQuery);
  Procedure DeleteRow(Grid:TAdvStringGrid; Col:Integer; Value:string);
  procedure BreakText(Source:String; List:TStrings; Compart:String = ' ');

Var
  GUserID:String;
  GIsSuperAdm:Boolean;
  
implementation

Procedure DeleteRow(Grid:TAdvStringGrid; Col:Integer; Value:String);
var
  RRow:Integer;
Begin
  RRow := Grid.Cols[Col].IndexOf(Value);
  if RRow < 1 then Exit;
  if Grid.RowCount > 2 then
    Grid.RemoveRows(RRow,1)
  else Grid.ClearNormalCells;
end;

procedure ShowData(Grid:TAdvStringGrid; DataSource:TADOQuery);
Var
  Row,Col:Integer;
begin
	Grid.ClearNormalCells;
  if DataSource.IsEmpty then
    Grid.RowCount := 2
  else
  Begin
    Grid.RowCount := DataSource.RecordCount +1;
    for Row := 1 to Grid.RowCount -1 do
    Begin
      for Col := 1 to Grid.ColCount -1 do
        Grid.Cells[Col,Row] := Trim(DataSource.Fields[Col-1].AsString);
      DataSource.Next;
    end;
    Grid.AutoNumberCol(0);
  end;
end;

procedure BreakText(Source:String; List:TStrings; Compart:String);
Var
  tmp:String;
  ComPos:Integer;
Begin
  Source := Trim(Source);
  while Source <> '' do
  Begin
    tmp := Source;
    ComPos := Pos(Compart,tmp);
    if ComPos > 0 then
    Begin
      Delete(Tmp,ComPos,Length(Tmp));
      Delete(Source,1,ComPos);
      Source := Trim(Source);
    end
    else Source := '';
    List.Add(Tmp);
  end;
end;

end.
