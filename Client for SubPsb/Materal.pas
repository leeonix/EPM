unit Materal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, DBCtrls, Grids, DBGrids,dm,pubvar, DB, ADODB,
  StdCtrls,ComObj,  Menus, Buttons, DBClient, Provider, word2000;
type
  TFram_Mat = class(TFrame)
    Panel2: TPanel;
    ADOQry_prjmat: TADOQuery;
    ds_mat: TDataSource;
    StaticText1: TStaticText;
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Bom1: TMenuItem;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ADOqry_material: TADOQuery;
    ADOQry_prjmatPRJCODE: TStringField;
    ADOQry_prjmatMATID: TIntegerField;
    ADOQry_prjmatNUM: TBCDField;
    ADOQry_prjmatNOTE: TStringField;
    ADOQry_prjmatitemNO: TSmallintField;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    ADOQry_prjmatid: TAutoIncField;
    ClientDataSet1PRJCODE: TStringField;
    ClientDataSet1MATID: TIntegerField;
    ClientDataSet1NUM: TBCDField;
    ClientDataSet1NOTE: TStringField;
    ClientDataSet1itemNO: TSmallintField;
    ClientDataSet1name: TStringField;
    ClientDataSet1spec: TStringField;
    ClientDataSet1unit: TStringField;
    ClientDataSet1sncode: TStringField;
    ClientDataSet1id: TAutoIncField;
    DBGrid1: TDBGrid;
    //frxDBDataset1: TfrxDBDataset;
   // frRpt_Mat: TfrxReport;
    procedure ADOQry_prjmatBeforePost(DataSet: TDataSet);
    procedure ADOQry_prjmatPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Bom1Click(Sender: TObject);
    procedure frRpt_MatGetValue(const ParName: String;
      var ParValue: Variant);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ClientDataSet1BeforePost(DataSet: TDataSet);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DataSetProvider1BeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
  private
    // Appword:TWordApplication;
    { Private declarations }
  public
    imode:integer;   //0 修改；1 浏览；
    prjid:string;
    Record1,Record2:TstringList;
    procedure Init(const Prjcode:string);
    function AddMat():Boolean;
    function ModeMat():Boolean;
    function DelMat():Boolean;
    Procedure Print();
    procedure PrinttoWord();
    procedure Move(const OldRecNo,NewRecNo:Integer);

    { Public declarations }
  end;

implementation

uses tasktree, Prj_Design;    //MatInput

{$R *.dfm}

{ TFram_mat }
procedure TFram_Mat.Init(const Prjcode: string);
begin
  prjid:=prjcode;
  with ADOQry_Prjmat do
  begin
    active:=false;
    parameters.Items[0].Value:=prjcode;
    active:=true;
  end;
  clientdataset1.Data:=DataSetProvider1.Data;
  Record1:=Tstringlist.Create;
  Record2:=Tstringlist.Create;
  //clientdataset1.AddIndex('Indextype','mattype',[ixCaseInsensitive],'','',0);
  //clientdataset1.IndexName:='Indextype';

end;

procedure TFram_Mat.ADOQry_prjmatBeforePost(DataSet: TDataSet);
begin
  dataset.FieldByName('prjcode').AsString:=prjid;
end;

function TFram_Mat.AddMat: Boolean;
begin
//   application.CreateForm(Tfrm_selectMat,frm_selectMat);
//   frm_selectMat.InputMode:=NewMOde;
//   frm_SelectMat.TargetDataset := ClientDataSet1;
//   try
//     frm_selectMat.ShowModal;
//   finally
//     frm_selectMat.Free;
//   end;
end;

function TFram_Mat.DelMat: Boolean;
begin
  if not ClientDataSet1.IsEmpty   then
  begin
     ClientDataSet1.Delete;
  end;
end;

