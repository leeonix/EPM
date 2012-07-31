object Form_Main: TForm_Main
  Left = 190
  Top = 170
  Width = 711
  Height = 517
  Caption = 'Form_Main'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Lst_Main: TRzGroupBar
    Left = 0
    Top = 40
    Width = 145
    Height = 404
    ColorAdjustment = 30
    GroupBorderSize = 4
    Style = gbsTaskList
    UseGradients = False
    Color = clWindow
    ParentColor = False
    TabOrder = 0
    object RzGroup1: TRzGroup
      CanClose = False
      CaptionFont.Charset = ANSI_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -15
      CaptionFont.Name = #23435#20307
      CaptionFont.Style = [fsBold]
      Items = <
        item
          Action = Act_ModCorp
        end
        item
          Action = Act_ModUser
        end
        item
          Action = Act_ModJobRole
        end>
      Opened = True
      OpenedHeight = 87
      DividerVisible = True
      UseGradients = True
      Caption = #31649#29702
    end
  end
  object RzStatusBar1: TRzStatusBar
    Left = 0
    Top = 444
    Width = 703
    Height = 19
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    TabOrder = 1
    object RzGlyphStatus1: TRzGlyphStatus
      Left = -1
      Top = 1
      Width = 555
      Height = 19
      Align = alClient
    end
    object RzClockStatus1: TRzClockStatus
      Left = 554
      Top = 1
      Height = 19
      Align = alRight
    end
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 703
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 699
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 686
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 31
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
      Images = ImageList1
      ShowCaptions = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = Act_New
      end
      object ToolButton3: TToolButton
        Left = 31
        Top = 0
        Action = Act_Open
      end
      object ToolButton2: TToolButton
        Left = 62
        Top = 0
        Action = Act_Modify
      end
      object ToolButton6: TToolButton
        Left = 93
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 101
        Top = 0
        Action = Act_Save
      end
      object ToolButton5: TToolButton
        Left = 132
        Top = 0
        Action = Act_Delete
      end
      object ToolButton8: TToolButton
        Left = 163
        Top = 0
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 11
        Style = tbsSeparator
      end
      object ToolButton7: TToolButton
        Left = 171
        Top = 0
        Action = Act_Cancel
      end
      object ToolButton10: TToolButton
        Left = 202
        Top = 0
        Width = 43
        Caption = 'ToolButton10'
        ImageIndex = 12
        Style = tbsSeparator
      end
      object ToolButton9: TToolButton
        Left = 245
        Top = 0
        Caption = #20851#38381
        ImageIndex = 12
        OnClick = ToolButton9Click
      end
    end
  end
  object Pan_Dock: TRzPanel
    Left = 145
    Top = 40
    Width = 558
    Height = 404
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 3
  end
  object MainMenu1: TMainMenu
    AutoHotkeys = maManual
    Images = ImageList1
    Left = 168
    Top = 72
    object N11: TMenuItem
      Caption = #31995#32479'(&S)'
      object N12: TMenuItem
        Caption = #36864#20986
        ImageIndex = 12
        OnClick = N12Click
      end
    end
    object Men_ModuleSwitch: TMenuItem
      Caption = #31649#29702'(&M)'
      object ActModJobRole1: TMenuItem
        Action = Act_ModJobRole
      end
      object N3: TMenuItem
        Action = Act_ModCorp
      end
      object ActModUser1: TMenuItem
        Action = Act_ModUser
      end
    end
    object N4: TMenuItem
      Caption = #32534#36753'(&E)'
      object N5: TMenuItem
        Action = Act_New
      end
      object N6: TMenuItem
        Action = Act_Open
      end
      object N7: TMenuItem
        Action = Act_Modify
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object N9: TMenuItem
        Action = Act_Save
        Caption = #20445#23384#20449#24687
      end
      object N10: TMenuItem
        Action = Act_Cancel
        Caption = #21462#28040#25805#20316
      end
    end
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 360
    Top = 80
    object Act_New: TAction
      Category = 'Operation'
      Caption = #26032#24314
      ImageIndex = 0
      OnExecute = EditRecord
    end
    object Act_Open: TAction
      Category = 'Operation'
      Caption = #25171#24320
      ImageIndex = 2
      OnExecute = EditRecord
    end
    object Act_Modify: TAction
      Category = 'Operation'
      Caption = #20462#25913
      ImageIndex = 4
      OnExecute = EditRecord
    end
    object Act_Save: TAction
      Category = 'Operation'
      Caption = #20445#23384
      ImageIndex = 6
      OnExecute = EditRecord
    end
    object Act_ModCorp: TAction
      Tag = 1
      Category = 'Module'
      Caption = #20844#21496#20449#24687#31649#29702
      OnExecute = ShowModule
    end
    object Act_ModUser: TAction
      Tag = 2
      Category = 'Module'
      Caption = #29992#25143#20449#24687#31649#29702
      OnExecute = ShowModule
    end
    object Act_ModJobRole: TAction
      Tag = 3
      Category = 'Module'
      Caption = #35282#33394#31649#29702
      OnExecute = ShowModule
    end
    object Act_Delete: TAction
      Category = 'Operation'
      Caption = #21024#38500
      ImageIndex = 8
      OnExecute = EditRecord
    end
    object Act_Cancel: TAction
      Category = 'Operation'
      Caption = #21462#28040
      ImageIndex = 10
      OnExecute = EditRecord
    end
  end
  object ImageList1: TImageList
    Left = 248
    Top = 72
    Bitmap = {
      494C01010E001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001001000000000000028
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
      000000000000000000000000000000000000000000000000000000000000BC7B
      000000000000000000000000000000000000000000000000000000000000BC7B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000BC7B9C7339679C73
      BC7B00000000000000000000000000000000000000000000BC7B000039679C73
      BC7B000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000BC7B9C73D65A794E93319331
      D65A39679C73BC7B000000000000000000000000BC7B0000D65A734E734E734E
      D65A39670000BC7B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C73794E9331794E794EFF7F9331
      734E734ED65A9C73000000000000000000000000734E734E734E734EFF7F734E
      734E734ED65A0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009331794E3F4F3F4F3F67FF7F9331
      864D864D864DBC7B00000000000000000000734E734E186318633967FF7F734E
      734E734E734EBC7B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000093313F4F3F4F3F4F3F67FF7F9331
      2C672C676066FF7F3F670000000000000000734E1863186318633967FF7F734E
      18631863734EFF7F396700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000093313F4F3F4F3F4F3F67FF7F9331
      2C672C7F66663F6799010000000000000000734E1863186318633967FF7F734E
      18633967734E3967734E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000093313F4F794E79323F67FF7F9331
      3367337FD65A9F0199010000000000000000734E1863734E734E3967FF7F734E
      39673967D65A734E734E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000093313F4F9331FF7F3F67FF7F9331
      336718639901990199019901990199010000734E18638C31FF7F3967FF7F734E
      39671863734E734E734E734E734E734E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000093313F4F794E93313F67FF7F9331
      000099019901990199019901990199010000734E1863734E8C313967FF7F734E
      9C73734E734E734E734E734E734E734E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000093313F4F3F4F3F4F3F67FF7F9331
      0000794E9901990199019901990199010000734E1863186318633967FF7F734E
      9C73734E734E734E734E734E734E734E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000093313F4F3F4F3F4F3F67FF7F9331
      3967BC7B794E9F0199010000000000000000734E1863186318633967FF7F734E
      3967BC7B734E734E734E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000093313F4F3F4F3F4F3F67FF7F9331
      3367000033673F4F99010000000000000000734E1863186318633967FF7F734E
      39679C7339671863734E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009331794E3F4F3F4F3F67FF7F9331
      39670000666600003F4F0000000000000000734E734E186318633967FF7F734E
      39679C73734E0000186300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000018637932794E394FFF7F9331
      60666066606600000000000000000000000000001863734E734E1863FF7F734E
      734E734E734E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000003967794E93319331
      0000000000000000000000000000000000000000000000003967734E734E734E
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000004C000000000000
      0000000000000000000000000000007C0000000000000000734E000000000000
      0000000000000000000000000000396700000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C664007C004C00000000
      00000000000000000000000000000000000000000000734E3967734E00000000
      00000000000000000000000000000000000000000000000000007932D300D300
      7932000000000000000000000000000000000000000000000000D65A734E734E
      D65A0000000000000000000000000000000000000000C664667E007C004C0000
      000000000000000000000000007C0000000000000000734E9C733967734E0000
      000000000000000000000000396700000000000000000000D300D30099019901
      D30000000000000000000000000000000000000000000000734E734E39673967
      734E00000000000000000000000000000000000000000000C664807D00640000
      00000000000000000000007C000000000000000000000000734E9C73734E0000
      00000000000000000000396700000000000000000000D30099019901D300D300
      79320000000000000000000000000000000000000000734E39673967734E734E
      D65A0000000000000000000000000000000000000000000000000064007C004C
      0000000000000000007C004C0000000000000000000000000000734E3967734E
      00000000000000003967734E00000000000000007932D3009901D30079320000
      0000D300D300D300D300D300D300D30000000000D65A734E3967734ED65A0000
      0000734E734E734E734E734E734E734E0000000000000000000000000064007C
      004C00000000007C004C000000000000000000000000000000000000734E3967
      734E000000003967734E00000000000000000000D3009901D300793200000000
      0000D30099019901990199019901D30000000000734E3967734ED65A00000000
      0000734E39673967396739673967734E00000000000000000000000000000064
      007C004C007C004C00000000000000000000000000000000000000000000734E
      3967734E3967734E000000000000000000000000D3009901D300000000000000
      00000000D3009901990199019901D30000000000734E3967734E000000000000
      00000000734E3967396739673967734E00000000000000000000000000000000
      0064007C004C0000000000000000000000000000000000000000000000000000
      734E3967734E0000000000000000000000000000D3009901D300793200000000
      000000007932D300990199019901D30000000000734E3967734ED65A00000000
      00000000D65A734E396739673967734E00000000000000000000000000000064
      007C004C0064004C00000000000000000000000000000000000000000000734E
      3967734E734E734E0000000000000000000000007932D3009901D30079320000
      7932D300D3009901D30099019901D30000000000D65A734E3967734ED65A0000
      D65A734E734E3967734E39673967734E0000000000000000000000000064007C
      004C000000000064004C000000000000000000000000000000000000734E3967
      734E00000000734E734E000000000000000000000000D30099019901D300D300
      D30099019901D3007932D3009901D300000000000000734E39673967734E734E
      734E39673967734ED65A734E3967734E00000000000000000064007C007C004C
      00000000000000000064004C000000000000000000000000734E39673967734E
      0000000000000000734E734E000000000000000000000000D300D30099019901
      9901D300D300000000000000D300D3000000000000000000734E734E39673967
      3967734E734E000000000000734E734E0000000000000064667E007C004C0000
      000000000000000000000064004C0000000000000000734E9C733967734E0000
      00000000000000000000734E734E0000000000000000000000007932D300D300
      D300793200000000000000000000000000000000000000000000D65A734E734E
      734ED65A0000000000000000000000000000000000008C4D00648C4D00000000
      000000000000000000000000000000640000000000003967734E396700000000
      0000000000000000000000000000734E00000000000000000000000000000000
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
      0000000000000000000000000000000000000000000079327932793279327932
      79327932793279327932793279320000000000000000734E734E734E734E734E
      734E734E734E734E734E734E734E0000000000000000D300D300D300D300D300
      D300D300D300D300D300D300D300D300000000000000734E734E734E734E734E
      734E734E734E734E734E734E734E734E0000000000007932FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F79320000000000000000734E0000000000000000
      000000000000000000000000734E000000000000D30099019901D3009C739901
      D3009C739C739C73D30099019901D30000000000734E39673967734E9C733967
      734E9C739C739C73734E39673967734E0000000000007932FF7F396739673967
      3967FF7FFF7FFF7FFF7FFF7F79320000000000000000734E0000396739673967
      396700000000000000000000734E000000000000D30099019901D3009C739901
      D3009C739C739C73D30099019901D30000000000734E39673967734E9C733967
      734E9C739C739C73734E39673967734E0000000000007932FF7FFF7FFF7FFF7F
      FF7FFF7FD300FF7FFF7FFF7F79320000000000000000734E0000000000000000
      00000000734E000000000000734E000000000000D30099019901D3009C739901
      D3009C739C739C73D30099019901D30000000000734E39673967734E9C733967
      734E9C739C739C73734E39673967734E0000000000007932FF7F39673967FF7F
      FF7FD300D300FF7FFF7FFF7F79320000000000000000734E0000396739670000
      0000734E734E000000000000734E000000000000D30099019901D3009C739C73
      9C739C739C739C73D30099019901D30000000000734E39673967734E9C739C73
      9C739C739C739C73734E39673967734E0000000000007932FF7FFF7FFF7FFF7F
      D300D300D300D3007932FF7F79320000000000000000734E0000000000000000
      734E734E734E734E39670000734E000000000000D300990199019901D300D300
      D300D300D300D300990199019901D30000000000734E396739673967734E734E
      734E734E734E734E396739673967734E0000000000007932FF7F39673967FF7F
      FF7FD300D300FF7FD300FF7F79320000000000000000734E0000396739670000
      0000734E734E0000734E0000734E000000000000D30099019901990199019901
      9901990199019901990199019901D30000000000734E39673967396739673967
      3967396739673967396739673967734E0000000000007932FF7FFF7FFF7FFF7F
      FF7FFF7FD300FF7FD300FF7F79320000000000000000734E0000000000000000
      00000000734E0000734E0000734E000000000000D30099019901D300D300D300
      D300D300D300D300D30099019901D30000000000734E39673967734E734E734E
      734E734E734E734E734E39673967734E0000000000007932FF7F396739673967
      FF7FFF7FFF7FFF7FD300FF7F79320000000000000000734E0000396739673967
      0000000000000000734E0000734E000000000000D3009901D300FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FD3009901D30000000000734E3967734EFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F734E3967734E0000000000007932FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FD300FF7F79320000000000000000734E0000000000000000
      0000000000000000734E0000734E000000000000D3009901D300FF7FD300D300
      D300D300D300D300FF7FD3009901D30000000000734E3967734EFF7F734E734E
      734E734E734E734EFF7F734E3967734E0000000000007932FF7FFF7FFF7FD300
      D300D300D300D3007932FF7F79320000000000000000734E000000000000734E
      734E734E734E734E39670000734E000000000000D3009901D300FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FD3009901D30000000000734E3967734EFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F734E3967734E0000000000007932FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F79320000000000000000734E0000000000000000
      000000000000000000000000734E000000000000D3009C73D300FF7FD300D300
      D300D300D300D300FF7FD300D300D30000000000734E9C73734EFF7F734E734E
      734E734E734E734EFF7F734E734E734E0000000000007932FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F79320000000000000000734E0000000000000000
      000000000000000000000000734E000000000000D3009901D300FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FD3009901D30000000000734E3967734EFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F734E3967734E00000000000079327932793279327932
      79327932793279327932793279320000000000000000734E734E734E734E734E
      734E734E734E734E734E734E734E000000000000D300D300D300D300D300D300
      D300D300D300D300D300D300D300D30000000000734E734E734E734E734E734E
      734E734E734E734E734E734E734E734E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000079327932793279327932
      79327932793279327932793279320000000000000000734E734E734E734E734E
      734E734E734E734E734E734E734E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007932FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F79320000000000000000734E0000000000000000
      000000000000000000000000734E0000000000006666804D804D804D804D804D
      804D804D804D804D804D2C670000000000000000734E734E734E734E734E734E
      734E734E734E734E734E3967000000000000000000007932FF7F9C739C739C73
      9C739C739C739C739C73FF7F79320000000000000000734E0000396739673967
      396739673967396739670000734E0000000066666666F37F2C7F2C7F2C7F2C7F
      2C7F2C7F2C7F2C7F6666804D000000000000734E734E9C733967396739673967
      3967396739673967734E734E000000000000000000007932FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F79320000000000000000734E0000000000000000
      000000000000000000000000734E00000000666666662C7FF37FF37FF37FF37F
      F37FF37FF37FF37F2C7F804D666600000000734E734E39679C739C739C739C73
      9C739C739C739C733967734E734E00000000000000007932FF7F9C739C739C73
      9C739C739C739C739C73FF7F79320000000000000000734E0000396739673967
      396739673967396739670000734E00000000666666662C7FF37FF37FF37FF37F
      F37FF37FF37FF37F2C7F2C67804D00000000734E734E39679C739C739C739C73
      9C739C739C739C7339673967734E00000000000000007932FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F79320000000000000000734E0000000000000000
      000000000000000000000000734E0000000066662C7F6666F37FF37FF37FF37F
      F37FF37FF37FF37F2C7FF37F804D66660000734E3967734E9C739C739C739C73
      9C739C739C739C7339679C73734E734E0000000000007932FF7F9C739C739C73
      9C739C739C739C739C73FF7F79320000000000000000734E0000396739673967
      396739673967396739670000734E0000000066662C7F2C672C67F37FF37FF37F
      F37FF37FF37FF37F2C7FF37F2C67804D0000734E3967396739679C739C739C73
      9C739C739C739C7339679C733967734E0000000000007932FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F79320000000000000000734E0000000000000000
      000000000000000000000000734E000000006666F37F2C7F6666F97FF97FF97F
      F97FF97FF97FF97FF37FF97FF97F804D0000734E9C733967734E9C739C739C73
      9C739C739C739C739C739C739C73734E0000000000007932FF7F9C739C739C73
      9C739C739C739C739C73FF7F79320000000000000000734E0000396739673967
      396739673967396739670000734E000000006666F37FF37F2C7F666666666666
      66666666666666666666666666662C7F0000734E9C739C733967734E734E734E
      734E734E734E734E734E734E734E39670000000000007932FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F79320000000000000000734E0000000000000000
      000000000000000000000000734E000000006666F97FF37FF37FF37FF37FF97F
      F97FF97FF97FF97F804D0000000000000000734E9C739C739C739C739C739C73
      9C739C739C739C73734E0000000000000000000000007932FF7F9C739C739C73
      9C739C73FF7F79327932793279320000000000000000734E0000396739673967
      396739670000734E734E734E734E0000000000006666F97FF97FF97FF97F6666
      6666666666666666000000000000000000000000734E9C739C739C739C73734E
      734E734E734E734E00000000000000000000000000007932FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F79329C73793200000000000000000000734E0000000000000000
      000000000000734E0000734E0000000000000000000066666666666666660000
      000000000000000000000000D300D300D30000000000734E734E734E734E0000
      000000000000000000000000734E734E734E000000007932FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F79327932000000000000000000000000734E0000000000000000
      000000000000734E734E00000000000000000000000000000000000000000000
      0000000000000000000000000000D300D3000000000000000000000000000000
      0000000000000000000000000000734E734E0000000079327932793279327932
      79327932793279320000000000000000000000000000734E734E734E734E734E
      734E734E734E734E000000000000000000000000000000000000000000000000
      00000000D300000000000000D3000000D3000000000000000000000000000000
      00000000734E000000000000734E0000734E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D300D300D3000000000000000000000000000000000000000000
      000000000000734E734E734E000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FDFFFDFF00000000E0FFE8FF00000000
      801FA05F00000000001F803F00000000001F001F00000000000F000F00000000
      000F000F00000000000F000F0000000000010001000000000101000100000000
      0101000100000000000F000F00000000008F000F0000000000AF002F00000000
      803F803F00000000E1FFE1FF00000000FFFFFFFFFFFFFFFFEFFDEFFDFFFFFFFF
      C7FFC7FFF0FFF0FFC3FBC3FBE0FFE0FFE3F7E3F7C0FFC0FFF1E7F1E783018301
      F8CFF8CF87018701FC1FFC1F8F818F81FE3FFE3F87818781FC1FFC1F82018201
      F8CFF8CFC001C001E1E7E1E7E039E039C3F3C3F3F07FF07FC7FDC7FDFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC003C003C001C001
      C003DFFB80018001C003D0FB80018001C003DFBB80018001C003D33B80018001
      C003DE0B80018001C003D32B80018001C003DFAB80018001C003D1EB80018001
      C003DFEB80018001C003DC0B80018001C003DFFB80018001C003DFFB80018001
      C003C00380018001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC003C003FFFFFFFF
      C003DFFB80078007C003D00B00070007C003DFFB00030003C003D00B00030003
      C003DFFB00010001C003D00B00010001C003DFFB00010001C003D00B00010001
      C003DFFB000F000FC003D043801F801FC007DFD7C3F8C3F8C00FDFCFFFFCFFFC
      C01FC01FFFBAFFBAFFFFFFFFFFC7FFC700000000000000000000000000000000
      000000000000}
  end
end
