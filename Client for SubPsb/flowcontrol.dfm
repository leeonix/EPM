object Frm_FlowControl: TFrm_FlowControl
  Left = 317
  Top = 155
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #24037#20316#27969#31243
  ClientHeight = 292
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 7
    Top = 7
    Width = 325
    Height = 241
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 325
      Height = 241
      ActivePage = TabSheet1
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = PageControl1Change
      OnChanging = PageControl1Changing
      object TabSheet1: TTabSheet
        Caption = '  '#27969' '#21521'  '
        object Bevel1: TBevel
          Left = 7
          Top = 33
          Width = 306
          Height = 2
        end
        object Label1: TLabel
          Left = 7
          Top = 11
          Width = 165
          Height = 15
          Caption = #35831#22312#27492#36873#25321#39033#30446#30340#27969#21521#12290
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lb_direction: TListBox
          Left = 14
          Top = 52
          Width = 201
          Height = 144
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          ItemHeight = 15
          Items.Strings = (
            '')
          TabOrder = 0
        end
        object Button3: TButton
          Left = 231
          Top = 170
          Width = 73
          Height = 24
          Caption = #19979#19968#27493' >'
          TabOrder = 1
          OnClick = Button3Click
        end
      end
      object TabSheet2: TTabSheet
        Caption = '  '#25191#34892#20154'  '
        ImageIndex = 1
        object Label2: TLabel
          Left = 7
          Top = 11
          Width = 225
          Height = 15
          Caption = #35831#22312#27492#36873#25321#19979#19968#20010#27969#31243#30340#25191#34892#20154#12290
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Bevel2: TBevel
          Left = 7
          Top = 33
          Width = 307
          Height = 2
        end
        object SpeedButton1: TSpeedButton
          Left = 102
          Top = 93
          Width = 26
          Height = 18
          Caption = '>'
          Flat = True
          OnClick = SpeedButton1Click
        end
        object SpeedButton2: TSpeedButton
          Left = 102
          Top = 132
          Width = 26
          Height = 18
          Caption = '<'
          Flat = True
          OnClick = SpeedButton2Click
        end
        object Label4: TLabel
          Left = 7
          Top = 39
          Width = 75
          Height = 15
          Caption = #23703#20301#20154#21592#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 137
          Top = 39
          Width = 60
          Height = 15
          Caption = #25191#34892#20154#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lb_employee: TListBox
          Left = 7
          Top = 58
          Width = 91
          Height = 150
          ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
          ItemHeight = 15
          MultiSelect = True
          TabOrder = 0
        end
        object Button7: TButton
          Left = 246
          Top = 128
          Width = 68
          Height = 26
          Caption = '<'#19978#19968#27493' '
          TabOrder = 1
          OnClick = Button7Click
        end
        object Button8: TButton
          Left = 246
          Top = 181
          Width = 68
          Height = 25
          Caption = #19979#19968#27493' >'
          TabOrder = 2
          OnClick = Button8Click
        end
        object lb_executor: TListBox
          Left = 131
          Top = 58
          Width = 91
          Height = 150
          ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
          ItemHeight = 15
          TabOrder = 3
        end
      end
      object TabSheet3: TTabSheet
        Caption = '  '#20248#20808#32423'  '
        ImageIndex = 2
        object Bevel3: TBevel
          Left = 7
          Top = 33
          Width = 308
          Height = 2
        end
        object Label3: TLabel
          Left = 7
          Top = 11
          Width = 165
          Height = 15
          Caption = #35831#36873#25321#39033#30446#30340#32531#24613#24773#20917#12290
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Button5: TButton
          Left = 209
          Top = 98
          Width = 67
          Height = 25
          Caption = '<'#19978#19968#27493' '
          TabOrder = 0
          OnClick = Button5Click
        end
        object Button6: TButton
          Left = 209
          Top = 137
          Width = 67
          Height = 25
          Caption = #23436'  '#25104
          TabOrder = 1
          OnClick = btnokClick
        end
        object rg_yxj: TRadioGroup
          Left = 13
          Top = 46
          Width = 183
          Height = 117
          Caption = #20248#20808#32423
          Items.Strings = (
            #32039'  '#24613
            #26222'  '#36890
            #20302#20248#20808#32423)
          TabOrder = 2
        end
      end
    end
  end
  object btnok: TButton
    Left = 171
    Top = 258
    Width = 78
    Height = 26
    Caption = #30830#23450
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnokClick
  end
  object btncancel: TButton
    Left = 254
    Top = 258
    Width = 78
    Height = 26
    Caption = #21462#28040
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 2
  end
end
