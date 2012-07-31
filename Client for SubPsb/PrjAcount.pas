unit PrjAcount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, pubvar,
  Dialogs, StdCtrls, ExtCtrls, Lucombo, Mask, Buttons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, subPrjAcc,
  cxSpinEdit, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinsDefaultPainters;

type
  Tfrm_GenPrjacc = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cxPopupEdit1: TcxPopupEdit;
    pnl_yk: TPanel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label3: TLabel;
    cxMaskEdit1: TcxMaskEdit;
    pnl_yg: TPanel;
    RadioGroup3: TRadioGroup;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    pnl_ld: TPanel;
    RadioGroup4: TRadioGroup;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    fram_subprjacc1: Tfram_subprjacc;
    lbl_prifix: TLabel;
    cxComboBox1: TcxComboBox;
    Label2: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure fram_subprjacc1BitBtn1Click(Sender: TObject);
    procedure fram_subprjacc1BitBtn2Click(Sender: TObject);
    procedure cxComboBox1PropertiesChange(Sender: TObject);

  private
    AccessTag:Integer;
    { Private declarations }
  public
     PrjAcount :string;
     procedure Init(AccTag:Integer);
    { Public declarations }
  end;

var
  frm_GenPrjacc: Tfrm_GenPrjacc;

implementation



{$R *.dfm}

procedure Tfrm_GenPrjacc.BitBtn3Click(Sender: TObject);
begin
 if (RadioGroup1.ItemIndex>-1) and (RadioGroup2.ItemIndex>-1) then
 begin
   cxPopupEdit1.Text :='';
   case RadioGroup2.ItemIndex of
     0: cxPopupEdit1.Text := '4000' ;
     1: cxPopupEdit1.Text := '701' ;
   end;
   case RadioGroup1.ItemIndex of
     0: cxPopupEdit1.Text := cxPopupEdit1.Text+'A' ;
     1: cxPopupEdit1.Text := cxPopupEdit1.Text+'B';
     2: cxPopupEdit1.Text := cxPopupEdit1.Text+'C';
   end;
   cxPopupEdit1.DroppedDown:= false;
 end
 else begin
   showmessage('请选择用户类型用电量类型');
   cxPopupEdit1.DroppedDown := True;
 end;
end;

procedure Tfrm_GenPrjacc.BitBtn4Click(Sender: TObject);
begin
   cxPopupEdit1.DroppedDown:= false;
end;

procedure Tfrm_GenPrjacc.BitBtn1Click(Sender: TObject);
begin
   if (length(cxPopupEdit1.Text)<1) or (length(trim(cxMaskEdit1.EditText))<1) then
   begin
     showmessage('请补齐工程帐号信息空缺部分') ;
     cxPopupEdit1.Focused ;
   end else
   begin
     ModalResult := Mrok;

     PrjAcount := lbl_prifix.Caption+cxPopupEdit1.Text+Label3.Caption+cxMaskEdit1.EditText;
   end;

end;

procedure Tfrm_GenPrjacc.BitBtn6Click(Sender: TObject);
begin
  if RadioGroup3.ItemIndex>-1 then
  begin
    case RadioGroup3.ItemIndex  of
      0: cxPopupEdit1.Text:='用改(市南)';
      1: if CurCorpCode='2' then cxPopupEdit1.Text:='用改(闵)'
         else cxPopupEdit1.Text:='用改(青)';
    end;
    cxPopupEdit1.DroppedDown:= false;
  end;
end;

