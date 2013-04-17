unit Contract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,pubvar,   ExtCtrls,  Buttons, Mask, RzEdit, RzPanel,
  RzButton, RzRadChk, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxCheckBox;

type
  TFrm_Contract = class(TForm)
    cb_sgdw: TComboBox;
    Et_jhkgrq: TEdit;
    Et_jhjgrq: TEdit;
    Button1: TButton;
    Button2: TButton;
    edt_htje: TEdit;
    edt_jlf: TEdit;
    RzGroupBox1: TRzGroupBox;
    Label10: TLabel;
    delaystart: TRzDateTimeEdit;
    Label11: TLabel;
    delayend: TRzDateTimeEdit;
    RzCheckBox1: TRzCheckBox;
    edt_prepayment: TEdit;
    RzGroupBox3: TRzGroupBox;
    Label2: TLabel;
    Jldw: TComboBox;
    Label8: TLabel;
    jlf: TEdit;
    RzGroupBox4: TRzGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    chdw: TComboBox;
    chf: TEdit;
    printdate: TRzDateTimeEdit;
    RzGroupBox2: TRzGroupBox;
    Label9: TLabel;
    Label3: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    lbljffzr: TLabel;
    cbb_jffzr: TComboBox;
    btn_setparam: TRzButton;
    Label1: TLabel;
    jlhtbh: TEdit;
    Label4: TLabel;
    chhtbh: TEdit;
    Label5: TLabel;
    sghtbh: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RzCheckBox1Click(Sender: TObject);
    procedure btn_setparamClick(Sender: TObject);


  private
    procedure FillInJffzr();
    procedure FillCompanyName();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Contract: TFrm_Contract;

implementation

uses dm,Jffzr;

{$R *.dfm}

procedure TFrm_Contract.FillCompanyName;
var csql :string;
    I:Integer;
begin
    csql := 'select * from corp where Type=''测绘'''  ;
    chdw.Items.Clear;
    QryWork(Dm_Epm.adoqry_pub,csql);
    for I :=0  to Dm_Epm.adoqry_pub.Recordcount-1  do
    begin
      chdw.Items.Add(trim(Dm_Epm.adoqry_pub.fieldbyname('Name').asstring));
      Dm_Epm.adoqry_pub.Next;
    end;
    csql := 'select * from corp where Type=''监理'''  ;
    jldw.Items.Clear;
    QryWork(Dm_Epm.adoqry_pub,csql);
    for I :=0  to Dm_Epm.adoqry_pub.Recordcount-1  do
    begin
      Jldw.Items.Add(trim(Dm_Epm.adoqry_pub.fieldbyname('Name').asstring));
      Dm_Epm.adoqry_pub.Next;
    end;
end;

procedure TFrm_Contract.FillInJffzr;
var csql :string;
    I:Integer;
begin
    csql := 'select * from JfFzr';
    cbb_jffzr.Items.Clear;
    QryWork(Dm_Epm.adoqry_pub,csql);
    for I :=0  to Dm_Epm.adoqry_pub.Recordcount-1  do
    begin
      cbb_jffzr.Items.Add(trim(Dm_Epm.adoqry_pub.fieldbyname('Name').asstring));
      Dm_Epm.adoqry_pub.Next;
    end;
end;


procedure TFrm_Contract.FormCreate(Sender: TObject);
begin
    cb_sgdw.Text:= dm_epm.adoqry_plan.fieldbyname('sgdw').AsString;
    cbb_jffzr.Text := dm_epm.adoqry_plan.fieldbyname('Jffzr').AsString;
    FillInJffzr;

  //  cb_sgtype.Text:=dm_epm.adoqry_plan.fieldbyname('sglb').AsString;
    Et_jhkgrq.Text:=dm_epm.adoqry_plan.fieldbyname('jhkgrq').AsString;
    Et_jhjgrq.Text:=dm_epm.adoqry_plan.fieldbyname('jhjgrq').AsString;
    edt_htje.Text:= dm_epm.adoqry_plan.fieldbyname('htje').AsString;
    edt_jlf.Text:=  dm_epm.adoqry_plan.fieldbyname('jlf').AsString;
    if dm_epm.adoqry_plan.fieldbyname('printdate').AsString<>'' then
       printdate.Date :=  dm_epm.adoqry_plan.fieldbyname('printdate').AsDateTime
       else   printdate.Date := Date;
    edt_prepayment.Text :=   dm_epm.adoqry_plan.fieldbyname('prepayment').AsString;
    jlf.Text:= dm_epm.adoqry_plan.fieldbyname('jlfee').AsString;
    chf.Text :=   dm_epm.adoqry_plan.fieldbyname('chf').AsString;
    jldw.Text :=  dm_epm.adoqry_plan.fieldbyname('jldw').AsString;
    chdw.Text := Dm_Epm.adoqry_plan.fieldbyname('chdw').AsString ;
    FillCompanyName;
    if jldw.Text='' then
     jldw.ItemIndex := 0;
     if chdw.Text='' then
     chdw.ItemIndex := 0;
//    //if dm_epm.adoqry_plan.fieldbyname('chf').AsString<>'' then
//     chdw.ItemIndex := 0;
       
    if (dm_epm.adoqry_plan.fieldbyname('delaystart').AsString='') then
    begin
      RzCheckBox1.Checked := false;
      RzGroupBox1.Visible := false;
      RzCheckBox1.Enabled := true;
    end else
    begin
       RzCheckBox1.Checked := true;
       delaystart.Text:=dm_epm.adoqry_plan.fieldbyname('delaystart').AsString;
       delayend.Text:=dm_epm.adoqry_plan.fieldbyname('delayend').AsString;
        RzGroupBox1.Visible := true;
        RzCheckBox1.Enabled := false;
    end; 
    if edt_jlf.Text =''  then    edt_jlf.Text := '0';
    sghtbh.Text := dm_epm.adoqry_plan.fieldbyname('sghtbh').AsString;
    jlhtbh.Text := dm_epm.adoqry_plan.fieldbyname('jlhtbh').AsString;
    chhtbh.Text := dm_epm.adoqry_plan.fieldbyname('chhtbh').AsString;

end;

procedure TFrm_Contract.btn_setparamClick(Sender: TObject);
begin
  application.CreateForm(Tfrm_jffzr,frm_jffzr);
  try
    if frm_jffzr.showmodal=mrok then
    begin
      FillInJffzr;
    end;
  finally
      frm_jffzr.Free;
  end;
end;

procedure TFrm_Contract.Button1Click(Sender: TObject);
begin
  if trim(edt_htje.Text)='' then
  begin
    showmessage('请输入合同金额');
    edt_htje.SetFocus;
    edt_htje.SelectAll;
    exit;
  end;
end;



procedure TFrm_Contract.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13)  then
   SelectNext(ActiveControl,True,True);
end;



procedure TFrm_Contract.RzCheckBox1Click(Sender: TObject);
begin
    RzGroupBox1.Visible := RzCheckBox1.Checked;
    if RzCheckBox1.Checked then
    begin
      delaystart.Text:=   dm_epm.adoqry_plan.fieldbyname('jhjgrq').AsString;
      delayend.Text:=    datetostr(Incmonth(dm_epm.adoqry_plan.fieldbyname('jhjgrq').AsDateTime,3));
    end;
end;

end.
