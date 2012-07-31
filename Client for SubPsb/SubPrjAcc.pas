unit subPrjAcc;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, cxMaskEdit, cxControls, cxContainer, cxEdit,StrUtils,
  cxTextEdit, cxDropDownEdit, ExtCtrls, Buttons, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  Tfram_subprjacc = class(TFrame)
    lbl_prifix: TLabel;
    cxPopupEdit1: TcxPopupEdit;
    lbl_dash: TLabel;
    RadioGroup1: TRadioGroup;
    cxMaskEdit1: TcxMaskEdit;
    Label1: TLabel;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioGroup2: TRadioGroup;
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    prjacc:string;
    procedure Init(parentprjAcc:String) ;
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure Tfram_subprjacc.RadioGroup1Click(Sender: TObject);
begin
 lbl_dash.Visible := RadioGroup1.ItemIndex=1;
 cxMaskEdit1.Visible:= RadioGroup1.ItemIndex=1;
 cxPopupEdit1.Visible := RadioGroup1.ItemIndex=0;
 if cxPopupEdit1.Visible then
    cxPopupEdit1.Properties.PopupControl :=Panel1;
end;

procedure Tfram_subprjacc.BitBtn3Click(Sender: TObject);
    var selectedItem: string;
        Itemlength :Integer;
begin
  if RadioGroup2.ItemIndex>-1 then
  begin
   selectedItem := RadioGroup2.Items[RadioGroup2.itemIndex];
   Itemlength :=   Length(selectedItem) ;
   selectedItem := Copy(selectedItem,Pos('-',selectedItem)+1,Itemlength-Pos('-',selectedItem)+1);
   cxPopupEdit1.Text := selectedItem;
   cxPopupEdit1.DroppedDown := False;
  end;
end;

procedure Tfram_subprjacc.BitBtn4Click(Sender: TObject);
begin
  cxPopupEdit1.DroppedDown := False;
end;

procedure Tfram_subprjacc.Init(parentprjAcc: String);
begin
  lbl_prifix.Caption:= parentprjAcc;
end;

procedure Tfram_subprjacc.BitBtn1Click(Sender: TObject);
begin
  prjacc := lbl_prifix.Caption;
  if lbl_dash.Visible then
  begin
    if cxMaskEdit1.Text='' then
    begin
      showmessage('请输入子工程编号');
      exit;
    end;
    prjacc:= prjacc+lbl_dash.Caption+cxMaskEdit1.Text;
  end;
  if cxPopupEdit1.Visible  then
  begin
   if cxPopupEdit1.Text='' then
   begin
      showmessage('请输入专业类别');
      exit;
   end;
   prjacc:= prjacc + '-'+cxPopupEdit1.Text;

  end;
end;

end.
