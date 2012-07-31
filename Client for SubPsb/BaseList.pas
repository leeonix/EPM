unit BaseList;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, treelist;

type
  TFram_List = class(TFrame)
    procedure Tlt_BaseHeaderClick(Sender: TObject; SectionIdx: Integer);
  private
    { Private declarations }

  public
        { Public declarations }
    Procedure  AddLsvColumn (ColCap:TStringlist;ALength: array of Integer;imgindex:integer=-1);
    //procedure

  end;

implementation

{$R *.dfm}
{增加LIst的列}
Procedure Tfram_List.AddLsvColumn(ColCap: TStringlist;ALength: array of Integer;
  imgindex: integer);
var I:Integer;
    ColItem:TcollectionItem;
begin
   for I := 0 to ColCap.Count-1  do
   begin
     ColItem := Tlt_Base.Columns.Add;
     TColumnItem(ColItem).Header := ColCap.Strings[I];
     TColumnItem(ColItem).Width:= ALength[I] ;
     TColumnItem(ColItem).HeaderAlign := taCenter;
   end;

end;
{单击列标题排序}
procedure Tfram_List.Tlt_BaseHeaderClick(Sender: TObject;
  SectionIdx: Integer);
begin
//
end;

end.