function TFram_Mat.ModeMat: Boolean;
begin
//  if adoqry_Prjmat.CanModify then
//  begin
//   application.CreateForm(Tfrm_selectMat,frm_selectMat);
//   frm_selectMat.InputMode:=EditMode;
//   frm_selectMat.TargetDataset := ClientDataSet1;
//   frm_selectMat.MatId:=adoqry_Prjmat.fieldbyname('Matid').AsInteger ;
//   try
//     frm_selectMat.ShowModal;
//   finally
//     frm_selectMat.Free;
//   end;
//  end;
end;

procedure TFram_Mat.Print;
begin
// if  frRpt_Mat.LoadFromFile(extractfilepath(paramstr(0))+'\reports\Bom.frf')then
// begin
//     frRpt_Mat.ShowReport ;
//     //frRpt_Mat;
// end;
end;

procedure TFram_Mat.ADOQry_prjmatPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
    showmessage('已经录入了该材料');
    Action:=daAbort ;
    Dataset.Cancel;
end;

procedure TFram_Mat.DBGrid1ColExit(Sender: TObject);
begin
//  if (ADOQry_prjmat.State=dsEdit) and ((dbgrid1.SelectedIndex=4)  or (dbgrid1.SelectedIndex=5)) then
  // ADOQry_prjmat.Post;
end;

procedure TFram_Mat.N1Click(Sender: TObject);
begin
  self.AddMat;
end;

procedure TFram_Mat.N2Click(Sender: TObject);
begin
  self.DelMat;
end;

procedure TFram_Mat.N3Click(Sender: TObject);
begin
  if not  adoqry_prjmat.IsEmpty then   self.ModeMat;
end;

procedure TFram_Mat.Bom1Click(Sender: TObject);
begin
  //self.Print;
  self.PrinttoWord;
end;

procedure TFram_Mat.frRpt_MatGetValue(const ParName: String;
  var ParValue: Variant);
begin
     if ParName='Prjname' then
     ParValue := Frm_PrjDesign.Fram_prjbase.stxt_prjname.Caption;
     if ParName='Prjaccount' then
     ParValue := Frm_PrjDesign.Fram_prjbase.stxt_prjacc.Caption;
     if ParName = 'Designby' then
     ParValue := Frm_PrjDesign.Fram_prjbase.stxt_designby.Caption;
end;

procedure TFram_Mat.DBGrid1DblClick(Sender: TObject);
begin
   self.ModeMat;
end;

procedure TFram_Mat.SpeedButton1Click(Sender: TObject);
begin
   if ClientDataSet1.RecNo>1 then
    Move(ClientDataSet1.RecNo,ClientDataSet1.RecNo-1);
end;

procedure TFram_Mat.BitBtn1Click(Sender: TObject);
procedure SavetoInterMat(prjacc:string);
var csql,matcode:string;
    quantity:string;
