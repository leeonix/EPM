unit FrmPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ComCtrls,dm,pubvar, RzBorder, RzDTP, RzEdit;



type

  TFrm_Plan = class(TForm)
    Button1: TButton;
    Button2: TButton;
    cb_sgdw: TComboBox;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    RzBorder1: TRzBorder;
    RzBorder2: TRzBorder;
    Label6: TLabel;
    Label4: TLabel;
    jhkgrq: TRzDateTimeEdit;
    sgkgrq: TRzDateTimeEdit;
    jhjgrq: TRzDateTimeEdit;
    sgjgrq: TRzDateTimeEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cb_sgdwChange(Sender: TObject);
  private
    FrefcodeList:TstringList;
    { Private declarations }
  public
    Sncode:string;
    showmod:integer;
    procedure show(const mode:integer);
    { Public declarations }
  end;

var
  Frm_Plan: TFrm_Plan;

implementation



{$R *.dfm}

procedure TFrm_Plan.show(const mode: integer);
var NO:integer;
begin
  showmod:=mode;
  if mode=newmode then
  begin
   // cb_sgtype.Text:='';
    //jhkgrq.Date:= Date;
    //jhjgrq.Date:=IncMonth(Date,6);
    sgkgrq.Enabled:=false;
    sgjgrq.Enabled:=false;
  end else
  if mode=1 then
  begin
    cb_sgdw.Text:=dm_epm.adoqry_plan.fieldbyname('sgdw').AsString;
    NO := cb_sgdw.Items.IndexOf(trim(dm_epm.adoqry_plan.fieldbyname('sgdw').AsString));
    cb_sgdw.ItemIndex := No;
    //cb_sgtype.Text:=dm_epm.adoqry_plan.fieldbyname('sglb').AsString;
     if (dm_epm.adoqry_plan.fieldbyname('jhkgrq').AsString <> '')
        and  (dm_epm.adoqry_plan.fieldbyname('jhjgrq').AsString<>'' )   then
        begin
           jhkgrq.Date:=dm_epm.adoqry_plan.fieldbyname('jhkgrq').AsDateTime;
           jhjgrq.Date:=dm_epm.adoqry_plan.fieldbyname('jhjgrq').AsDateTime;
        end else
        begin
          // jhkgrq.Date:= Date;
          // jhjgrq.Date:=IncMonth(Date,6);
        end;
    if (dm_epm.adoqry_plan.fieldbyname('sgkgrq').AsString <> '')
        and  (dm_epm.adoqry_plan.fieldbyname('sgjgrq').AsString<>'' )
    then
    begin
      sgkgrq.Date:=dm_epm.adoqry_plan.fieldbyname('sgkgrq').AsDateTime;
      sgjgrq.Date:=dm_epm.adoqry_plan.fieldbyname('sgjgrq').AsDateTime;
    end;
  end;
end;

procedure TFrm_Plan.FormCreate(Sender: TObject);
var csql:string;
    I:Integer;
begin
    FrefcodeList:= Tstringlist.Create;
    cb_sgdw.Items.Clear;
    csql := 'select name,sncode from corp where AuxFlag=''10'' or AuxFlag= '''+CurCorpCode+'''';
    QryWork(Dm_Epm.adoqry_pub,csql);
    for I :=0  to Dm_Epm.adoqry_pub.Recordcount-1  do
    begin
      cb_sgdw.Items.Add(trim(Dm_Epm.adoqry_pub.fieldbyname('name').asstring));
      FrefcodeList.Add(trim(Dm_Epm.adoqry_pub.fieldbyname('sncode').asstring));
      Dm_Epm.adoqry_pub.Next;
    end;
end;

procedure TFrm_Plan.FormDestroy(Sender: TObject);
begin
 FrefcodeList.Free;
end;

procedure TFrm_Plan.cb_sgdwChange(Sender: TObject);
begin
  Sncode :=  FrefcodeList.Strings[cb_sgdw.ItemIndex] ;

end;

end.
