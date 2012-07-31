object Fram_dg: TFram_dg
  Left = 0
  Top = 0
  Width = 555
  Height = 453
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  TabStop = True
  object PageControl1: TPageControl
    Left = 0
    Top = 199
    Width = 555
    Height = 254
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Tag = 1
      Caption = '    '#22996#25176#20869#23481'    '
      object WTNR: TRichEdit
        Tag = 1
        Left = 0
        Top = 0
        Width = 547
        Height = 222
        Align = alClient
        BevelOuter = bvNone
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Tag = 2
      Caption = '  '#32447#36335#24037#21306#26680#23454'    '
      ImageIndex = 1
      object Bevel3: TBevel
        Left = 0
        Top = 2
        Width = 521
        Height = 207
        Shape = bsFrame
      end
      object Label9: TLabel
        Left = 205
        Top = 42
        Width = 63
        Height = 14
        Caption = #26680#23454#26085#26399':'
      end
      object Label8: TLabel
        Left = 206
        Top = 14
        Width = 49
        Height = 14
        Caption = #26680#23454#20154':'
      end
      object Label6: TLabel
        Left = 16
        Top = 63
        Width = 42
        Height = 14
        Caption = #22791#27880#65306
      end
      object sptn_sig: TSpeedButton
        Tag = 2
        Left = 436
        Top = 9
        Width = 35
        Height = 25
        Hint = #31614#21517
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555FFFFFFFFFF5F5557777777777505555777777777757F55555555555555
          055555555555FF5575F555555550055030555555555775F7F7F55555550FB000
          005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
          B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
          305555577F555557F7F5550E0BFBFB003055557575F55577F7F550EEE0BFB0B0
          305557FF575F5757F7F5000EEE0BFBF03055777FF575FFF7F7F50000EEE00000
          30557777FF577777F7F500000E05555BB05577777F75555777F5500000555550
          3055577777555557F7F555000555555999555577755555577755}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sptn_sigClick
      end
      object HSDATE: TEdit
        Tag = 2
        Left = 284
        Top = 38
        Width = 150
        Height = 22
        ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
        TabOrder = 4
      end
      object XLHSR: TEdit
        Tag = 2
        Left = 285
        Top = 10
        Width = 150
        Height = 22
        Enabled = False
        ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
        TabOrder = 0
      end
      object XLTY: TRadioButton
        Tag = 2
        Left = 16
        Top = 15
        Width = 169
        Height = 17
        Caption = #21516#24847#36827#34892#35774#35745#26045#24037
        TabOrder = 1
      end
      object XLBTY: TRadioButton
        Tag = 2
        Left = 16
        Top = 41
        Width = 185
        Height = 17
        Caption = #26465#20214#19981#20855#22791#65292#19981#21516#24847
        TabOrder = 2
      end
      object xlbz: TRichEdit
        Tag = 2
        Left = 16
        Top = 80
        Width = 481
        Height = 121
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 3
      end
    end
    object TabSheet3: TTabSheet
      Tag = 3
      Caption = '  '#33829#19994#25910#36153' '
      ImageIndex = 2
      object Label12: TLabel
        Left = 8
        Top = 77
        Width = 98
        Height = 14
        Caption = #29992#25143#20184#36153#37329#39069#65306
      end
      object Label13: TLabel
        Left = 8
        Top = 114
        Width = 98
        Height = 14
        Caption = #29992#25143#20184#36153#26085#26399#65306
      end
      object Label11: TLabel
        Left = 8
        Top = 11
        Width = 112
        Height = 14
        Caption = #36890#30693#29992#25143#20184#36153#20154#65306
      end
      object Label14: TLabel
        Left = 8
        Top = 45
        Width = 70
        Height = 14
        Caption = #36890#30693#26085#26399#65306
      end
      object SpeedButton1: TSpeedButton
        Tag = 3
        Left = 265
        Top = 8
        Width = 35
        Height = 25
        Hint = #36890#30693#31614#21517
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555FFFFFFFFFF5F5557777777777505555777777777757F55555555555555
          055555555555FF5575F555555550055030555555555775F7F7F55555550FB000
          005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
          B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
          305555577F555557F7F5550E0BFBFB003055557575F55577F7F550EEE0BFB0B0
          305557FF575F5757F7F5000EEE0BFBF03055777FF575FFF7F7F50000EEE00000
          30557777FF577777F7F500000E05555BB05577777F75555777F5500000555550
          3055577777555557F7F555000555555999555577755555577755}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object TZYHFFR: TEdit
        Tag = 3
        Left = 118
        Top = 8
        Width = 147
        Height = 22
        ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
        TabOrder = 0
      end
      object TZRQ: TEdit
        Tag = 3
        Left = 118
        Top = 40
        Width = 147
        Height = 22
        ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
        TabOrder = 1
      end
      object SFJE: TEdit
        Tag = 3
        Left = 118
        Top = 74
        Width = 147
        Height = 22
        ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
        TabOrder = 2
      end
      object SFRQ: TEdit
        Tag = 3
        Left = 118
        Top = 109
        Width = 147
        Height = 22
        ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
        TabOrder = 3
        OnDblClick = SFRQDblClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 555
    Height = 199
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label3: TLabel
      Left = 7
      Top = 34
      Width = 63
      Height = 14
      Caption = #22996#25176#26085#26399':'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 65
      Width = 63
      Height = 14
      Caption = #22996#25176#21333#20301':'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 95
      Width = 63
      Height = 14
      Caption = #21333#20301#22320#22336':'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 273
      Top = 34
      Width = 77
      Height = 14
      Caption = #21463#29702#33829#19994#21592':'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 128
      Width = 63
      Height = 14
      Caption = #32852#31995#30005#35805':'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Bevel2: TBevel
      Left = 0
      Top = 21
      Width = 512
      Height = 2
    end
    object Label29: TLabel
      Left = 16
      Top = 4
      Width = 224
      Height = 14
      Caption = #35831#22312#20197#19979#36755#20837#25110#26597#30475#20195#24037#22996#25176#20869#23481#12290
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 159
      Width = 63
      Height = 14
      Caption = #24037#31243#24080#21495':'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 0
      Top = 184
      Width = 519
      Height = 2
    end
    object SQDATE: TDateTimePicker
      Tag = 1
      Left = 79
      Top = 30
      Width = 163
      Height = 22
      Date = 37194.624925347200000000
      Time = 37194.624925347200000000
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ParentFont = False
      TabOrder = 0
    end
    object LXDH: TEdit
      Tag = 1
      Left = 80
      Top = 123
      Width = 424
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
      ParentFont = False
      TabOrder = 1
    end
    object SLYYY: TEdit
      Tag = 1
      Left = 374
      Top = 31
      Width = 129
      Height = 22
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ParentFont = False
      TabOrder = 2
    end
    object YHMC: TEdit
      Tag = 1
      Left = 80
      Top = 61
      Width = 425
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
      ParentFont = False
      TabOrder = 3
    end
    object YHDZ: TEdit
      Tag = 1
      Left = 80
      Top = 91
      Width = 425
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
      ParentFont = False
      TabOrder = 4
    end
    object prjaccount: TEdit
      Tag = 1
      Left = 80
      Top = 155
      Width = 361
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #32043#20809#21326#23431#25340#38899'V5'
      ParentFont = False
      TabOrder = 5
    end
    object Button1: TButton
      Left = 443
      Top = 154
      Width = 29
      Height = 23
      Caption = '...'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = Button1Click
    end
  end
  object path: TEdit
    Left = 416
    Top = 200
    Width = 121
    Height = 20
    ImeName = #32043#20809#21326#23431#25340#38899'V5'
    TabOrder = 2
    Visible = False
  end
end
