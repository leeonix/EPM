//****************************************************************************
//        Engineering Project Management Infomation System
//                 For Minhang Power Supply Bureau
//
//       This unit including the documnets management belong to the project,specilly
//        provide users view and mod the documents rapidlly 
//                 Author: Tuzz    2001/10
//    Copyright (c) 2001-? Shanghai Dawning Software Corporation
//****************************************************************************
unit Engdoc ;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Menus, StdCtrls, DB, ADODB,dm,pubvar, Grids, DBGrids,
  DBCtrls, Buttons, ActnList, OleCtrls,FmxUtils, DBClient,
  Provider, DBTables;

type
  TFram_Dwg = class(TFrame)
    Query1: TQuery;
    Database1: TDatabase;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Panel2: TPanel;
    StaticText1: TStaticText;
  private

    { Private declarations }
  public
    prjid:string;
    procedure Init(const Prjcode:string);
    function  Importdoc(const prjacc,prjcode:string):boolean;
    function  AddCadFile():Boolean;    // ¡¨Ω”CADÕºµµ
    function  DelCadFile():Boolean;    // …æ≥˝Õºµµ
    function  ModCadFile():Boolean;    //–ﬁ∏ƒÕºµµ
    function  ViewCadFile():Boolean;   //‰Ø¿¿Õº÷Ω
 
    { Public declarations }
  end;

implementation

uses tasktree,newdoc, MAIN, Prj_Design;

{$R *.dfm}

{ TFram_DWG }





procedure TFram_Dwg.Init(const Prjcode:string);
var
    csql:string;
begin
  prjid:=prjcode;
  with dm_epm.adoqry_doc do
  begin
    Csql:='select * from DOCINFO where SSXMDM='''+prjcode+''''
          +' and doctype in (''…Ëº∆Õº÷Ω'',''CADÕº÷Ω'')';
    Qrywork(dm_epm.ADOQry_doc,csql);
    Dm_epm.ADOQry_doc.First;
  end;
  QUERY1.Active:=FALSE;
end;

function TFram_Dwg.Importdoc(const prjacc, prjcode: string): boolean;
begin
  if not Database1.Connected then Database1.Connected := true;
  with query1 do
  begin
     ParamByName('prjacc').Value := prjacc;
     Active := true;
     if isempty then
     begin
       Result := false;
       Exit;
     end else
       while not eof do
       begin
         Dm_epm.ADOQry_doc.Append;
         Dm_epm.ADOQry_doc.FieldByName('doctype').AsString :=
                  FieldByName('doctype').AsString;
         Dm_epm.ADOQry_doc.FieldByName('filename').AsString :=
                  FieldByName('filename').AsString;
         Dm_epm.ADOQry_doc.FieldByName('docname').AsString :=
                  FieldByName('docname').AsString;
         Dm_epm.ADOQry_doc.FieldByName('createdate').AsString :=
                  FieldByName('creatdate').AsString;
         Dm_epm.ADOQry_doc.FieldByName('layout').AsString :=
                  FieldByName('layout').AsString;
         Dm_epm.ADOQry_doc.FieldByName('scale').AsString :=
                  FieldByName('scale').AsString;
         Dm_epm.ADOQry_doc.FieldByName('version').AsString :=
                  FieldByName('author').AsString;
         Dm_epm.ADOQry_doc.FieldByName('version').AsString :=
                  FieldByName('version').AsString;
         Dm_epm.ADOQry_doc.FieldByName('ssxmdm').AsString := prjid;
         Dm_epm.ADOQry_doc.Post;
         Next;
       end;
       Result := true;
       Database1.Connected := False;
  end;
end;

function TFram_Dwg.AddCadFile: Boolean;     
begin
   Result:=False;
   if Dm_Epm.Lindoc(prjid,'') then
    Result:=True;
end;

function TFram_Dwg.DelCadFile: Boolean;
begin
  Result:=False;
  if MessageBox(self.Handle,DelConfirm,'Easy Project'
                                ,MB_YESNO+MB_ICONWARNING)=IdYes then
   if not dm_epm.ADOQry_doc.IsEmpty then
   begin
      try
        deletefile(dm_epm.ADOQry_doc.fieldbyname('FileName').AsString);
        dm_epm.ADOQry_doc.Delete;
        Result:=True;
      except
         showmessage(ErrorHint);
      end;
   end;
end;

function TFram_Dwg.ModCadFile: Boolean;
begin
   if not Dm_Epm.AdoQry_doc.IsEmpty then
   begin
     application.CreateForm(Tfrm_Newdoc,Frm_NewDoc);
     try
       Dm_epm.AdoQry_doc.Edit;
       if Frm_Newdoc.ShowModal=mrok then
          Dm_Epm.AdoQry_doc.Post
       else Dm_Epm.ADOQry_doc.Cancel;
     finally
       Frm_Newdoc.Free;
     end;
   end;
end;

function TFram_Dwg.ViewCadFile: Boolean;
begin
//  Result:=False;
//  try
//   Previewdoc(dm_epm.ADOQry_doc.fieldbyname('filename').AsString);
//  except
//    ShowMessage(ErrorHint);
//    Exit;
//  end;
//  Result:=True;
end;

end.
