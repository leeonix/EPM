unit Prjbase;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,dm,
  StdCtrls, ExtCtrls,pubvar;

type
  TFram_prjbase = class(TFrame)
    stxt_prjname: TStaticText;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    Label8: TLabel;
    stxt_prjacc: TStaticText;
    stxt_prjtype: TStaticText;
    stxt_currentnode: TStaticText;
    Label9: TLabel;
    Stxt_executor: TStaticText;
    Label2: TLabel;
    stxt_designby: TStaticText;
  private
    { Private declarations }
  public
    procedure showfram(const prjcode:string);
    { Public declarations }
  end;

implementation

uses MAIN;

{$R *.dfm}

{ TFram_prjbase }

procedure TFram_prjbase.showfram(const prjcode:string);
var Csql:string;
begin

   csql:='select PRJNAME,PRJACCOUNT,DESIGNBY,NODENAME,EXECUtOR,TYPENAME from projectinfo a inner join flownodeinfo b on '
         +'a.prjcode=b.xmdm inner join projecttype c on c.PRJTYPECODE=a.prjtype'
         +' left join designinfo d on a.prjcode=d.prjcode '
         +' where a.prjcode='''+prjcode+''' and activeflag=''1''';
   qrywork(dm_epm.adoqry_pub,Csql);
   if  dm_epm.adoqry_pub.IsEmpty then
   begin
     csql:='select PRJNAME,PRJACCOUNT,DESIGNBY,TYPENAME from projectinfo a inner join projecttype c on c.PRJTYPECODE=a.prjtype'
           +' left join designinfo d on a.prjcode=d.prjcode '
           +' where a.prjcode='''+prjcode+'''';
     qrywork(dm_epm.adoqry_pub,Csql);
     stxt_currentnode.Caption:='�ѹ鵵';
     Stxt_executor.Caption:=''
   end else
   begin
      stxt_currentnode.Caption:=dm_epm.adoqry_pub.fieldByname('NodeName').asstring;
      Stxt_executor.Caption:=dm_epm.adoqry_pub.fieldByname('Executor').asstring;
   end;
   stxt_prjname.Caption:=dm_epm.adoqry_pub.fieldByname('prjname').asstring;
   stxt_prjacc.Caption:=dm_epm.adoqry_pub.fieldByname('prjaccount').asstring;
   stxt_prjtype.Caption:=dm_epm.adoqry_pub.fieldByname('typename').asstring;
   stxt_designby.Caption:= dm_epm.adoqry_pub.fieldByname('designby').asstring;
end;

end.
