object Frm_Main: TFrm_Main
  Left = 169
  Top = 132
  Width = 641
  Height = 472
  Caption = #24037#20316#27969
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCloseQuery = CloseFlow
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 18
  object Splitter1: TSplitter
    Tag = 6
    Left = 204
    Top = 73
    Width = 8
    Height = 348
    Cursor = crHSplit
    OnPaint = Splitter1Paint
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 633
    Height = 73
    AutoSize = True
    Bands = <
      item
        Control = TBar_Menu
        ImageIndex = -1
        MinHeight = 26
        Width = 629
      end
      item
        Control = ToolBar2
        ImageIndex = -1
        MinHeight = 41
        Width = 629
      end>
    object TBar_Menu: TToolBar
      Left = 9
      Top = 0
      Width = 616
      Height = 26
      AutoSize = True
      ButtonHeight = 26
      ButtonWidth = 97
      Caption = #33756#21333
      EdgeBorders = []
      Flat = True
      ShowCaptions = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Caption = #27969'  '#31243'(&F)'
        Grouped = True
        MenuItem = N_File
      end
      object ToolButton6: TToolButton
        Left = 97
        Top = 0
        Caption = #29992'  '#25143'(&U)'
        Grouped = True
        MenuItem = N_Employ
      end
      object ToolButton2: TToolButton
        Left = 194
        Top = 0
        Caption = #26597'  '#30475'(&S)'
        Grouped = True
        MenuItem = N_Query
      end
      object ToolButton4: TToolButton
        Left = 291
        Top = 0
        Caption = #24110'  '#21161'(&H)'
        Grouped = True
        MenuItem = N_Help
      end
    end
    object ToolBar2: TToolBar
      Left = 9
      Top = 28
      Width = 616
      Height = 41
      AutoSize = True
      ButtonHeight = 41
      ButtonWidth = 79
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
      HotImages = ImgL_SmlIcon_A
      Images = ImgL_SmlIcon_A
      ShowCaptions = True
      TabOrder = 1
      object ToolButton5: TToolButton
        Left = 0
        Top = 0
        Action = Act_NewFlow
        Caption = #24037#20316#27969
      end
      object TBtn_FlowNode: TToolButton
        Left = 79
        Top = 0
        Action = Act_NewFlowNode
        Caption = #24037#20316#33410#28857
      end
      object Tbtn_LinkNodeLine: TToolButton
        Left = 158
        Top = 0
        Action = Act_LinkTaskNode
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 421
    Width = 633
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object Pan_FlowTree: TPanel
    Left = 0
    Top = 73
    Width = 204
    Height = 348
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object Pan_TreeInfoBar: TPanel
      Left = 0
      Top = 0
      Width = 204
      Height = 22
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' '#24037#20316#27969#31243#26641
      TabOrder = 0
      object Btn_MinTree: TSpeedButton
        Left = 183
        Top = 3
        Width = 18
        Height = 18
        Flat = True
        Glyph.Data = {
          66000000424D66000000000000003E000000280000000A0000000A0000000100
          010000000000280000000000000000000000020000000000000000000000FFFF
          FF00FFC00000FFC000009E400000CCC00000E1C00000F3C00000E1C00000CCC0
          00009E400000FFC00000}
        OnClick = MinTree
      end
    end
    inline Frame_FlowTree: TFrame_ViewFlowTree
      Left = 0
      Top = 22
      Width = 204
      Height = 326
      Align = alClient
      TabOrder = 1
      OnResize = Frame_FlowTreeResize
      inherited Pan_Interface: TPanel
        Width = 204
        Height = 326
        inherited Tvw_FlowDataList: TTreeView
          Width = 204
          Height = 326
          HideSelection = False
        end
      end
    end
  end
  object Pan_Splitter: TPanel
    Left = 212
    Top = 73
    Width = 0
    Height = 348
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 3
    object SpeedButton1: TSpeedButton
      Left = 3
      Top = 6
      Width = 10
      Height = 75
      Flat = True
      OnClick = ShowFlowTree
    end
  end
  object Panel1: TPanel
    Left = 212
    Top = 73
    Width = 421
    Height = 348
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    inline FlowMap: TFrame_ViewFlowMap
      Left = 0
      Top = 0
      Width = 421
      Height = 348
      Align = alClient
      Color = clWhite
      ParentColor = False
      TabOrder = 0
      inherited Pan_Interface: TPanel
        Width = 421
        Height = 348
        inherited Dbx_FlowCanvas: TcdDrawbox
          Width = 417
          Height = 344
        end
      end
      inherited Ldd_LinkNode: TLineDepends
        Generator.Pen.Width = 2
      end
    end
  end
  object Menu_FlowWork: TMainMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 384
    Top = 16
    object N_File: TMenuItem
      Caption = #27969'  '#31243'(&F)'
      object N1: TMenuItem
        Caption = #26032#24314#24037#20316#27969#21521#23548'...'
        OnClick = N1Click
      end
      object N3: TMenuItem
        Action = Act_NewFlow
        Caption = #26032#24314#24037#20316#27969'...'
      end
      object ActNewFlowNode1: TMenuItem
        Action = Act_NewFlowNode
        Caption = #26032#24314#24037#20316#33410#28857'...'
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object ActDelFlow1: TMenuItem
        Action = Act_DelFlow
      end
      object ActDelFlowNode1: TMenuItem
        Action = Act_DelFlowNode
      end
      object ActDelFlow2: TMenuItem
        Action = Act_DelFlow
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object N8: TMenuItem
        Caption = #20851'    '#38381
        OnClick = ExitWorkFlow
      end
    end
    object N_Employ: TMenuItem
      Caption = #29992'  '#25143'(&U)'
      object N17: TMenuItem
        Action = Act_EmployManage
      end
      object N2: TMenuItem
        Action = Act_PartManage
      end
    end
    object N_Query: TMenuItem
      Caption = #26597'  '#30475'(&S)'
      object N13: TMenuItem
        Action = Act_Show_FlowGlyph
      end
      object N14: TMenuItem
        Action = Act_Show_FlowTaskNodeList
      end
      object N15: TMenuItem
        Action = Act_Show_Part
      end
      object N16: TMenuItem
        Action = Act_Show_PartUserList
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object ActWinShowFlowTree1: TMenuItem
        Action = Act_Win_ShowFlowTree
      end
      object N12: TMenuItem
        Action = Act_Win_Tools
        Caption = #24037#20855#26639'...'
      end
    end
    object N_Help: TMenuItem
      Caption = #24110'  '#21161'(&H)'
      object N9: TMenuItem
        Caption = #20851#20110' '#24037#20316#27969' ...'
      end
      object N10: TMenuItem
        Caption = #24110#21161
        ShortCut = 112
      end
    end
  end
  object ActList_FlowOperator: TActionList
    Images = ImgL_SmlIcon_A
    Left = 424
    Top = 16
    object Act_Show_FlowGlyph: TAction
      Category = 'Show'
      Caption = #26174#31034' '#24037#20316#27969#22270
    end
    object Act_NewFlow: TAction
      Category = 'Flow'
      Caption = #26032#24314#24037#20316#27969
      ImageIndex = 0
      OnExecute = Act_NewFlowExecute
    end
    object Act_EmployManage: TAction
      Category = 'Employ'
      Caption = #29992#25143#31649#29702'...'
      OnExecute = Act_EmployManageExecute
    end
    object Act_NewFlowNode: TAction
      Category = 'Flow'
      Caption = #26032#24314#24037#20316#33410#28857
      ImageIndex = 1
      OnExecute = Act_NewFlowNodeExecute
    end
    object Act_DelFlow: TAction
      Category = 'Flow'
      Caption = #21024#38500#24037#20316#27969
    end
    object Act_DelFlowNode: TAction
      Category = 'Flow'
      Caption = #21024#38500#33410#28857
    end
    object Act_Win_ShowFlowTree: TAction
      Category = 'Windows'
      Caption = #26174#31034' '#24037#20316#27969#31243#26641
    end
    object Act_Show_FlowTaskNodeList: TAction
      Category = 'Show'
      Caption = #26174#31034' '#24037#20316#20219#21153#21015#34920
    end
    object Act_Show_TaskInfo: TAction
      Category = 'Show'
      Caption = #26174#31034' '#24037#20316#20219#21153#20449#24687
    end
    object Act_Show_Part: TAction
      Category = 'Show'
      Caption = #26174#31034' '#20219#21153#35282#33394
    end
    object Act_Show_PartUserList: TAction
      Category = 'Show'
      Caption = #26174#31034' '#35282#33394#29992#25143#21015
    end
    object Act_Win_Tools: TAction
      Category = 'Windows'
      Caption = #24037#20855#26639
    end
    object Act_SaveFlow: TAction
      Category = 'Flow'
      Caption = #20445#23384#24037#20316#27969
    end
    object Act_LinkTaskNode: TAction
      Category = 'Flow'
      Caption = #32852#25509#33410#28857
      ImageIndex = 2
      OnExecute = Act_LinkTaskNodeExecute
    end
    object Act_PartManage: TAction
      Category = 'Employ'
      Caption = #35282#33394#31649#29702'...'
      OnExecute = Act_PartManageExecute
    end
    object Act_AllotPatUsers: TAction
      Category = 'Employ'
      Caption = #20998#37197#35282#33394#29992#25143'...'
    end
  end
  object ImgL_SmlIcon_A: TImageList
    Left = 464
    Top = 16
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001001000000000000018
      0000000000000000000000000000000000001000000038000000D45900608074
      BC60643CA3604C4F8566384F8566340052618074BC6002000000FF7FFF7F4263
      0460CC490960200A0060B04F856634005261B04F8566073B0960541EB6400000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E04E8566541EB6408074BC600000
      0000B04F8566341BB860811D0060C01D00608074BC60104F8566E11905605419
      056053000000795D0060D042B2604C4F8566004F856600000000A046B5601C0A
      016011000000121F006006010000203139005001526190380160340052611C5D
      0060500152614F5D006090380160DE58006001000000017C0F00000200000100
      0000085200601A05046040330160017C0F0043610460D0026760D0026760A05E
      B6601C4066600009C07FA05EB6605471BB605471BB6008520060C86104604C4F
      8566597706601F000000541EB6408074BC605050B8608074BC601F000000C513
      00609C7604608074BC605050B8604C4F85660200000000000000953D0360984E
      8566800000008070BB60002A0360C070BB6000000000C070BB60984E85669C4E
      8566861D0A60984E8566441B01607E4100605E6F306000000000000000000400
      0000010000000870DF7F00280000010000000870DF7F085200601A0504604033
      0160002800000A0404600009C07F000200000058726034005261344E85660025
      B5600100000001000000010000009765006057010000A52A01600025B5609030
      01601C4C9E66F067BB600000000000000000000000008000000080000000C070
      BB60C070BB609765006057010000612A0160784E8566C070BB60984E85660200
      000090300160244D9E66C070BB60984E85666B300060501ED07F501ED07F0000
      0000344E8566A024AD608B070C0000000000E8380160010000008059A860D765
      04608B070C0001000000A024AD603D3804601C4E85666036AD60344E85660010
      000007270360344E85666036AD60344E85660010000048440460284E85666B2A
      0360284E8566A335036032390460344E856614062400D84D8566E706837FE803
      A460F03CA3600C20016000000000340052615E660060BC05A460E803A460AD0B
      0000081905603A02000088150560FF3000604C1ED07F344E8566000000008B07
      0C0000000000772800604033016005000000233D9601872F006040330160344E
      85666036AD60655820600C76DF7F01000000000000008B070C00000000007728
      00604033016005000000235DD103872F006040330160CC4D8566E013AD606558
      20600C76DF7F010000006B3000604D06837F12720000200A837F4400A460F03C
      A3600029A4604004A4600100000008000000B04D85660106837F5000A4605026
      A46002000000E803A4604004A460F03CA3600000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF3000604C1ED07FCC4D85660000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F75EF75EEF3D0000FF7FF75EEF3D
      0000E03D0000FF7FF75EF75EF75EEF3D00000000FF7FF75EF75E0F000F000F00
      0F00EF01EF010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F001F001F001F001F00F75EF75E
      EF3DFF7FF75EF75E1F001F001F001F001F000F00F75EEF3D0000FF7FF75E0000
      FF7FFF7FEF3D0000F75E0000F75EEF3D00000000FF7FF75E0F00FF03FF03FF03
      EF3D0F00F75EF75EEF3D0000FF7FF75EF75EEF3D1F001F001F001F00F75EF75E
      EF3DFF7FF75EF75E1F001F000F000F000F000000FF7F0F00FF03FF7FFF03FF03
      FF030F00F75EF75EEF3D0000FF7FF75EF75E0F000F000F001F001F00F75EF75E
      EF3DFF7FF75EF75E1F001F001F001F00EF3DF75EF75EEF3D0000FF7FF75E0000
      E07FE07FEF3D0000F75EF75EF75EEF3D00000000FF7F0F00FF03FF03FF03FF03
      FF030F00F75EF75EEF3D0000FF7FF75E0F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000EF3DEF3DEF3DEF3DEF3DEF3DEF3D0000000000000000000000000000
      00000000000000000000000000000000000000000F3E0F3E0F3E0F3E0F3E0F3E
      0F3E0F3E0F3E0F3E0F3E0F3E0F3E0F3E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000F000F000F000F000F000F000F00EF3D00000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000F3EFF7F1167E07F1167E07F
      1167E07F1167E07F1167E07F11670F3E00000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000EF3DEF3D
      EF3D0F00FF7FFF7FFF7FFF7FFF7F0F00EF3D00000000000000000000FF7F0000
      0000FF7F00000000000000000000FF7F000000000F3EFF7FE07F1167E07FAB14
      AB14AB14AB141167E07F1167E07F0F3E0000000000000000F75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75E0000000000000000000000000F000F000F00
      0F000F00FF7FFF7FFF7FFF7FFF7F0F00EF3D00000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000F3EFF7F1167E07F1167AB14
      00540054AB14E07F1167E07F11670F3E0000000000000F000F000F000F000F00
      0F000F000F000F000F000F000F00F75E00000000000000000F00EF3D00000000
      00000F000F000F000F000F000F000F00EF3D00000000000000000000FF7F0000
      0000FF7F00000000000000000000FF7F000000000F3EFF7FE07F1167E07FAB14
      AB14AB14AB141167E07F1167E07F0F3E000000000F00FF7FFF7F0F00FF7FFF7F
      FF7F0F00FF7FFF7F0F00FF7FFF7F0F00F75E0000000000000F00000000000000
      00000F00FF7FFF7FFF7FFF7FFF7F0F00EF3D00000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000F3EFF7F1167E07FAB14E07F
      1167E07F1167AB141167E07F11670F3E000000000F000F000F000F000F000F00
      0F000F000F000F000F000F000F000F00F75E00000F000F000F000F000F000000
      00000F000F000F000F000F000F000F0000000000000000000000000000000000
      00000000000000000000000000000000000000000F3EFF7FAB14AB14AB14AB14
      E07F1167AB14AB14AB14AB14E07F0F3E000000000F00FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0F00F75E000000000F00FF7F0F0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000F3EFF7FAB14FF7FFF7FAB14
      1167E07FAB1400000000AB1411670F3E000000000F000F000F000F000F000F00
      0F000F000F000F000F000F000F000F00F75E0000EF3DEF3D0F00EF3DEF3DEF3D
      EF3D00000000000000000000000000000000000000000000000000000000FF7F
      0000000000000000000000000F000000000000000F3EFF7FAB14AB14AB14AB14
      E07F1167AB14AB14AB14AB14E07F0F3E000000000F00FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0F00F75E0F000F000F000F000F000F000F00
      EF3D000000000000000000000000000000000000FF7F000000000000FF7F0000
      FF7F00000000000000000F000F000000000000000F3EFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0F3E000000000F000F000F000F000F000F00
      0F000F000F000F000F000F000F000F00F75E0F00FF7FFF7FFF7FFF7FFF7F0F00
      EF3D0000000000000000000000000000000000000000FF7F0000FF7F0000FF7F
      0000FF7FFF7FFF7F00000F000F000000000000000F3E1167E07F1167E07F1167
      E07F11670F3E0F3E0F3E0F3E0F3E0F3E000000000F00FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0F0000000F00FF7FFF7FFF7FFF7FFF7F0F00
      EF3D00000000000000000000000000000000000000000000FF7F0000FF7F0000
      FF7FFF7FFF7FFF7FFF7F0F000F0000000000000000000F3E1167E07F1167E07F
      11670F3E0000000000000000000000000000000000000F000F000F000F000F00
      0F000F000F000F000F000F000F00000000000F000F000F000F000F000F000F00
      EF3D000000000000000000000000000000000000000000000000FF7F0000FF7F
      FF7FFF7FFF7FFF7FFF7F0F000F00000000000000000000000F3E0F3E0F3E0F3E
      0F3E000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000F00FF7FFF7FFF7FFF7FFF7F0F00
      EF3D0000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F00000F000F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000F000F000F000F000F000F000F00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000F000F0000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF000F000F000F000F000F000F000F000F00
      0F000F000F000F000F000F000F000F000F000F000F000F000F000F000F000F00
      0F000F000F000F00FFFF0F00FFFFFFFFFFFF0F00FFFFFFFFFFFFFFFFFFFFFFFF
      0F000F000F000F000F000F00FFFF0F00FFFF0F000F00FFFF0F00FFFF0F000F00
      0F000F000F000F000F000F00FFFF0F000F000F000F00FFFF0F00FFFF0F000F00
      0F000F000F000F000F000F00FFFF0F000F000F000F00FFFF0F00FFFF0F00FFFF
      0F000F000F000F00FFFFFFFF0F000F000F000F00FFFFFFFF0F00FFFFFFFFFFFF
      000000000F000F000200F70E0000000000B0238360A40100CA0BC60B2E260118
      00000000CCD91A000000DE6500000000FFFFFFFFFFFFFFFFFFFFFFFFFF80F000
      8001FFFFFF00F0008001FFFFF800F0008001E003F000F0008001C001E700F000
      80018000EF00F000800180008301F00080018000C7FFFDFF8001800080FFB0F3
      8001800000FF10038001800000FF80038001800100FFC003C07FC00300FFE003
      E0FFFFFF00FFF003FFFFFFFF01FFF81300000000000000000000000000000000
      000000000000}
  end
end