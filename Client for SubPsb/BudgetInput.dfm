object Frm_InputBud: TFrm_InputBud
  Left = 382
  Top = 252
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24037#31243#39033#30446#39044#31639
  ClientHeight = 222
  ClientWidth = 318
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 12
  object Bevel1: TBevel
    Left = 7
    Top = 160
    Width = 297
    Height = 50
    Shape = bsFrame
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 209
    Height = 145
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 60
      Height = 12
      Caption = #19987#19994#31867#21035#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 52
      Width = 60
      Height = 12
      Caption = #39044#31639#36153#29992#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 84
      Width = 60
      Height = 12
      Caption = #35774#35745#36153#29992#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 116
      Width = 60
      Height = 12
      Caption = #32771#35780#31995#25968#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object edt_budfee: TEdit
      Left = 72
      Top = 48
      Width = 121
      Height = 20
      ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
      TabOrder = 1
    end
    object Edt_desfee: TEdit
      Left = 72
      Top = 80
      Width = 121
      Height = 20
      ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
      TabOrder = 2
    end
    object Edt_k1: TEdit
      Left = 72
      Top = 112
      Width = 121
      Height = 20
      ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
      TabOrder = 3
    end
    object cbx_item: TComboBox
      Left = 72
      Top = 16
      Width = 121
      Height = 20
      ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
      ItemHeight = 12
      TabOrder = 0
      Items.Strings = (
        #39640#21387#32447#36335
        #20302#21387#32447#36335
        #39640#21387#30005#32518
        #20302#21387#30005#32518
        #21464#30005
        #36890#20449
        #22303#24314
        #30005#32518#26725
        #25490#31649)
    end
  end
  object Bitn_savenew: TBitBtn
    Left = 226
    Top = 9
    Width = 77
    Height = 27
    Caption = #20445#23384#24182#26032#28155
    TabOrder = 1
    OnClick = Bitn_savenewClick
  end
  object Bitn_saveclose: TBitBtn
    Left = 226
    Top = 49
    Width = 77
    Height = 27
    Caption = #20445#23384#24182#20851#38381
    TabOrder = 2
    OnClick = Bitn_savecloseClick
  end
  object Bitn_close: TBitBtn
    Left = 226
    Top = 89
    Width = 77
    Height = 27
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 3
    OnClick = Bitn_closeClick
  end
  object StaticText1: TStaticText
    Left = 16
    Top = 164
    Width = 281
    Height = 44
    AutoSize = False
    Caption = #35831#25353#19987#19994#31867#21035#20998#21035#24405#20837#25110#20462#25913#24744#24403#21069#22788#29702#30340#24037#31243#30340#39044#31639#20197#21450#35774#35745#36153#65292#35774#35745#23460#36127#36131#20154#21487#20197#35774#32622#30456#24212#19987#19994#30340#32771#35780#31995#25968#12290
    Font.Charset = GB2312_CHARSET
    Font.Color = clGreen
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
end
