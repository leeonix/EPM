object frm_export: Tfrm_export
  Left = 337
  Top = 238
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #36873#25321#36755#20986#20449#24687
  ClientHeight = 314
  ClientWidth = 227
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 126
    Height = 14
    Caption = #35831#36873#25321#36755#20986#30340#23383#27573#65306
  end
  object Bevel1: TBevel
    Left = 8
    Top = 31
    Width = 217
    Height = 3
  end
  object BitBtn1: TBitBtn
    Left = 29
    Top = 281
    Width = 79
    Height = 27
    Caption = #30830#23450
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 117
    Top = 281
    Width = 80
    Height = 27
    Caption = #20851#38381
    TabOrder = 1
    Kind = bkCancel
  end
  object CheckListBox1: TCheckListBox
    Left = 8
    Top = 40
    Width = 211
    Height = 233
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    ItemHeight = 14
    TabOrder = 2
  end
end
