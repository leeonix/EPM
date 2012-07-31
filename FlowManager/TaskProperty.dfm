object frm_TaskProp: Tfrm_TaskProp
  Left = 251
  Top = 161
  BorderStyle = bsDialog
  Caption = #20219#21153#33410#28857#23646#24615
  ClientHeight = 446
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object RzDialogButtons1: TRzDialogButtons
    Left = 0
    Top = 410
    Width = 540
    ButtonColor = 15791348
    CaptionOk = #30830#23450
    CaptionCancel = #21462#28040
    CaptionHelp = '&Help'
    HotTrack = True
    HighlightColor = 16026986
    HotTrackColor = 3983359
    ShowDivider = True
    ShowGlyphs = True
    OnClickCancel = RzDialogButtons1ClickCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object RzSizePanel1: TRzSizePanel
    Left = 0
    Top = 0
    Width = 177
    Height = 410
    HotSpotVisible = True
    SizeBarWidth = 7
    TabOrder = 1
    VisualStyle = vsGradient
    object Trv_Nodes: TTreeView
      Left = 0
      Top = 0
      Width = 169
      Height = 410
      Align = alClient
      HideSelection = False
      Indent = 19
      ParentShowHint = False
      PopupMenu = PopupMenu1
      RowSelect = True
      ShowHint = True
      TabOrder = 0
      OnChange = Trv_NodesChange
      Items.NodeData = {
        0101000000210000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        0004416D0B7A8282B970}
    end
  end
  object RzPageControl1: TRzPageControl
    Left = 177
    Top = 0
    Width = 363
    Height = 410
    ActivePage = RzTabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 2
    TabStyle = tsDoubleSlant
    FixedDimension = 21
    object RzTabSheet1: TRzTabSheet
      Caption = #19968#33324#23646#24615
      object RzBorder1: TRzBorder
        Left = 16
        Top = 160
        Width = 337
        Height = 169
        BorderShadow = clNone
      end
      object RzLabel1: TRzLabel
        Left = 19
        Top = 33
        Width = 75
        Height = 15
        Caption = #33410#28857#21517#31216#65306
      end
      object RzLabel2: TRzLabel
        Left = 19
        Top = 75
        Width = 75
        Height = 15
        Caption = #23703#20301#35282#33394#65306
      end
      object RzLabel3: TRzLabel
        Left = 32
        Top = 196
        Width = 75
        Height = 15
        Caption = #32771#26680#21608#26399#65306
      end
      object RzLabel5: TRzLabel
        Left = 19
        Top = 116
        Width = 75
        Height = 15
        Caption = #20219#21153#31616#36848#65306
      end
      object RzLabel6: TRzLabel
        Left = 256
        Top = 197
        Width = 61
        Height = 15
        Caption = '('#24037#20316#26085')'
      end
      object RzCh_Ev: TRzCheckBox
        Left = 24
        Top = 152
        Width = 89
        Height = 17
        Caption = #26159#21542#32771#26680
        State = cbUnchecked
        TabOrder = 0
      end
      object Red_NodeName: TRzEdit
        Left = 96
        Top = 29
        Width = 241
        Height = 23
        ImeName = #32043#20809#21326#23431#25340#38899'V5'
        TabOrder = 1
      end
      object RcB_Role: TRzComboBox
        Left = 96
        Top = 71
        Width = 241
        Height = 23
        ImeName = #32043#20809#21326#23431#25340#38899'V5'
        ItemHeight = 15
        TabOrder = 2
      end
      object Re_TaskTip: TRzEdit
        Left = 96
        Top = 112
        Width = 241
        Height = 23
        ImeName = #32043#20809#21326#23431#25340#38899'V5'
        TabOrder = 3
      end
      object RzNuE_Setdate: TRzNumericEdit
        Left = 112
        Top = 192
        Width = 137
        Height = 23
        ImeName = #32043#20809#21326#23431#25340#38899'V5'
        TabOrder = 4
        DisplayFormat = ',0;(,0)'
      end
      object RzRadioGroup1: TRzRadioGroup
        Left = 32
        Top = 240
        Width = 305
        Height = 57
        Caption = #32771#26680#31867#22411
        Columns = 3
        ItemFrameColor = 8409372
        ItemHotTrack = True
        ItemHighlightColor = 2203937
        ItemHotTrackColor = 3983359
        Items.Strings = (
          #35780#20272#21442#32771' '
          #22870#24809#32771#26680
          #21442#25968)
        TabOrder = 5
      end
      object RzBitBtn1: TRzBitBtn
        Left = 272
        Top = 344
        Width = 79
        Height = 27
        Caption = #20445#23384
        Color = 15791348
        HighlightColor = 16026986
        HotTrack = True
        HotTrackColor = 3983359
        TabOrder = 6
        OnClick = RzBitBtn1Click
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000730E0000730E00000001000000000000000000003300
          00006600000099000000CC000000FF0000000033000033330000663300009933
          0000CC330000FF33000000660000336600006666000099660000CC660000FF66
          000000990000339900006699000099990000CC990000FF99000000CC000033CC
          000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
          0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
          330000333300333333006633330099333300CC333300FF333300006633003366
          33006666330099663300CC663300FF6633000099330033993300669933009999
          3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
          330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
          66006600660099006600CC006600FF0066000033660033336600663366009933
          6600CC336600FF33660000666600336666006666660099666600CC666600FF66
          660000996600339966006699660099996600CC996600FF99660000CC660033CC
          660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
          6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
          990000339900333399006633990099339900CC339900FF339900006699003366
          99006666990099669900CC669900FF6699000099990033999900669999009999
          9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
          990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
          CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
          CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
          CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
          CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
          CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
          FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
          FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
          FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
          FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
          000000808000800000008000800080800000C0C0C00080808000191919004C4C
          4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
          6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E809090909
          090909090909090909E8E8E881818181818181818181818181E8E809101009E3
          1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
          1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
          1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
          E3E3E3E3E309101009E8E881ACAC81E3E3E3E3E3E381ACAC81E8E80910101009
          090909090910101009E8E881ACACAC818181818181ACACAC81E8E80910101010
          101010101010101009E8E881ACACACACACACACACACACACAC81E8E80910100909
          090909090909101009E8E881ACAC8181818181818181ACAC81E8E8091009D7D7
          D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E8091009D709
          0909090909D7091009E8E881AC81D7818181818181D781AC81E8E8091009D7D7
          D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E809E309D709
          0909090909D7090909E8E881E381D7818181818181D7818181E8E8091009D7D7
          D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E80909090909
          090909090909090909E8E88181818181818181818181818181E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
    end
    object RzTabSheet2: TRzTabSheet
      Caption = #33410#28857#24037#20316#35268#33539
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Rz_Red_TaskDes: TRzRichEdit
        Left = 0
        Top = 0
        Width = 359
        Height = 385
        Align = alBottom
        BevelInner = bvNone
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #32043#20809#21326#23431#25340#38899'V5'
        Lines.Strings = (
          #35831#22312#27492#22788#36755#20837#26412#33410#28857#30340#24037#20316#35268#33539)
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 72
    Top = 80
    object N1: TMenuItem
      Caption = #26032#24314#33410#28857
      OnClick = N1Click
    end
  end
end