begin
  matcode:= ClientDataSet1.Fields[1].Value;
  quantity := ClientDataSet1.fieldbyname('Num').AsString;
  csql:= 'Insert into Inter_mat values('''+prjacc+''','''+matcode+''','''+quantity+''',''1'',''0'')' ;
  QryWork(Dm_Epm.adoqry_pub,csql,false);
end;
begin
  with ClientDataSet1 do
  begin
     if not IsEmpty then
     begin
       First;
       Disablecontrols;
       while not eof do
       begin
         Edit;
         Fields[0].Value:= RecNO;
         Post;
//        //Save To SavetoInterMat(Frm_PrjDesign.Fram_prjbase.stxt_prjacc.Caption);
         Next;
       end;
       Enablecontrols;
     end;
    ApplyUpdates(0);
  end;

end;

procedure TFram_Mat.ClientDataSet1BeforePost(DataSet: TDataSet);
begin
   DataSet.FieldByName('prjcode').AsString:=prjid;
  // Dataset.FieldByName('itemNo').AsInteger:= Dataset.RecNo;
end;


//便于用户录入材料时调整顺序。
procedure TFram_Mat.Move(const OldRecNo, NewRecNo: Integer);
var
  i:integer;
begin
   with ClientDataSet1 do
   begin
     disablecontrols;
     try
       Record1.Clear ;
       MoveBy(OldRecNo-RecNo );
       for i:=5 to FieldCount-3 do
       begin
         Record1.Add(Fields[i].AsString);
       end;
       MoveBy(NewRecNo-OldRecNo);
       Edit;
       Record2.Clear ;
       for i:=5 to FieldCount-3 do
       begin
         Record2.Add(Fields[i].AsString);
         //if Record1.Strings[i-5]='' then
           //Continue;
         fields[i].Value := Record1.Strings[i-5];
       end;
       Post;

       MoveBy(OldRecNo-NewRecNo);
       Edit;
       for i:=5 to FieldCount-3 do
       begin
       // if Record2.Strings[i-5]='' then
       // Continue;
         fields[i].Value := Record2.Strings[i-5];

       end;  //Fields[i].Value:=Record2.Strings[i];

       Post;
       MoveBy(NewRecNo-OldRecNo);
     finally
       enablecontrols;
     end;
   end;
end;

procedure TFram_Mat.SpeedButton2Click(Sender: TObject);
begin
  if ClientDataSet1.RecNo<ClientDataSet1.RecordCount then
    Move(ClientDataSet1.RecNo,ClientDataSet1.RecNo+1);
end;

procedure TFram_Mat.DataSetProvider1BeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
 // applied:=true;
end;

procedure TFram_Mat.PrinttoWord;
var WordApp,v1,v2,v3,v4: olevariant;
    I,Reccount:Integer;
begin
    try
      WordApp:=createoleobject('word.application');
    except
      messagedlg('word 没有正确安装!',mterror,[mbok],0);
      exit;
    end;
    screen.Cursor := crHourGlass;
    v1:= extractfilepath(paramstr(0))+'\reports\设计书封面闵行.dot';
    WordApp.documents.add(v1,false,false,true);
    WordApp.ActiveDocument.Tables.Item(1).Cell(5, 1).Range.Text := '工程名称:'
                          +Frm_PrjDesign.Fram_prjbase.stxt_prjname.Caption;
    WordApp.ActiveDocument.Tables.Item(1).Cell(4, 2).Range.Text := '工程帐号:'
                          +Frm_PrjDesign.Fram_prjbase.stxt_prjacc.Caption;
    with ClientDataSet1 do
    begin
       first;
       Reccount := 48;

       while not eof do
       begin
        if RecNo <=42 then
        begin
         WordApp.ActiveDocument.Tables.Item(1).Cell(RecNo+6, 1).Range.Text := fieldbyname('name').AsString
            +fieldbyname('spec').AsString;
         WordApp.ActiveDocument.Tables.Item(1).Cell(RecNo+6, 2).Range.Text := fieldbyname('sncode').AsString;
         WordApp.ActiveDocument.Tables.Item(1).Cell(RecNo+6, 3).Range.Text := fieldbyname('num').AsString;
         WordApp.ActiveDocument.Tables.Item(1).Cell(RecNo+6, 4).Range.Text := fieldbyname('unit').AsString;
        end else
        begin
            WordApp.ActiveDocument.Tables.Item(1).Cell(RecNo+6-42, 5).Range.Text:= fieldbyname('name').AsString
               +fieldbyname('spec').AsString;
            WordApp.ActiveDocument.Tables.Item(1).Cell(RecNo+6-42, 6).Range.Text:= fieldbyname('sncode').AsString;
            WordApp.ActiveDocument.Tables.Item(1).Cell(RecNo+6-42, 7).Range.Text:= fieldbyname('num').AsString;
            WordApp.ActiveDocument.Tables.Item(1).Cell(RecNo+6-42, 8).Range.Text:= fieldbyname('unit').AsString;

         end;
         Next;

       end;

    end;
    WordApp.visible:=true;
    screen.Cursor :=crDefault;
end;

end.