procedure Tfrm_GenPrjacc.Init(AccTag: Integer);
begin
   AccessTag := AccTag;
   case AccTag of
    0 : begin
         if CurCorpCode='2'  then
         lbl_prifix.Caption := '闵业2004-';
         if CurCorpCode='4'  then
         lbl_prifix.Caption := '青业2004-';
         cxPopupEdit1.Properties.PopupControl:= pnl_yk ;
         cxMaskEdit1.Properties.EditMask :='0000;1;_';
         RadioGroup2.ItemIndex := 1 ;
         RadioGroup1.ItemIndex :=0;
         cxComboBox1.ItemIndex :=1;
        end;
    1 : begin
         lbl_prifix.Caption := '04';
         cxPopupEdit1.Properties.PopupControl:= pnl_yg ;
         cxMaskEdit1.Properties.EditMask :='0000;1;_';
         cxComboBox1.ItemIndex :=1;
        end;
    2:  begin
         lbl_prifix.Caption := '';
         if CurCorpCode='2'  then
         cxPopupEdit1.Text:='闵代2004';
         if CurCorpCode='4'  then
         cxPopupEdit1.Text:='青代2004';
         cxMaskEdit1.Properties.EditMask :='000;1;_';
         cxComboBox1.ItemIndex :=1;
        end;
    3: begin
         lbl_prifix.Caption := '';
         cxPopupEdit1.Properties.PopupControl:= pnl_ld ;
         cxMaskEdit1.Properties.EditMask :='000;1;_';
         cxComboBox1.ItemIndex :=1;
       end;
    4: begin
         lbl_prifix.Caption := '';
         if CurCorpCode='2'  then
           cxPopupEdit1.Text := '321P-04'
         else if CurCorpCode='2'  then
           cxPopupEdit1.Text := '324P-04' ;
         cxMaskEdit1.Properties.EditMask :='000;1;_';
         cxComboBox1.ItemIndex :=1;
       end;
    5: begin                                        //
         lbl_prifix.Caption := '';
         cxPopupEdit1.Text := '闵工2004'  ;
          if CurCorpCode='4'  then
         cxPopupEdit1.Text:='青工2004';
         cxMaskEdit1.Properties.EditMask :='800;1;_';
         cxComboBox1.ItemIndex :=1;
       end;
    6 : begin
           fram_subprjacc1.Align :=alclient;
           fram_subprjacc1.Init(PrjAcount);
           fram_subprjacc1.Visible := true;
           cxComboBox1.Visible := False;
        end ;
   end;
end;

procedure Tfrm_GenPrjacc.BitBtn8Click(Sender: TObject);
begin
  if CurCorpCode='2' then
  if RadioGroup4.ItemIndex>-1 then
  begin
     case RadioGroup4.ItemIndex of
       0: if cxComboBox1.ItemIndex=0 then
            cxPopupEdit1.Text:='闵市路2003'
          else if cxComboBox1.ItemIndex=1 then cxPopupEdit1.Text:='闵市路2004'   ;
       1: if cxComboBox1.ItemIndex=0 then cxPopupEdit1.Text:='闵路代2003'
          else if cxComboBox1.ItemIndex=1 then cxPopupEdit1.Text:='闵路代2004';
     end;
  end;
  if CurCorpCode='4' then
  if RadioGroup4.ItemIndex>-1 then
  begin
     case RadioGroup4.ItemIndex of
       0: if cxComboBox1.ItemIndex=0 then
            cxPopupEdit1.Text:='青市路2003'
          else if cxComboBox1.ItemIndex=1 then cxPopupEdit1.Text:='青市路2004'   ;
       1: if cxComboBox1.ItemIndex=0 then cxPopupEdit1.Text:='青路代2003'
          else if cxComboBox1.ItemIndex=1 then cxPopupEdit1.Text:='青路代2004';
     end;
  end;
end;

procedure Tfrm_GenPrjacc.fram_subprjacc1BitBtn1Click(Sender: TObject);
begin
  fram_subprjacc1.BitBtn1Click(Sender);
  PrjAcount := fram_subprjacc1.prjacc;
  self.ModalResult := Mrok;
end;

procedure Tfrm_GenPrjacc.fram_subprjacc1BitBtn2Click(Sender: TObject);
begin
  ModalResult := mrcancel;
end;

procedure Tfrm_GenPrjacc.cxComboBox1PropertiesChange(Sender: TObject);
begin
  case cxComboBox1.ItemIndex of
    0: case AccessTag of
           0: if CurCorpCode='2' then  lbl_prifix.Caption := '闵业2003-'
               else lbl_prifix.Caption := '青业2003-' ;
           1: lbl_prifix.Caption := '03';
           2:  if CurCorpCode='2' then  cxPopupEdit1.Text:='闵代2003'
              else  cxPopupEdit1.Text:='青代2003';
           4: if CurCorpCode='2' then cxPopupEdit1.Text := '321P-03'
              else  cxPopupEdit1.Text := '324P-03' ;
           5: if CurCorpCode='2' then cxPopupEdit1.Text := '闵工2003'
              else cxPopupEdit1.Text := '青工2003' ;
         end;
    1: case AccessTag of
           0: if CurCorpCode='2' then lbl_prifix.Caption := '闵业2004-'
               else lbl_prifix.Caption := '青业2004-' ;
           1: lbl_prifix.Caption := '04';
           2: if CurCorpCode='2' then cxPopupEdit1.Text:='闵代2004'
               else  cxPopupEdit1.Text:='青代2004';
           4: if CurCorpCode='2' then cxPopupEdit1.Text := '321P-04'
              else cxPopupEdit1.Text := '324P-04';
           5: if CurCorpCode='2' then cxPopupEdit1.Text := '闵工2004'
               else cxPopupEdit1.Text := '青工2004' ;
       end;
  end; 
end;

end.
