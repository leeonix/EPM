unit DelayContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, ADODB,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, StdCtrls, ExtCtrls, RzPanel, MyReport,
  Menus;

type
  Tfrm_DelayContract = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Adoqry_Delaycontractprj: TADOQuery;
    Ds_Delaycontractprj: TDataSource;
    Adoqry_DelaycontractprjXMDM: TStringField;
    Adoqry_DelaycontractprjPRJACCOUNT: TStringField;
    Adoqry_DelaycontractprjPRJNAME: TStringField;
    Adoqry_DelaycontractprjJHJGRQ: TDateTimeField;
    Adoqry_Delaycontractprjoutdate: TIntegerField;
    cxGrid1DBTableView1PRJACCOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1PRJNAME: TcxGridDBColumn;
    cxGrid1DBTableView1JHJGRQ: TcxGridDBColumn;
    cxGrid1DBTableView1outdate: TcxGridDBColumn;
    RzPanel1: TRzPanel;
    Button1: TButton;
    MyReport1: TMyReport;
    Adoqry_DelaycontractprjSgjgrq: TDateTimeField;
    Adoqry_DelaycontractprjSgdw: TStringField;
    Adoqry_DelaycontractprjAddress: TWideStringField;
    cxGrid1DBTableView1Sgjgrq: TcxGridDBColumn;
    cxGrid1DBTableView1Sgdw: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Adoqry_DelaycontractprjDelayStart: TDateTimeField;
    Adoqry_DelaycontractprjDelayEnd: TDateTimeField;
    cxGrid1DBTableView1DelayStart: TcxGridDBColumn;
    cxGrid1DBTableView1DelayEnd: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Printstrings:TStringList;
    procedure PrintDelayContract;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_DelayContract: Tfrm_DelayContract;

implementation
 uses frmDelayDate;
{$R *.dfm}

procedure Tfrm_DelayContract.Button1Click(Sender: TObject);

begin
  PrintDelayContract;
end;

procedure Tfrm_DelayContract.PrintDelayContract;
begin
  application.CreateForm(Tfrm_DateRange,frm_DateRange);
  try
   // frm_DateRange.show();
    frm_DateRange.startdate.Date := Adoqry_Delaycontractprj.fieldbyname('jhjgrq').AsDateTime;
    frm_DateRange.enddate.Date := IncMonth(Adoqry_Delaycontractprj.fieldbyname('jhjgrq').AsDateTime,3);
    if frm_DateRange.showmodal=mrok then
      with Adoqry_Delaycontractprj do
      begin
        edit;
        FieldByName('Delaystart').AsDateTime:=frm_DateRange.startdate.Date;
        FieldByName('Delayend').AsDateTime:=frm_DateRange.enddate.Date;
        PrintStrings.Clear;
        PrintStrings.Add(fieldByName('Sgdw').AsString);

        PrintStrings.Add(fieldByName('Prjaccount').AsString);

       PrintStrings.Add(fieldByName('prjname').AsString);

       PrintStrings.Add(DateTimeToStr(fieldbyname('Delaystart').AsDateTime));
       PrintStrings.Add(DateTimeToStr(fieldbyname('Delayend').AsDateTime));
       PrintStrings.Add(fieldByName('Sgdw').AsString);
       PrintStrings.Add(fieldByName('address').AsString);
       PrintStrings.Add(Datetostr(fieldbyname('Delaystart').AsDateTime));
       Post;
      end;
  finally
    frm_DateRange.free;
  end;
  MyReport1.templatefilename := 'DelayContract';
  MyReport1.execute('', PrintStrings);
end;

procedure Tfrm_DelayContract.FormCreate(Sender: TObject);
begin
  Adoqry_Delaycontractprj.Active := False;
 Adoqry_Delaycontractprj.Open;
 Printstrings := TstringList.Create;
end;

procedure Tfrm_DelayContract.FormDestroy(Sender: TObject);
begin
   Printstrings.Free;
end;

procedure Tfrm_DelayContract.N1Click(Sender: TObject);
begin
  PrintDelayContract;
end;

end.
