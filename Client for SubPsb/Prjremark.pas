unit PrjRemark;
{===============================================================================}
{             Engineering Documents Manager beta1.0
              This unit allow user to add remark to the pub bulleting
              And show the flowlog in the history log tabsheet
                   Author by Tuzz   2001.4

            Copyright (C) 2001  ShangHai Dawning Corporation                    }
{===============================================================================}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, ExtCtrls, Db, DBTables,dm,pubvar, Menus;

type
  TFrame_remark = class(TFrame)
    Qry_log: TQuery;
    RE_REMARK: TRichEdit;
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Panel2: TPanel;
    StaticText1: TStaticText;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    PrjId:     string;
    procedure  Init(const Prjcode:string);
    procedure  AddRemark();
  end;

implementation

{$R *.DFM}
procedure TFrame_remark.AddRemark;
var remark,csql:string;
begin
  if InputQuery('¡Ù—‘','«Î ‰»Î¡Ù—‘',remark) then
  begin
   re_REMARK.Lines.Add(remark);
   re_REMARK.Lines.Add('¡Ù—‘’ﬂ: '+Loginuser+'           »’∆⁄'+datetostr(date));
   re_REMARK.Lines.Add('**********************************************************');
   with dm_epm.adoqry_input do
    begin
     if dm_epm.adoqry_pub.isempty then
       csql:='insert REMARKINFO(prjcode,remark) values('''+prjid+''','''+re_remark.Lines.Text+''')'
     else
       csql:='update  REMARKINFO set remark='''+re_remark.Lines.Text+'''  where prjcode='''+prjid+'''';
     active:=false;
     sql.Clear;
     sql.Add(csql);
     execsql;
     dm_epm.adoqry_pub.close;
     dm_epm.adoqry_pub.sql.Clear;
     dm_epm.adoqry_pub.sql.Add('select REMARK from REMARKINFO where PRJcode='''+prjid+'''');
     dm_epm.adoqry_pub.open;
    end;
 end;
end;

procedure TFrame_remark.Init(const Prjcode:string);
begin
 prjid:=prjcode;
 with dm_epm.adoqry_pub do
 begin
   active:=false;
   sql.Clear;
   sql.Add('select REMARK from REMARKINFO where PRJcode='''+prjcode+'''');
   active:=true;
   if not isempty then
   RE_REMARK.lines.Add(fieldbyname('remark').asstring);
 end;
end;

procedure TFrame_remark.N1Click(Sender: TObject);
begin
   AddRemark;
end;

end.



