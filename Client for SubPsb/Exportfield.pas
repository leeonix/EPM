unit exportfield;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,dm,pubvar, ExtCtrls, CheckLst;

type
  Tfrm_export = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    CheckListBox1: TCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
     DisplayList,fieldlist:Tstringlist;

    { Public declarations }
  end;

var
  frm_export: Tfrm_export;

implementation

{$R *.dfm}

procedure Tfrm_export.FormCreate(Sender: TObject);
var I:integer;
begin
   for I:=0 to  dm_epm.adoqry_export.FieldList.Count-1 do
     CheckListBox1.Items.Add(dm_epm.adoqry_export.FieldList[I].DisplayName);
   fieldlist:=Tstringlist.Create;
   DisplayList:=Tstringlist.create;
end;

procedure Tfrm_export.FormDestroy(Sender: TObject);
begin
  fieldlist.Free;
  DisplayList.free;
end;

procedure Tfrm_export.BitBtn1Click(Sender: TObject);
var I:integer;
begin
  for I:= 0 to checklistbox1.Count-1 do
  if checklistbox1.Checked[I] then
  begin
      fieldlist.Add(dm_epm.adoqry_export.FieldList[I].FieldName);
      DisplayList.Add(checklistbox1.Items[I]);

  end; 
end;

end.
