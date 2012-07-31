object Frm_report: TFrm_report
  Left = 246
  Top = 175
  BorderStyle = bsSingle
  Caption = #25253#34920#31649#29702#22120
  ClientHeight = 410
  ClientWidth = 526
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 160
    Top = 0
    Width = 366
    Height = 410
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 310
      Width = 366
      Height = 100
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'Panel2'
      TabOrder = 0
      object Button1: TButton
        Left = 192
        Top = 70
        Width = 68
        Height = 27
        Caption = #30830#23450
        TabOrder = 0
      end
      object Button2: TButton
        Left = 278
        Top = 70
        Width = 60
        Height = 27
        Caption = #36864#20986
        ModalResult = 2
        TabOrder = 1
      end
      object RadioGroup1: TRadioGroup
        Left = 6
        Top = 3
        Width = 347
        Height = 59
        BiDiMode = bdLeftToRight
        Caption = #25253#34920#36755#20986#24418#24335#65306
        Columns = 3
        ItemIndex = 1
        Items.Strings = (
          #22266#23450#26684#24335
          'Excel'#26684#24335)
        ParentBiDiMode = False
        TabOrder = 2
      end
    end
    object pnl_container: TPanel
      Left = 0
      Top = 0
      Width = 366
      Height = 310
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Bevel1: TBevel
        Left = 13
        Top = 30
        Width = 321
        Height = 2
      end
      object Label1: TLabel
        Left = 109
        Top = 54
        Width = 60
        Height = 12
        Caption = #36215#22987#26085#26399#65306
      end
      object Label2: TLabel
        Left = 109
        Top = 99
        Width = 60
        Height = 12
        Caption = #32467#26463#26085#26399#65306
      end
      object Label3: TLabel
        Left = 109
        Top = 169
        Width = 60
        Height = 12
        Caption = #35774#35745#20154#21592#65306
      end
      object Label4: TLabel
        Left = 14
        Top = 13
        Width = 84
        Height = 12
        Caption = #23436#25104#26085#26399#33539#22260#65306
      end
      object Bevel2: TBevel
        Left = 13
        Top = 140
        Width = 321
        Height = 2
      end
      object Label5: TLabel
        Left = 19
        Top = 122
        Width = 60
        Height = 12
        Caption = #24037#20316#20154#21592#65306
      end
      object cbx_design: TComboBox
        Left = 179
        Top = 166
        Width = 138
        Height = 20
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        ItemHeight = 12
        TabOrder = 0
      end
      object dtp_begin: TDateTimePicker
        Left = 176
        Top = 48
        Width = 129
        Height = 20
        Date = 38761.448428888890000000
        Time = 38761.448428888890000000
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
      end
      object dtp_end: TDateTimePicker
        Left = 176
        Top = 96
        Width = 129
        Height = 20
        Date = 38761.448428888890000000
        Time = 38761.448428888890000000
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 2
      end
    end
  end
  object RzGroupBar1: TRzGroupBar
    Left = 0
    Top = 0
    Height = 410
    GradientColorStart = clBtnFace
    GradientColorStop = clBtnShadow
    GroupBorderSize = 8
    Color = clBtnShadow
    ParentColor = False
    TabOrder = 1
    object RzGroup1: TRzGroup
      Items = <
        item
          Caption = #35774#35745#26376#25253
          IndentLevel = 1
          OnClick = RzGroup1Items0Click
        end
        item
          Caption = #22870#37329#32771#35780
          IndentLevel = 1
          OnClick = RzGroup1Items1Click
        end
        item
          Caption = #20998#31867#32479#35745
          IndentLevel = 1
          OnClick = RzGroup1Items2Click
        end>
      Opened = True
      OpenedHeight = 88
      DividerVisible = False
      Caption = #35774#35745#23460#25253#34920
      ParentColor = False
    end
    object RzGroup2: TRzGroup
      Items = <
        item
          Caption = #24037#31243#32467#31639#25253#34920
          IndentLevel = 1
          OnClick = RzGroup2Items0Click
        end>
      Opened = True
      OpenedHeight = 48
      DividerVisible = False
      Caption = #24037#31243#24314#35774#37096#25253#34920
      ParentColor = False
    end
  end
  object excelrep: TMyReport
    Reporttitle = #19978#28023#26216#36745#31185#25216'Excel'#36755#20986
    Col = 2
    prefixchar = '@'
    reporttype = rtreport
    dataset = Dm_Epm.adoqry_rep
    Left = 400
    Top = 208
  end
end
