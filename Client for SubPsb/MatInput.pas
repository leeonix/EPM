unit MatInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,dm, ADODB, DB, DBClient, Grids, DBGrids, Buttons,ComCtrls,
  pubvar,Prj_Design, ExtCtrls,FmxUtils; // AdvTreeComboBox,



type
  Tfrm_SelectMat = class(TForm)
    Label1: TLabel;
    adoqry_matcode: TADOQuery;
    DBGrid1: TDBGrid;
    btn_append: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Adoqry_type: TADOQuery;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    name: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    spec: TEdit;
    Label6: TLabel;
    sncode: TEdit;
    adoqry_matcodeMATID: TAutoIncField;
    adoqry_matcodeNAME: TStringField;
    adoqry_matcodeLCODE: TStringField;
    adoqry_matcodeSNCODE: TStringField;
    adoqry_matcodeUNIT: TStringField;
    adoqry_matcodeSPEC: TStringField;
    adoqry_matcodePRICE1: TBCDField;
    adoqry_matcodeDrawNo: TStringField;
    adoqry_matcodeDgsj: TStringField;
    adoqry_matcodeGdjl: TStringField;
    adoqry_matcodeAzWzGj: TStringField;
    adoqry_matcodeBz: TStringField;
    drawno: TEdit;
    Label7: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure fcTreeCombo1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_appendClick(Sender: TObject);
    procedure nameChange(Sender: TObject);
  private
    { Private declarations }
     FstrFilter:string;
     ctreecodeformat:string;
  public
     InputMode:Integer;
     MatId:Integer;
     TargetDataset:Tclientdataset;
     DbTabletag:integer;
     function GetNodeLevel(sFormat, sCode: string): integer;
     procedure Loadtree(DB:Tdataset);
     function AppendtoPrj():Boolean;

    { Public declarations }
  end;

var
  frm_SelectMat: Tfrm_SelectMat;

implementation


{$R *.dfm}

function TFrm_selectmat.GetNodeLevel(sFormat, sCode: string): integer;
var i,level,ilen:integer;
begin
  level:=-1;
  ilen:=0;
  if (Sformat<>'') and (scode<>'') then
  for I:=1 to Length(sFormat) do
  begin
    iLen:=ilen+strtoInt(sformat[i]);
    if length(scode)=iLen then
    begin
      level:= I;
      break;
    end;
  end;
  result:=Level;

end;

procedure TFrm_selectmat.Loadtree(DB:Tdataset);
var Curid,NodeText,CtreeRoot:string;
    level:integer;
    Mynode:array[0..4] of Ttreenode;
begin
  screen.Cursor:= crHourGlass;
 // Trcb_Type.Items.Clear;
 // ctreecodeformat:='22222';
  CtreeRoot:='ËùÓÐ²ÄÁÏ';
  level:=0;
 // Mynode[level] := Trcb_Type.Items.Add(nil,CtreeRoot) ;
  Mynode[level].ImageIndex := 1;
  with Db do
  begin
    if not active then open;
    first;
    while not eof do
    begin
      curId := trim(fieldbyname('Lcode').asstring);
      NodeText := curId+'-'+trim(fieldbyname('name').asstring);
      level := GetNodelevel(ctreecodeformat,curid);
      if level>0 then
      begin
      //  Mynode[level]:=Trcb_Type.Items.AddChild(Mynode[level-1],NodeText);
        //Mynode[level].ImageIndex:=2;
       // MyNode[Level].StringData:=CurId;
      end;
      next;
    end;
    Mynode[0].Expand(false);
    close;
    Screen.Cursor:= crDefault;
  end;
end;


procedure Tfrm_SelectMat.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  self.SelectNext(activecontrol,true,true);
end;

procedure Tfrm_SelectMat.Button2Click(Sender: TObject);
begin
  ExecuteFile(ExtractFilePath(Application.ExeName)+'Mat_maintance.exe','','',SW_SHOW);
end;

procedure Tfrm_SelectMat.fcTreeCombo1Change(Sender: TObject);
begin
  //
end;

procedure Tfrm_SelectMat.BitBtn1Click(Sender: TObject);
begin
  if adoqry_matcode.IsEmpty then exit;
  if InputMode=NewMode then AppendtoPrj;
  close;
end;

function Tfrm_SelectMat.AppendtoPrj(): Boolean;
begin
  Result:=false;
  with TargetDataset do
  begin
    Append;
    FieldByname('Matid').AsString:=adoqry_matcode.fieldbyname('matid').AsString;
    FieldByname('Num').AsInteger:=1;
    if DbTabletag=1 then
    FieldByName('price').AsString := adoqry_matcode.fieldByName('price1').AsString;
    try
      post;
    except
      cancel;
      exit;
    end
  end;
  Result:=true;
end;

procedure Tfrm_SelectMat.FormShow(Sender: TObject);
begin
   Adoqry_type.SQL.Clear;
   adoqry_matcode.SQL.Clear;
  if DbTabletag=1 then
  begin
     Adoqry_type.SQL.Add('select * from mattype_Ky');
     FstrFilter:='select * from material_Ky where 1=1' ;
     adoqry_matcode.SQL.Add(FstrFilter);
     ctreecodeformat := '12222';
  end else
  begin
     Adoqry_type.SQL.Add('select * from mattype');
     FstrFilter:='select * from material where 1=1' ;
     adoqry_matcode.SQL.Add(FstrFilter);
     ctreecodeformat := '22222';
  end;
  LoadTree(Adoqry_type);
  btn_append.Enabled:= InputMode=NewMode;
  BitBtn1.Enabled:= InputMode=EditMode;
  adoqry_matcode.Open;
  if InputMode=EditMode then
  begin
     adoqry_matcode.Open;
     adoqry_matcode.Locate('matid',MatId,[loCaseInsensitive]);
  end;
end;

procedure Tfrm_SelectMat.btn_appendClick(Sender: TObject);
begin
   if adoqry_matcode.IsEmpty then exit;
   AppendtoPrj;
end;

procedure Tfrm_SelectMat.nameChange(Sender: TObject);
   var strFilter,curcode:string;
begin
    strFilter:=FstrFilter;
    if trim(sncode.Text)<>'' then strFilter:= strFilter+' and sncode like '''+trim(sncode.Text)+'%'+'''';

    if trim(spec.Text)<>'' then
      strFilter:= strFilter+' and spec like '''+'%'+trim(spec.Text)+'%'+'''';

    if trim(name.Text)<>'' then

      strFilter:= strFilter+' and name like '''+'%'+trim(name.Text)+'%'+'''' ;
   // if Trcb_Type.Treeview.Selected<>nil  then
  //  begin
      // curcode := Copy(Trcb_Type.Treeview.Selected.Text,1,Pos('-',Trcb_Type.Treeview.Selected.Text)-1);
   //    strFilter:= strFilter+' and Lcode like '''+curcode+'%'+'''' ;
  //  end;
    if trim(drawno.Text)<>'' then
      strFilter:= strFilter+' and drawno like '''+trim(drawno.Text)+'%'+'''';
    adoqry_matcode.Close;
    adoqry_matcode.SQL.Clear;
    adoqry_matcode.SQL.Add(strFilter);
    adoqry_matcode.Open;
end;

end.
