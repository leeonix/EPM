unit MyReport;
 {***************************************************************************
 项目名称:  供配电工程信息管理系统
 单元说明:    数据输出报表，
 描    述:   输出为excel ,word
 日    期:   2002-12-12
 作    者:   程哨兵
 版本         2.0
 Copyright (c) 2001-? Shanghai Dawning Software Corporation
******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes,variants, Graphics, Controls, Forms,
  ActiveX,Dialogs,db,comobj,word2000;

type
  Treporttype=(rtreport,rtcard);
  tpercentcompleteevent=procedure(sender:Tobject;percentcomplete:integer;
                           var continueprocess:boolean) of object;
  TMyReport = class(TComponent)
  private
    { Private declarations }
    FReportTitle:string;
    Frow,Fcol:integer;             // iis control progarme 
    Ftemplatefilename,Fprefixchar:string;
    Ftemplatepath:string;
    Freporttype:Treporttype;
    Fpercentcomplete:Tpercentcompleteevent;
    Fdataset:Tdataset;
  protected
    { Protected declarations }
    procedure dopercentcomplete(percentcomplete:integer;var continueprocess:boolean);virtual;
    procedure notification(Acomponent:Tcomponent;operation:Toperation);override;
    procedure setdim(Index:integer;value:integer);

  public
    { Public declarations }
    Appword:TWordApplication;
    procedure execute(const reptype:string;ReStrings:TstringList);


    constructor create(AOwner:Tcomponent);override;
  published
    { Published declarations }
    property Reporttitle:string read Freporttitle write Freporttitle;
    property row:integer index 0 read Frow write Setdim default 1;
    property Col:integer index 1 read Fcol write setdim default 1;
    property templatefilename:string read FTemplatefilename write Ftemplatefilename;
    property templatepath:string read Ftemplatepath write Ftemplatepath;
    property prefixchar:string read fprefixchar write fprefixchar;
    property reporttype:Treporttype read freporttype write freporttype;
    property onpercentcomplete:Tpercentcompleteevent read Fpercentcomplete write Fpercentcomplete;
    property dataset:Tdataset read Fdataset write Fdataset;
  end;

procedure Register;

implementation
 var app:olevariant;

constructor TMyReport.create(AOwner:Tcomponent);
begin
  inherited create(Aowner);
  reporttitle:='上海晨辉科技Excel输出';
  row:=1;
  col:=1;
  Fdataset:=nil;
  ftemplatepath:='';
  Fprefixchar:='@';
end;//create

procedure TMyReport.setdim(index:integer;value:integer);
begin
  case index of
    0: if value<>Frow then 
       begin
         if value<1 then exit;
         Frow:=value;
       end;
    1: if value<>Fcol then
       begin
         if value<1 then exit;
         Fcol:=value;
       end;
   end;//end case
end;//setdim for col&row
procedure TMyReport.notification(Acomponent:Tcomponent;operation:Toperation);
begin
if (operation=opremove)and(Acomponent=Fdataset)
then Fdataset:=nil;
end;//notification
procedure TMyReport.dopercentcomplete(percentcomplete:integer;var continueprocess:boolean);
begin
if assigned (Fpercentcomplete)then
  Fpercentcomplete(self,Percentcomplete,Continueprocess);
end;

procedure TMyReport.execute(const reptype:string; ReStrings:TstringList);
var FieldCount,RecordCount,i,j,p,rr:integer;
    cont:boolean;
    syspath:string;
    v1,v2,v3,v4,v5,v6:olevariant;
begin
  syspath:=extractfilepath(application.exename)+'reports\';
  if Freporttype=Rtreport then
  begin
    if not dataset.active then
    begin
      messagedlg('数据集尚未打开',mterror,[mbok],0);
      exit;
    end;
    try
      app:=createoleobject('excel.application');
    except
      messagedlg('Excel 没有正确安装!',mterror,[mbok],0);
      exit;
    end;
    screen.Cursor := crHourGlass;
    if templatefilename='' then
      app.workbooks.add
    else
      app.workbooks.open(syspath+Ftemplatepath+Templatefilename+'.xlt');
    app.visible:=true;
    dataset.disablecontrols;
    dataset.first;
    FieldCount:=dataset.fieldcount;
    RecordCount:=dataset.recordcount;
    rr:=row;
    if reptype='per' then
    begin
      FieldCount:=FieldCount-1;
      app.cells(1,26):=dataset.FieldByName('designby').asstring;
    end;
    if reptype='facility'  then
    begin
      FieldCount:=FieldCount-2;
      app.cells(2,2):= ReStrings.Strings[0];
    end;
    if reptype='jsmonth' then
    begin
       app.cells(1,1) :=  ReStrings.Strings[0];
       app.cells(2,11) := ReStrings.Strings[1];
    end;

     if reptype='htreport' then
    begin
       app.cells(1,1) :=  ReStrings.Strings[0];
       app.cells(2,12) := ReStrings.Strings[1];
    end;
    if reptype='jymonth' then
    begin
       app.cells(1,1) :=  ReStrings.Strings[0];
       app.cells(2,9) := ReStrings.Strings[1];
    end;


  //输出报表抬头
    {

    }
    for j:=1 to Recordcount do
    begin
      for i:=0 to FieldCount-1 do
      begin
       app.cells(rr+3,col+i):=dataset.fields[i].asstring;
       if not (reptype='facility') then
       app.cells(rr+3,1):=j;
      end;
      p:=trunc((j/RecordCount)*100);
      cont:=true;
      dopercentcomplete(p,cont);
      if not cont then
      begin
        app.activeworkbook.close(false);
        app.quit;
        app:=unassigned;
        dataset.enablecontrols;
        exit;
      end;
      dataset.next;
      inc(rr);
    end;
    screen.Cursor := crDefault;
   // app.visible:=true;
    dataset.enablecontrols;
  end  else
  begin
    try
      //app:=createoleobject('word.application');
      Appword:=TWordApplication.Create(nil);
      Appword.Connect;
    except
      messagedlg('word没有正确安装!',mterror,[mbok],0);
      exit;
    end;
    screen.Cursor := crHourGlass;

    if templatefilename='' then
    begin
      Appword.ActiveDocument.Close(v1,v2,v3);
      Appword.Quit;
      exit;
    end  else
    begin
     V1:=syspath+Ftemplatepath+Templatefilename+'.dot';
     V2:=False;
     V4:=true;;
     Appword.documents.add(v1,v2,v3,v4);
    end;
    for i:=0 to ReStrings.Count-1 do
    begin
      V1:=wdLine;
      V2:=wdMove;
      Appword.selection.homekey(V1,V2);
      Appword.selection.find.ClearFormatting;
      v1:=Fprefixchar+inttostr(i+1);
      V2:=false;
      v3:=true;
      V4:=wdReplaceAll;
      v5:=ReStrings.Strings[I];
      v6:=wdFindContinue;
      if length(ReStrings.Strings[I])<250 then
      Appword.selection.find.execute(v1,v2,v3,v2,
                       v2,v2,v3,v6,V4,v5,v3,v2,v2,v2,v2);
      p:=trunc(((i+1)/ReStrings.count)*100);
      cont:=true;
      dopercentcomplete(p,cont);
      if not cont then
      begin
        V1:=False;
        Appword.activedocument.close(v1,v1,v1);
        Appword.quit;
        exit;
      end;
    end;
    v1:=false;
    V2:='hello' ;
  //  Appword.ActiveDocument.Protect(2,v1,v2);
    Appword.visible:=true;
    //Appword.ShowMe;
    screen.Cursor := crDefault;
  end;
end;
procedure Register;
begin
  RegisterComponents('mycomponent', [TMyReport]);
end;
initialization

  app:=unassigned;
finalization

  app:=unassigned;
end.
