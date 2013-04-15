object Frm_Main: TFrm_Main
  Left = 59
  Top = 123
  Caption = ' EPM'
  ClientHeight = 639
  ClientWidth = 858
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Splitter2: TSplitter
    Left = 0
    Top = 91
    Height = 522
    ExplicitTop = 95
    ExplicitHeight = 405
  end
  object stbmain: TStatusBar
    Left = 0
    Top = 613
    Width = 858
    Height = 26
    Panels = <
      item
        Width = 150
      end
      item
        Width = 200
      end
      item
        Width = 300
      end
      item
        Alignment = taCenter
        Width = 50
      end>
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 858
    Height = 89
    AutoSize = True
    Bands = <
      item
        Control = Tbr_Menu
        ImageIndex = -1
        MinHeight = 22
        Width = 856
      end
      item
        Control = Tbr_Tool
        ImageIndex = -1
        MinHeight = 38
        Width = 856
      end
      item
        Control = Tbr_Navgitor
        ImageIndex = -1
        Width = 856
      end>
    Color = clBtnFace
    EdgeBorders = []
    EdgeInner = esNone
    EdgeOuter = esNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    object Splitter1: TSplitter
      Left = 256
      Top = 24
      Height = 0
    end
    object Tbr_Menu: TToolBar
      Left = 11
      Top = 0
      Width = 847
      Height = 22
      AutoSize = True
      ButtonWidth = 84
      Caption = 'Tbr_Menu'
      EdgeInner = esNone
      EdgeOuter = esNone
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ShowCaptions = True
      TabOrder = 0
      Transparent = False
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        AutoSize = True
        Caption = #25991#20214'(&F)'
        Grouped = True
        MenuItem = F1
      end
      object ToolButton2: TToolButton
        Left = 60
        Top = 0
        AutoSize = True
        Caption = #32534#36753'(&E)'
        Grouped = True
        MenuItem = N4
      end
      object ToolButton13: TToolButton
        Left = 120
        Top = 0
        AutoSize = True
        Caption = #26597#30475'(&V)'
        Grouped = True
        MenuItem = N46
      end
      object ToolButton4: TToolButton
        Left = 180
        Top = 0
        AutoSize = True
        Caption = #24037#20855'(&T)'
        Grouped = True
        MenuItem = D1
      end
      object ToolButton5: TToolButton
        Left = 240
        Top = 0
        AutoSize = True
        Caption = #26597#35810'(&Q)'
        Grouped = True
        MenuItem = Q1
      end
      object ToolButton6: TToolButton
        Left = 300
        Top = 0
        AutoSize = True
        Caption = #25253#34920'(&R)'
        Grouped = True
        MenuItem = R1
      end
      object ToolButton3: TToolButton
        Left = 360
        Top = 0
        AutoSize = True
        Caption = #22270#26723'(&D)'
        Grouped = True
        MenuItem = N33
      end
      object ToolButton16: TToolButton
        Left = 420
        Top = 0
        AutoSize = True
        Caption = #24037#31243#31649#29702'(&P)'
        Grouped = True
        MenuItem = N26
      end
      object ToolButton7: TToolButton
        Left = 508
        Top = 0
        AutoSize = True
        Caption = #24110#21161'&(H)'
        Grouped = True
        MenuItem = H1
      end
    end
    object Tbr_Tool: TToolBar
      Left = 11
      Top = 24
      Width = 847
      Height = 38
      AutoSize = True
      ButtonHeight = 38
      ButtonWidth = 39
      Caption = 'Tbr_Tool'
      EdgeInner = esNone
      EdgeOuter = esNone
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      Images = Imglst_Tools
      List = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      Transparent = False
      Wrapable = False
      object ToolButton8: TToolButton
        Left = 0
        Top = 0
        AutoSize = True
        Caption = #26032#24314
        ImageIndex = 0
        MenuItem = mnt_new
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
      end
      object ToolButton18: TToolButton
        Left = 66
        Top = 0
        Hint = #27880#20876
        Action = relogin
        AutoSize = True
        ImageIndex = 10
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton9: TToolButton
        Left = 109
        Top = 0
        Width = 20
        Caption = 'ToolButton9'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object tbtntask: TToolButton
        Tag = 1
        Left = 129
        Top = 0
        Hint = #20219#21153#31665#23548#33322#35270#22270
        AllowAllUp = True
        AutoSize = True
        Grouped = True
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
        OnClick = tbtntaskClick
      end
      object tbtnprj: TToolButton
        Tag = 2
        Left = 172
        Top = 0
        Hint = #39033#30446#23548#33322#35270#22270
        AllowAllUp = True
        AutoSize = True
        Grouped = True
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
        OnClick = tbtntaskClick
      end
      object tbtnsearch: TToolButton
        Tag = 3
        Left = 215
        Top = 0
        Hint = ' '#25628#32034#23548#33322#35270#22270
        AllowAllUp = True
        AutoSize = True
        Grouped = True
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
        OnClick = tbtntaskClick
      end
      object ToolButton14: TToolButton
        Left = 258
        Top = 0
        Width = 18
        Caption = 'ToolButton14'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object ToolButton12: TToolButton
        Left = 276
        Top = 0
        Hint = #36882#20132#39033#30446
        Action = Asendprj
        AutoSize = True
        ImageIndex = 9
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton11: TToolButton
        Left = 319
        Top = 0
        Hint = #21047#26032
        Action = Arefresh
        AutoSize = True
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton15: TToolButton
        Left = 362
        Top = 0
        Width = 16
        Caption = 'ToolButton15'
        ImageIndex = 8
        Style = tbsSeparator
      end
      object ToolButton17: TToolButton
        Left = 378
        Top = 0
        Hint = #24110#21161
        Action = Ahlp
        AutoSize = True
        Caption = ' '
        ImageIndex = 6
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton10: TToolButton
        Left = 421
        Top = 0
        Hint = #36864#20986#31995#32479
        Action = quit
        AutoSize = True
        Caption = ' '
        ImageIndex = 7
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton20: TToolButton
        Left = 464
        Top = 0
        Caption = 'ToolButton20'
        ImageIndex = 5
        OnClick = ToolButton20Click
      end
    end
    object Tbr_Navgitor: TToolBar
      Left = 11
      Top = 64
      Width = 847
      Height = 25
      ButtonHeight = 23
      Caption = 'Tbr_Navgitor'
      EdgeInner = esNone
      EdgeOuter = esNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Transparent = False
      OnResize = Tbr_NavgitorResize
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 57
        Height = 23
        Align = alTop
        AutoSize = False
        Caption = #23548#33322'(D) '
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Cbx_Nav: TComboBoxEx
        Left = 57
        Top = 0
        Width = 520
        Height = 23
        ItemsEx = <
          item
            Caption = #25105#30340#20219#21153#31665
            ImageIndex = 0
            SelectedImageIndex = 0
          end
          item
            Caption = #24037#31243#36827#24230'\'#24037#31243#24615#36136'\'#24403#21069#25191#34892#20154
            ImageIndex = 1
            SelectedImageIndex = 1
          end
          item
            Caption = #24037#31243#24615#36136'\'#35774#35745#21592
          end
          item
            Caption = #24037#31243#24615#36136'\'#24037#31243#36827#24230
          end
          item
            Caption = #24037#31243#24615#36136'\'#24403#21069#25191#34892#37096#38376
          end>
        Style = csExDropDownList
        StyleEx = [csExNoSizeLimit]
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        ParentFont = False
        TabOrder = 0
        OnChange = Cbx_NavChange
        DropDownCount = 20
      end
      object SpeedButton1: TSpeedButton
        Left = 577
        Top = 0
        Width = 23
        Height = 23
        Hint = #23637#24320#25152#26377#23376#24037#31243
        Caption = '--'
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 89
    Width = 858
    Height = 2
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
  end
  object Pnl_right: TPanel
    Left = 3
    Top = 91
    Width = 855
    Height = 522
    Align = alClient
    AutoSize = True
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = clWindow
    TabOrder = 3
    object Lsv_Task: TListView
      Left = 1
      Top = 1
      Width = 853
      Height = 520
      Align = alClient
      BevelOuter = bvNone
      Columns = <>
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      HideSelection = False
      HotTrackStyles = [htHandPoint, htUnderlineHot]
      IconOptions.AutoArrange = True
      LargeImages = Imglst_Larg
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      PopupMenu = Pmn_Task
      SmallImages = Imglst_Task
      TabOrder = 0
      ViewStyle = vsReport
      OnColumnClick = Lsv_TaskColumnClick
      OnCompare = Lsv_TaskCompare
      OnDblClick = Lsv_TaskDblClick
      ExplicitLeft = 6
      ExplicitTop = 2
    end
  end
  object Mn_Main: TMainMenu
    AutoHotkeys = maManual
    Left = 336
    Top = 184
    object F1: TMenuItem
      Caption = #25991#20214'(&F)'
      object mnt_new: TMenuItem
        AutoHotkeys = maManual
        AutoLineReduction = maManual
        Caption = #26032#24314
        ImageIndex = 0
        object N2: TMenuItem
          Action = newgx
          AutoHotkeys = maManual
          Caption = #19994#25193#39033#30446'...'
        end
        object N7: TMenuItem
          Action = newdg
          AutoHotkeys = maManual
        end
        object N59: TMenuItem
          Action = newld
          Caption = #36335#28783#24037#31243'...'
        end
        object N60: TMenuItem
          Action = newpfm
          Caption = #20303#23429#37197#22871#24037#31243'...'
        end
        object N1: TMenuItem
          Action = newyg
        end
        object N58: TMenuItem
          Action = Newky
          Caption = #25216#25913#39033#30446'...'
        end
        object N70: TMenuItem
          Action = newsb
        end
        object N21: TMenuItem
          Action = newsubprj
          Caption = #23376#24037#31243'...'
        end
        object N3: TMenuItem
          Caption = '-'
        end
        object N68: TMenuItem
          Action = NewDesginPrj
        end
      end
      object N61: TMenuItem
        Caption = #23548#20837#22806#37096#35774#35745#39033#30446'...'
        OnClick = N61Click
      end
      object N65: TMenuItem
        Caption = '-'
      end
      object N43: TMenuItem
        Action = Pause
      end
      object N62: TMenuItem
        Action = reactive
      end
      object N22: TMenuItem
        Action = Awtdesign
      end
      object N19: TMenuItem
        Action = Archprj
      end
      object N66: TMenuItem
        Caption = '-'
      end
      object N8: TMenuItem
        Action = delete
        AutoHotkeys = maManual
        AutoLineReduction = maManual
      end
      object N45: TMenuItem
        Action = return
        AutoHotkeys = maManual
      end
      object N28: TMenuItem
        Action = clearrecycle
      end
      object N41: TMenuItem
        Caption = '-'
      end
      object N42: TMenuItem
        Action = relogin
      end
      object C1: TMenuItem
        Action = quit
        AutoHotkeys = maManual
      end
    end
    object N4: TMenuItem
      AutoHotkeys = maManual
      Caption = #32534#36753'(&E)'
      object N6: TMenuItem
        AutoHotkeys = maManual
        Caption = #26356#25913
      end
      object N15: TMenuItem
        AutoHotkeys = maManual
        Caption = #22797#21046
      end
      object N27: TMenuItem
        AutoHotkeys = maManual
        Caption = #21098#20999
      end
      object N16: TMenuItem
        AutoHotkeys = maManual
        Caption = #31896#36148
      end
    end
    object N46: TMenuItem
      AutoHotkeys = maManual
      Caption = #26597#30475'(&V)'
      object N47: TMenuItem
        AutoHotkeys = maManual
        Caption = #24037#20855#26639
        object N63: TMenuItem
          Caption = #23548#33322#26639
          Checked = True
        end
        object N64: TMenuItem
          Caption = #24037#20855#26639
          Checked = True
        end
      end
      object N48: TMenuItem
        AutoHotkeys = maManual
        Caption = #27983#35272#26639
        object mnutasktree: TMenuItem
          Tag = 1
          Caption = #20219#21153#25991#20214
          GroupIndex = 1
          RadioItem = True
          OnClick = mnutasktreeClick
        end
        object mnubrowser: TMenuItem
          Tag = 2
          Caption = #39033#30446#23548#33322
          GroupIndex = 1
          RadioItem = True
          OnClick = mnutasktreeClick
        end
        object mnusearch: TMenuItem
          Tag = 3
          Caption = #25628#32034
          GroupIndex = 1
          RadioItem = True
          OnClick = mnutasktreeClick
        end
      end
      object N49: TMenuItem
        AutoHotkeys = maManual
        Caption = #29366#24577#26639
        Checked = True
      end
      object N50: TMenuItem
        AutoHotkeys = maManual
        Caption = '-'
      end
      object N51: TMenuItem
        AutoHotkeys = maManual
        Caption = #22823#22270#26631
        OnClick = N51Click
      end
      object N52: TMenuItem
        AutoHotkeys = maManual
        Caption = #23567#22270#26631
        OnClick = N52Click
      end
      object N53: TMenuItem
        AutoHotkeys = maManual
        Caption = #21015#34920
        OnClick = N53Click
      end
      object N54: TMenuItem
        AutoHotkeys = maManual
        Caption = #35814#32454#36164#26009
        Checked = True
        RadioItem = True
        OnClick = N54Click
      end
      object N55: TMenuItem
        AutoHotkeys = maManual
        Caption = '-'
      end
      object N56: TMenuItem
        AutoHotkeys = maManual
        Caption = #36716#21040
      end
      object N57: TMenuItem
        Action = Arefresh
        AutoHotkeys = maManual
      end
    end
    object Q1: TMenuItem
      AutoHotkeys = maManual
      Caption = #26597#35810'(&Q)'
      object N18: TMenuItem
        Action = A_advanceSearch
      end
      object N17: TMenuItem
        Action = A_SearchInterprj
        Caption = #26597#35810#29992#25143#20869#37096#24037#31243'...'
      end
    end
    object R1: TMenuItem
      AutoHotkeys = maManual
      Caption = #25253#34920'(&R)'
      object N23: TMenuItem
        AutoHotkeys = maManual
        Caption = #24037#31243#35745#21010'...'
      end
      object N20: TMenuItem
        Action = RepManage
        Caption = #25253#34920#31649#29702'...'
      end
      object N44: TMenuItem
        Caption = #36229#21608#26399#30417#25511#25253#34920'...'
        OnClick = N44Click
      end
      object N75: TMenuItem
        Caption = '-'
      end
      object N76: TMenuItem
        Caption = #24037#31243#32467#31639#32479#35745#25253#34920
        OnClick = N76Click
      end
    end
    object D1: TMenuItem
      AutoHotkeys = maManual
      Caption = #24037#20855'(&T)'
      object N10: TMenuItem
        AutoHotkeys = maManual
        Caption = #20195#30721#32500#25252'...'
        OnClick = N10Click
      end
      object N9: TMenuItem
        Action = Asetuser
        AutoHotkeys = maManual
        Caption = #29992#25143#31649#29702
      end
      object N11: TMenuItem
        Action = Asetflow
        AutoHotkeys = maManual
        Caption = #27969#31243#35774#32622'...'
      end
      object N24: TMenuItem
        Action = Asetmat
      end
      object N29: TMenuItem
        Caption = #26045#24037#25215#21253#21830#32500#25252'...'
        OnClick = N29Click
      end
      object N78: TMenuItem
        Caption = #27979#32472#21333#20301#32500#25252'...'
        OnClick = N78Click
      end
      object N79: TMenuItem
        Caption = #30417#29702#21333#20301#32500#25252'...'
        OnClick = N79Click
      end
      object N77: TMenuItem
        Caption = #35774#35745#21333#20301#32500#25252'...'
        OnClick = N77Click
      end
      object N31: TMenuItem
        Caption = #21512#21516#28165#21333'...'
        OnClick = N31Click
      end
      object N72: TMenuItem
        Caption = #23548#20837#24037#31243#36153#29992#26126#32454
        OnClick = N72Click
      end
      object N12: TMenuItem
        AutoHotkeys = maManual
        Caption = '-'
      end
      object N13: TMenuItem
        Action = Amodpwd
        AutoHotkeys = maManual
      end
      object Apubsoft1: TMenuItem
        Action = Apubsoft
        Caption = #31243#24207#21457#24067'...'
      end
      object N14: TMenuItem
        AutoHotkeys = maManual
        Caption = #31995#32479#36873#39033'...'
      end
    end
    object N33: TMenuItem
      AutoHotkeys = maManual
      Caption = #22270#26723'(&D)'
      object N39: TMenuItem
        AutoHotkeys = maManual
        Caption = #36755#20837
      end
      object N40: TMenuItem
        AutoHotkeys = maManual
        Caption = #36755#20986
      end
      object N34: TMenuItem
        AutoHotkeys = maManual
        Caption = #22270#26723#26597#30475
        object N37: TMenuItem
          Caption = #24212#29992#31243#24207
        end
        object N38: TMenuItem
          Caption = #22270#26723#27983#35272#22120
        end
      end
      object N36: TMenuItem
        AutoHotkeys = maManual
        Caption = #22270#26723#24402#26723
      end
      object N35: TMenuItem
        AutoHotkeys = maManual
        Caption = #22270#26723#24674#22797
      end
    end
    object N26: TMenuItem
      AutoHotkeys = maManual
      Caption = #24037#31243#31649#29702'(&P)'
      object N73: TMenuItem
        Caption = #23548#20837#23457#20215#28165#21333
        OnClick = N73Click
      end
      object N74: TMenuItem
        Caption = #23548#20837#21021#35774#27010#31639#28165#21333'('#33829#38144#31867')'
        OnClick = N74Click
      end
      object N30: TMenuItem
        AutoHotkeys = maManual
        Caption = #35745#21010#31649#29702'...'
        OnClick = N30Click
      end
      object N32: TMenuItem
        Caption = '-'
      end
      object N71: TMenuItem
        Caption = #33829#19994#25910#36153'...'
        OnClick = N71Click
      end
    end
    object H1: TMenuItem
      AutoHotkeys = maManual
      Caption = #24110#21161'&(H)'
      object N5: TMenuItem
        Action = Ahlp
        AutoHotkeys = maManual
      end
      object A1: TMenuItem
        Action = about
        AutoHotkeys = maManual
      end
    end
  end
  object ActionList1: TActionList
    Left = 480
    Top = 144
    object newgx: TAction
      Tag = 1
      Category = 'File'
      Caption = #24037#35810#39033#30446'...'
      OnExecute = newgxExecute
    end
    object Asettree: TAction
      Category = 'View'
    end
    object newdg: TAction
      Tag = 1
      Category = 'File'
      Caption = #20195#24037#39033#30446'...'
      OnExecute = newdgExecute
    end
    object about: TAction
      Category = 'help'
      Caption = #20851#20110
      OnExecute = aboutExecute
    end
    object Ahlp: TAction
      Category = 'help'
      Caption = #24110#21161
      OnExecute = AhlpExecute
    end
    object Amodpwd: TAction
      Category = 'tool'
      Caption = #26356#25913#21475#20196'...'
      OnExecute = AmodpwdExecute
    end
    object Asetflow: TAction
      Tag = 4
      Category = 'tool'
      Caption = 'Asetflow'
      OnExecute = AsetflowExecute
    end
    object Asetuser: TAction
      Tag = 4
      Category = 'tool'
      Caption = 'Asetuser'
      OnExecute = AsetuserExecute
    end
    object EditCut1: TEditCut
      Category = 'Edit'
      Caption = 'Cu&t'
      Hint = 'Cut|Cuts the selection and puts it on the Clipboard'
      ImageIndex = 0
      ShortCut = 16472
    end
    object EditCopy1: TEditCopy
      Category = 'Edit'
      Caption = '&Copy'
      Hint = 'Copy|Copies the selection and puts it on the Clipboard'
      ImageIndex = 1
      ShortCut = 16451
    end
    object EditPaste1: TEditPaste
      Category = 'Edit'
      Caption = '&Paste'
      Hint = 'Paste|Inserts Clipboard contents'
      ImageIndex = 2
      ShortCut = 16470
    end
    object Pause: TAction
      Category = 'File'
      Caption = #26242#20572#39033#30446
      OnExecute = PauseExecute
    end
    object reactive: TAction
      Category = 'File'
      Caption = #21551#21160#26242#32531#39033#30446
      OnExecute = reactiveExecute
    end
    object newsb: TAction
      Tag = 4
      Category = 'File'
      Caption = #23567#21478#31561'...'
      OnExecute = newsbExecute
    end
    object newprj: TAction
      Tag = 1
      Category = 'File'
      Caption = #31435#39033#24037#31243'...'
    end
    object quit: TAction
      Category = 'File'
      Caption = #36864#20986
      OnExecute = quitExecute
    end
    object Asendprj: TAction
      Tag = 10
      Category = 'tool'
      Caption = #36882#20132
      OnExecute = AsendprjExecute
    end
    object Aviewnode: TAction
      Category = 'View'
    end
    object Arefresh: TAction
      Category = 'View'
      Caption = #21047#26032
      OnExecute = ArefreshExecute
    end
    object Aupnode: TAction
      Category = 'View'
      Caption = 'Aupnode'
    end
    object relogin: TAction
      Category = 'File'
      Caption = #27880#20876
      OnExecute = reloginExecute
    end
    object clearrecycle: TAction
      Tag = 4
      Category = 'File'
      Caption = #21024#38500#24223#20214
      OnExecute = clearrecycleExecute
    end
    object delete: TAction
      Tag = 4
      Category = 'File'
      Caption = #21024#38500
      OnExecute = deleteExecute
    end
    object return: TAction
      Tag = 4
      Category = 'File'
      Caption = #36824#21407
      OnExecute = returnExecute
    end
    object RepManage: TAction
      Category = 'report'
      Caption = #25253#34920#31649#29702
      OnExecute = RepManageExecute
    end
    object newyg: TAction
      Tag = 1
      Category = 'File'
      Caption = #19994#25193#37197#22871
      OnExecute = newygExecute
    end
    object A_SearchInterprj: TAction
      Category = 'Search'
      Caption = #26597#35810#29992#25143#20869#37096#24037#31243
      OnExecute = A_SearchInterprjExecute
    end
    object A_advanceSearch: TAction
      Category = 'Search'
      Caption = #35814#32454#26597#25214'...'
      OnExecute = A_advanceSearchExecute
    end
    object Archprj: TAction
      Tag = 20
      Category = 'File'
      Caption = #24037#31243#24402#26723
      OnExecute = ArchprjExecute
    end
    object newsubprj: TAction
      Tag = 30
      Category = 'File'
      Caption = 'newsubprj'
      OnExecute = newsubprjExecute
    end
    object Awtdesign: TAction
      Tag = 20
      Category = 'tool'
      Caption = #22996#25176#35774#35745
      OnExecute = AwtdesignExecute
    end
    object Asetmat: TAction
      Category = 'tool'
      Caption = #26448#26009#23383#20856#32500#25252'...'
      OnExecute = AsetmatExecute
    end
    object DisusePrj: TAction
      Category = 'File'
      Caption = #20316#24223#24037#31243
      OnExecute = DisusePrjExecute
    end
    object Newky: TAction
      Category = 'File'
      Caption = #25216#25913#39033#30446
      OnExecute = NewkyExecute
    end
    object Apubsoft: TAction
      Category = 'tool'
      Caption = 'Apubsoft'
    end
    object DesignMod: TAction
      Caption = 'DesignMod'
      OnExecute = DesignModExecute
    end
    object newld: TAction
      Tag = 1
      Category = 'File'
      Caption = 'newld'
      OnExecute = newldExecute
    end
    object newpfm: TAction
      Tag = 1
      Category = 'File'
      Caption = #24179#26041#31859#25910#36153#24037#31243'...'
      OnExecute = newpfmExecute
    end
    object newmg: TAction
      Tag = 1
      Category = 'File'
      Caption = #25353#23454#25910#36153#20303#23429#37197#22871#24037#31243'...'
      OnExecute = newmgExecute
    end
    object NewDesginPrj: TAction
      Category = 'File'
      Caption = #26032#24314#35774#35745#20219#21153
      OnExecute = NewDesginPrjExecute
    end
  end
  object Tm_System: TTimer
    OnTimer = Tm_SystemTimer
    Left = 419
    Top = 206
  end
  object Imglst_Tools: TImageList
    Height = 32
    ShareImages = True
    Width = 32
    Left = 539
    Top = 144
    Bitmap = {
      494C01010B000E00840020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000008000000060000000010020000000000000C0
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
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008484000084840000000000000000000000
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
      000000000000000000000000000000000000848484008484840084848400C6C6
      C600FFFFFF0084848400FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000084840000FFFF00C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7FFFF00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00000000000000000000000000000000000000
      00000000000000000000848484008484840084848400C6C6C600FFFFFF008484
      8400FFFFFF0000FFFF0084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000084840000FFFF0000FFFF0000FFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7FFFF00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00CECECE00000000000000000000000000000000000000
      0000848484008484840084848400C6C6C600FFFFFF0084848400FFFFFF0000FF
      FF00848484008484840084848400FFFFFF00C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF0000FFFF0000848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7FFFF00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00CECECE00000000000000000000000000000000000000
      000084848400C6C6C600FFFFFF0084848400FFFFFF00FFFFFF0084848400FFFF
      FF0084848400FFFFFF00FFFFFF00FFFFFF008484840084848400848484008484
      8400008484008484840000848400848484000084840084848400008484008484
      8400008484008484840000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF0000FFFF0000848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7FFFF00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00CECECE00000000000000000000000000000000000000
      00000000000084848400FFFFFF00848484008484840000FFFF00848484008484
      84008484840000FFFF008484840084848400FFFFFF0000FFFF00C6C6C6008484
      8400C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7FFFF00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00CECECE00CECE
      CE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00CECECE00000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400848484008484
      840084848400C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000084840000FFFF0000848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7FFFF00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00CECECE00000000000000000000000000008484000000
      000084848400FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF0000FFFF00FFFFFF00C6C6C6008484840084848400FFFFFF0000FFFF00C6C6
      C6008484840000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF0000FFFF0000848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7FFFF00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00DEDEDE00CECECE00CECECE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00CECECE00000000000000000000848400008484008484
      8400FFFFFF0000FFFF00FFFFFF00FFFFFF00848484008484840084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400848484008484
      840000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF0000FFFF0000848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7FFFF00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00CECECE000000000000848400008484000084840000FF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C600FFFFFF00FFFFFF008484
      840084848400FFFFFF0000FFFF008484840084848400FFFFFF00FFFFFF008484
      8400C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7FFFF00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00CECECE00000000000084840000848400008400000084
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C600FFFFFF00FFFF
      FF00FFFFFF008484840084848400FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFF
      FF0084848400C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000084840000FFFF0000848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7FFFF00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE009C3131009C3131009C31
      31009C313100DEDEDE00CECECE00000000000084840000840000008400000084
      0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0084848400FFFFFF00FFFF
      FF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000FFFF00848484008400840084008400C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF0000FFFF0000848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7FFFF00DEDEDE00CECE
      CE00CECECE00DEDEDE00CECECE00CECECE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00CE636300CE636300CE63
      63009C313100DEDEDE00CECECE00000000000084000000840000008400000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00848484008484
      8400FFFFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084008400840084008400840084008400C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF0000FFFF0000848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7FFFF00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00CE636300CE636300CE63
      63009C313100DEDEDE00CECECE00000000000084000000840000008400000084
      00000084000000FFFF0084848400848484008484840084848400848484008484
      84008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840084008400840084008400840084008400840084008400C6C6C60000FF
      FF00C6C6C60000FFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF0000FFFF0000848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7FFFF00DEDEDE00CECE
      CE00CECECE00CECECE00DEDEDE00CECECE00CECECE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00CE636300CE636300CE63
      63009C313100DEDEDE00CECECE00000000000084000000840000008400000084
      0000008400000084000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C6008484840084848400FFFFFF0000FFFF00FFFFFF008400
      840084008400840084008400840084008400840084008400840000FFFF00C6C6
      C60000FFFF00C6C6C60000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF0000FFFF0000848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7FFFF00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00CECECE00000000000084000000840000008400000084
      00000084000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF0084848400FFFFFF00840084008400
      8400840084008400840084008400840084008400840000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF0000FFFF00C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00CECECE0052525200525252005252520052525200CECECE00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00000000000084000000840000008400000084
      000000000000C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF0084008400840084008400
      84008400840084008400840084008400840084008400C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000848400FFFFFF0000FFFF0000FFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A500CECECE00F7FFFF00CECECE00A5A5A500525252000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000000
      00000000000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00840084008400
      840084008400840084008400840084008400C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00C6C6C6000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A500CECECE00F7FFFF00CECECE00A5A5A500525252000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000000000000000
      000000000000C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF008400
      8400840084008400840084008400C6C6C60084008400C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00C6C6
      C600008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A500CECECE00F7FFFF00CECECE00A5A5A500525252000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000000000000000000000
      00000000000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF0084008400840084008400840084008400C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00C6C6C6000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A500CECECE00F7FFFF00CECECE00A5A5A500525252000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF008400840084008400C6C6C60084008400C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000848400008484000084840000848400008484000084840000FF
      FF0000FFFF000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A500CECECE00F7FFFF00CECECE00A5A5A500525252000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF008400840084008400C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF0084848400000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00C6C6C60000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A500CECECE00F7FFFF00CECECE00A5A5A500525252000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF008400840000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000848400000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF008400840000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF0084848400000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008C0000008C000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000848400000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00C6C6C6000084840000848400C6C6C60000FFFF0000FF
      FF0000FFFF0000FFFF0000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000063FF6300008C000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF0084848400000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000084840000FFFF0000FF
      FF0000FFFF00C6C6C60000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF310000FF310063FF6300008C0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000084840000FFFF0000FF
      FF0000FFFF000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000009C0000009C000000CE000000CE
      000000FF310000FF310063FF6300008C0000008C0000008C0000008C0000009C
      0000009C000000CE000000CE000000FF310000FF3100008C0000008C0000008C
      0000008C0000009C0000009C000000CE000000CE000000FF310000FF310063FF
      6300008C0000008C0000008C0000008C00000000000000000000000000000000
      00000000000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000FFFF00C6C6C6000000000000000000C6C6C60000FFFF0000FF
      FF00C6C6C6000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000009C0000009C000000CE000000CE
      000000FF310000FF310063FF6300008C0000008C0000008C0000008C0000009C
      0000009C0000009C000000CE000000CE000000CE0000008C0000008C0000008C
      0000008C0000009C0000009C000000CE000000CE000000FF310000FF310063FF
      6300008C0000008C0000008C0000008C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00848484000084
      8400848484000084840084848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00C6C6
      C600008484000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00C6C6C6008484
      8400848484000000000000000000000000000000000000000000000000000000
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
      0000000000008484840084848400848484008484840084848400848484000000
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
      00004A4A4A004A4A4A004A4A4A00293131000000000000000000000000000000
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
      0000000000000000000000000000525252005252520052525200525252000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A004A10520063186B00293131008C2194002931310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000181818002121210000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000525252005252520052525200CE9C9C00525252009C6363005252
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A004A4A4A0042084A006310
      6B007B21840084298C00394242008C2194002931310021212100212121000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002121
      2100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021212100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000525252009C6363009C636300CE9C9C0052525200CE9C9C009C63
      6300525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A10520063106B007B107B008410
      84008C188C0084218400394242009C42A5002931310021212100292929003131
      3100393939000000000000000000000000000000000000000000000000000000
      0000000000000000000018181800000000000063940063636300000000000000
      0000000000003939390000000000000000000000000000000000000000000000
      0000000000000000000018181800000000000000000000000000000000005252
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000525252009C6363009C63630052525200CE9C9C00CE9C
      9C009C6363005252520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A0052105A006B1873007B18840084108C00840884008408
      840084108C00841884003942420094319C002931310031313100393939004A4A
      4A00525252005A5A5A0063636B00000000000000000000000000000000000000
      0000000000000000000000000000181818004ABDFF004ABDFF004ABDFF000063
      9400000000000000000018181800000000000000000000000000000000000000
      0000000000003939390000000000003152004ABDFF00004A7300000000000000
      0000181818000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005252520052525200FFCECE00FFCECE00FFCE
      CE00CE9C9C009C63630052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A005A186B0073217B0084298C008C218C008C188C0084108C00840884008408
      840084108C0084188400394242008C299400293131004A4A4A00525252005A5A
      5A00636B6300737373007B7B7B00848484000000000000000000000000000000
      0000000000004A4A4A0000000000009494004ABDFF004ABDFF004ABDFF004ABD
      FF004ABDFF000031520000000000181818000000000000000000000000000000
      000039393900000000000000000021ADFF004ABDFF004ABDFF00006394000000
      0000212121000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000525252005252520052525200000000000000000000000000000000000000
      000000000000000000005252520052525200FFFFFF00FFFFFF00FFCECE00FFCE
      CE00FFCECE00CE9C9C009C636300525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A004A4A4A006B1873007B31
      84008C31940094299400942994008C188C008C108C0084088400840884008408
      840084108C0084188400394242008C219400293131005A5A5A00636363007373
      73007B7B7B008484840084848400000000000000000000000000000000000000
      00000000000000000000000000000094940021ADFF004ABDFF004ABDFF004ABD
      FF004ABDFF004ABDFF0000315200000000001818180000000000000000001818
      1800000000000000000021ADFF004ABDFF004ABDFF004ABDFF00181818000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005252
      5200CE9C9C00CE9C9C00FFCECE00525252005252520052525200525252005252
      52005252520052525200FFCECE00FFFFFF00FFCECE00FFFFFF0073737300FFCE
      CE00FFCECE00FFCECE00CE9C9C009C6363005252520000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A007321840084398C0094429C009442
      9C0094319C00942994008C2194008C188C008C108C0084108C00840884008408
      840084108C0084188400394242008C18940029313100737373007B7B7B008484
      8400848484000000000000000000000000000000000000000000000000000000
      00000000000021212100000000000000000000000000007373004ABDFF004ABD
      FF004ABDFF004ABDFF004ABDFF00003152000000000000000000000000000000
      00000031520021ADFF004ABDFF004ABDFF004ABDFF0000737300000000002121
      2100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848C8400CED6CE00CED6CE00CED6CE00CED6
      CE00CED6CE00CED6CE00CED6CE00CED6CE00CED6CE00CED6CE00CED6CE00CED6
      CE00CED6CE00CED6CE00CED6CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000525252009C63
      63009C636300CE9C9C00CE9C9C00FFCECE00FFCECE00FFCECE00FFFFFF00FFCE
      CE00FFFFFF00FFFFFF00FFFFFF00FFCECE00FFFFFF00FFCECE00FFFFFF007373
      7300FFCECE00FFCECE00FFCECE00CE9C9C009C63630052525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A007B298C008C429C009C4AA5009C4AA5009C42A5009C39
      9C0094319C00942994008C218C007B188400731073006B086B00730873008408
      840084108C0084188400394242008C2194002931310084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003939390000000000000000000000000021AD
      FF004ABDFF004ABDFF004ABDFF0021ADFF000000000000000000000000000073
      73004ABDFF004ABDFF004ABDFF004ABDFF0021ADFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848C8400FFFFFF00EFFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF009CFFFF00FFFFFF009CFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00EFFFFF00CED6CE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000525252009C6363009C63
      63009C6363009C636300CE9C9C00CE9C9C00FFCECE00FFCECE00FFCECE00FFFF
      FF00FFCECE00FFFFFF00FFFFFF00FFFFFF0073737300FFFFFF00FFCECE00FFFF
      FF0052525200FFCECE00FFCECE00FFCECE00CE9C9C009C636300525252000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A0084299400944AA500A55AAD009C5AAD0094529C008C4294008C3994009439
      9C00943194008C298C0073217B0052105A003908390031083100520852007B08
      7B008C108C0084188400394242008C2194002931310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021212100000000000000
      000021ADFF004ABDFF004ABDFF004ABDFF0000949400004A73004ABDFF004ABD
      FF004ABDFF004ABDFF004ABDFF0021ADFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848C8400FFFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00EFF7F700009C3100DEF7EF00CEFFFF00CEFFFF00CEFF
      FF00C6F7F700CEFFFF00CED6CE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000525252009C6363009C63
      63009C6363009C6363009C636300CE9C9C0052525200FFCECE00FFCECE007373
      7300FFFFFF00FFCECE0073737300FFFFFF00FFFFFF0073737300FFFFFF00FFCE
      CE00FFFFFF0073737300FFCECE00FFCECE00FFCECE00CE9C9C009C6363005252
      5200000000000000000000000000000000004A4A4A004A4A4A008C4AA5009C5A
      AD00A56BB500AD6BB500A563AD008C5294006B3973005A295A006B296B008439
      8C008431840063216300521852004A104A000094940042424200520852007B10
      7B008C108C0084188400394242008C2194003939390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000393939000000
      0000003152004ABDFF004ABDFF004ABDFF004ABDFF004ABDFF004ABDFF004ABD
      FF004ABDFF004ABDFF0021ADFF00003152000000000039393900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848C8400FFFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00EFFFFF00009C3100009C31009CFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CED6CE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000525252009C6363009C63
      63009C636300525252009C6363009C636300CE9C9C0052525200FFCECE00FFCE
      CE0073737300FFFFFF00FFCECE0073737300FFFFFF00FFFFFF0073737300FFFF
      FF00FFCECE00FFFFFF0052525200FFCECE00FFCECE00FFCECE00CE9C9C009C63
      6300525252000000000000000000000000004A525200B584C600B57BBD00B57B
      BD00B573BD00AD6BB500945294006B396B004A294A0039393900632963007B31
      7B005A215A003910390000393900842184004AFFFF0039FFFF008C188C008C18
      8C008C188C0084188400394242008C2194003939390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009494004ABDFF004ABDFF004ABDFF004ABDFF004ABDFF004ABD
      FF004ABDFF0021ADFF0000000000000000003939390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848C8400FFFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00009C3100009C3100009C3100009C3100009C3100EFFFFF00CEFF
      FF00CEFFFF00CEFFFF00CED6CE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000525252009C6363009C63
      63009C63630052525200525252009C6363009C636300CE9C9C0052525200FFCE
      CE00FFCECE0073737300FFFFFF00FFCECE0052525200FFFFFF00FFFFFF007373
      7300FFFFFF00FFCECE00FFFFFF0073737300FFCECE00FFCECE00FFCECE00CE9C
      9C009C6363005252520000000000000000007B7B7B00C69CCE00BD8CC600B57B
      BD00AD73BD00945A9C0063396B004A2952000094940000C6C6008C4294007331
      7B004A2152003939390000A5A5009C42A500C684C600BD7BBD00A54AA5009421
      94008C188C0084218400394242008C2194003939390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000003152004ABDFF004ABDFF004ABDFF004ABDFF004ABDFF004ABD
      FF00006394000000000000000000393939000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848C8400FFFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00EFFFFF00009C3100009C31009CFFFF006B9C00006B6B0000CEFF
      FF00CEFFFF00CEFFFF00CED6CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000052525200525252005252
      520052525200FFCECE00CE9C9C00525252009C6363009C636300CE9C9C005252
      5200FFCECE00FFCECE0073737300FFFFFF00FFCECE0073737300FFFFFF00FFFF
      FF0073737300FFFFFF00FFCECE00FFFFFF0073737300FFCECE00FFCECE00FFCE
      CE00CE9C9C005252520000000000000000007B7B7B00C69CCE00BD8CC600B57B
      BD00AD73BD007B52840052315A00008C8C0000D6D6009C52A500AD63AD008439
      8C005A5A5A0000E7E700B5B5B5009C42A500AD52AD00A54AA500943194008C18
      94008C188C008421840039424200942994003939390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000003152004ABDFF004ABDFF004ABDFF004ABDFF0021ADFF000000
      0000000000000000000000000000393939000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848C8400FFFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00EFFFFF00009C3100E7F7EF009CFFFF006B6B0000CEFF
      FF00CEFFFF00CEFFFF00CED6CE00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000073737300FFFF
      FF00FFFFFF00FFCECE00FFCECE00CE9C9C00525252009C6363009C636300CE9C
      9C0052525200FFCECE00FFCECE0073737300FFFFFF00FFCECE0052525200FFFF
      FF00FFFFFF0073737300FFFFFF00FFCECE00FFFFFF0073737300FFCECE00FFCE
      CE00FFCECE005252520000000000000000007B7B7B00C69CCE00BD8CC600B584
      C600B57BBD00845A8C00005A5A0000EFEF007B7B7B00A563B500AD5AAD008C42
      940000FFFF00C6C6C6009C399C009C42A50094399C008C2194008C188C008C18
      8C008C218C0084218C0039424200942994003939390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004ABDFF004ABDFF004ABDFF004ABDFF00003152000000
      00000000000000000000000000000000000000000000000000004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848C8400FFFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00C6F7EF006B6B0000CEFF
      FF00CEFFFF00CEFFFF00CED6CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007373
      7300FFFFFF00FFFFFF00FFCECE00FFCECE00CE9C9C00525252009C6363009C63
      6300CE9C9C0052525200FFCECE00FFCECE0073737300FFFFFF00FFCECE007373
      7300FFFFFF00FFFFFF0073737300FFFFFF00FFCECE00FFFFFF00FFFFFF00FFCE
      CE00FFCECE005252520000000000000000007B7B7B00C69CCE00BD8CC600B584
      C600B57BBD00A56BAD00007B7B0000FFFF008C52940094529C0073397B007339
      7B0000FFFF008C8C8C009C4AA500A54AA50094319C00942994008C2194008C21
      94008C21940084218C0039424200942994003939390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004ABDFF004ABDFF004ABDFF004ABDFF0021ADFF000063
      940021ADFF004ABDFF004ABDFF0000949400004A730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848C8400FFFFFF00CEFFFF00CEFFFF00CEFF
      FF006B6B0000CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CED6CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000073737300FFFFFF00FFFFFF00FFCECE00FFCECE00CE9C9C00525252009C63
      63009C636300CE9C9C00FFCECE00FFCECE00FFCECE00FFCECE00FFFFFF00FFCE
      CE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFCECE00FFFFFF00FFFF
      FF00737373000000000000000000000000007B7B7B00C6A5CE00BD94C600B584
      C600B57BBD00B584C6000884840000D6D6004A3152003921420042214200009C
      9C0000F7F7009C4AA500A552AD009C42A50094319C0094299400942194008C21
      9400942994008C298C0039424200942994003939390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A0000000000009494004ABDFF004ABDFF004ABDFF004ABDFF004ABD
      FF004ABDFF004ABDFF004ABDFF004ABDFF004ABDFF0000949400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848C8400FFFFFF00EFFFFF00CEFFFF00CEFF
      FF006B6B0000E7F7EF009CFFFF00009C31009CFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CED6CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000073737300FFFFFF00FFFFFF00FFCECE00FFCECE00CE9C9C005252
      52009C6363009C636300CE9C9C00CE9C9C00FFCECE00FFCECE00FFCECE00FFFF
      FF00FFCECE00FFFFFF00FFFFFF00FFFFFF00FFCECE00FFFFFF00737373007373
      7300000000000000000000000000000000007B7B7B00C6A5CE00BD94CE00B58C
      C600B584BD00C69CCE00A5A5A50008FFFF00006B6B00291829000073730000EF
      EF008C8C8C00A55AAD00A552AD009C429C0094319C0094319C00942994009429
      940094399C0094399C004A52520094319C003939390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000007373004ABDFF004ABDFF004ABDFF004ABDFF004ABD
      FF004ABDFF004ABDFF004ABDFF004ABDFF004ABDFF0021ADFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848C8400FFFFFF00FFFFFF00E7F7EF009CFF
      FF006B6B00006B9C0000FFFFFF00009C3100009C31009CFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CED6CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300FFFFFF00FFFFFF00FFCECE00FFCECE00CE9C
      9C00525252009C6363009C636300CE9C9C007373730073737300737373007373
      7300737373007373730073737300737373007373730073737300000000000000
      0000000000000000000000000000000000007B7B7B00C6A5D600BD94CE00BD8C
      C600B584C600CEA5D600D6B5DE006BB5B50029FFFF0000F7F70021FFFF0042FF
      FF00B57BBD00AD6BB500A552AD009C42A5009C399C0094399C009C399C00A552
      AD00B573BD00BD84C6007384840094319C003939390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000021ADFF004ABDFF004ABDFF004ABDFF000094
      9400003152000031520000315200004A73000094940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848C8400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00009C3100009C3100009C3100009C3100009C3100CEFFFF00CEFF
      FF00CEFFFF00EFFFFF00CED6CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000073737300FFFFFF00FFFFFF00FFCECE00FFCE
      CE00CE9C9C005252520073737300737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00C6A5D600BD94CE00BD8C
      C600B584C600C694CE00CEADD600DEBDDE00E7E7E70094FFFF00BDBDBD00C694
      CE00BD84BD00AD63B500A552A5009C4AA500A54AA500AD5AAD00BD7BBD00CEA5
      D600C6C6C600C6C6C6009429940094319C003939390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A0000000000003152004ABDFF004ABDFF004ABDFF000000
      0000000000000000000000000000000000000000000000000000181818000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848C8400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00009C3100009C31009CFFFF00DEF7EF009CFF
      FF00CED6CE00CED6CE00CED6CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073737300FFFFFF00FFFFFF00FFCE
      CE00FFCECE00CE9C9C0052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00C6A5D600BD94CE00BD94
      C600B58CC600BD84C600C694CE00CEADD600DEC6E700DEC6E700D6ADD600C68C
      C600B573B500A55AAD00A55AAD00AD6BB500BD84C600CEA5D600BDC6C600CECE
      CE00943194009429940094319C0094399C003939390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000018181800000000002121210000639400000000000000
      0000000000000000000021212100000000001818180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848C8400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00009C31009CFFFF00ADE7DE00CEFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073737300FFFFFF00FFFF
      FF00FFCECE00FFCECE00CE9C9C00525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00C6A5D600BD94CE00BD94
      C600BD8CC600B584C600B584C600B57BBD00AD73BD00AD73BD00AD6BB500AD6B
      B500AD6BB500B573BD00C68CC600D6ADD600BDC6C600CECECE009C399C009439
      9C0094319C0094319C009C399C009C39A5004A52520000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000181818000000000000000000000000000000
      0000000000000000000000000000181818000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848C8400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00BDF7EF00CEFFFF00CEFFFF00848C
      8400FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000073737300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00C6A5D600BD94CE00BD94
      CE00BD8CC600B58CC600B584C600B584BD00B57BBD00B57BBD00B57BBD00BD84
      C600C69CCE00D6B5DE00BDC6C600CECECE009C4AA5009C4AA5009C42A5009C39
      9C0094399C0094399C00A54AA500A552AD006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000009494004ABD
      FF004ABDFF0021ADFF0000000000000000004A4A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848C8400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7F7EF00CEFFFF00CEFFFF00CEFFFF00848C
      8400FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007373
      7300737373007373730073737300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00C6A5D600BD94CE00BD94
      CE00BD94C600BD8CC600B58CC600B584C600BD84C600BD94C600CEA5D600DEBD
      DE00BDC6C600CECECE00A55AAD00A552AD00A552AD009C4AA5009C42A5009C42
      A5009C39A5009C4AA500AD5AAD006B7373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021ADFF004ABDFF004ABD
      FF004ABDFF004ABDFF0021ADFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848C8400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFFFFF009CFFFF00EFFFFF00848C
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00C6A5D600BD9CCE00BD94
      CE00BD94CE00BD94CE00BD94CE00C69CCE00CEADD600DEC6E700BDC6C600CECE
      CE00AD6BB500AD6BB500A563B500A55AAD00A552AD00A552AD009C4AA5009C4A
      A500A54AAD00AD6BB500BD7BBD007B8484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000003152004ABDFF004ABDFF004ABD
      FF004ABDFF004ABDFF004ABDFF00004A73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848C8400848C8400848C8400848C8400848C
      8400848C8400848C8400848C8400848C8400848C8400848C8400848C8400848C
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00C6A5D600BD9CCE00BD94
      CE00BD9CCE00C6A5D600D6B5DE00DECEE700BDC6C600CECECE00B57BBD00B57B
      BD00BD84C600C694CE00C694CE00B57BBD00AD6BB500A55AAD00A55AAD00AD6B
      B500BD84C600CEA5D600A5A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000003152004ABDFF004ABDFF004ABD
      FF004ABDFF004ABDFF004ABDFF00004A73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00C6A5D600C6A5D600C6AD
      D600D6BDDE00DECEE700BDC6C600CECECE00BD8CC600BD8CC600BD94CE00CEA5
      D600DEBDDE00C6C6C600D6D6D600E7CEE700D6B5DE00CEA5D600CEA5D600D6B5
      DE00C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004ABDFF004ABDFF004ABD
      FF004ABDFF004ABDFF004ABDFF00004A73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00CEB5DE00D6BDDE00E7CE
      E700BDC6C600CECECE00BD94CE00BD94CE00C69CCE00CEB5DE00DEC6E700BDC6
      C600CECECE000000000000000000EFEFEF00E7EFEF00E7E7E700E7E7E700D6DE
      DE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001818180000000000006394004ABDFF004ABD
      FF004ABDFF004ABDFF0021ADFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000949C9C00E7DEEF00C6C6C600CED6
      D600BD9CCE00C69CCE00C6A5D600D6B5DE00DECEE700BDC6C600CECECE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000063940021AD
      FF004ABDFF000063940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CED6D600DEE7E700636B6B00CEAD
      D600CEADD600D6BDDE00DECEE700BDC6C600CECECE0000000000000000000000
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
      00000000000000000000000000000000000000000000000000008C949400DED6
      E700E7D6EF00C6C6C600CECECE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000393939000000
      0000000000002121210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CED6D600C6C6
      C600DEDEDE000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000052525200525252005252
      5200525252005252520052525200525252005252520052525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004242420042424200424242004242
      4200313131000000000000000000000000000000000000000000000000000000
      0000000000000000000063CECE0063CECE000000000031313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000525252005252520052525200C6C6C600DEDEDE00DEDE
      DE00DEDEDE00F7FFFF00DEDEDE00F7FFFF00DEDEDE00C6C6C600525252005252
      5200525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005252520052525200C6C6C600C6C6C600C6C6C6009C9C
      9C00848484003131310031313100000000000000000000000000000000000000
      000063CECE0063CECE009CCEFF0063CECE000000000021212100636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005252520052525200C6C6C600C6C6C600C6C6C600DEDEDE00DEDEDE00DEDE
      DE00F7FFFF00F7FFFF00DEDEDE00F7FFFF00DEDEDE00C6C6C600C6C6C600C6C6
      C600848484008484840052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A00848484008484840084848400848484004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005252520052525200C6C6C600C6C6C6005252520052525200424242004242
      420031313100848484008484840031313100313131000000000063CECE0063CE
      CE009CFFFF009CCEFF0063CECE00000000000000000000000000636363009C9C
      9C00000000000000000000000000000000000000000000000000000000005252
      520073737300C6C6C600C6C6C600C6C6C600DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00F7FFFF00F7FFFF00DEDEDE00F7FFFF00DEDEDE00DEDEDE00C6C6C600C6C6
      C600C6C6C6008484840084848400525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A008484
      840094949400ADADAD009C9C9C009494940094949400848484004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005252
      5200C6C6C600C6C6C60073737300737373009C9C9C009C9C9C00525252009C9C
      9C009C9C9C0031313100313131008484840084848400313131009CFFFF009CCE
      FF009CCEFF009CCEFF0063CECE00000000004242420000000000636363006363
      63009C9C9C000000000000000000000000000000000000000000525252007373
      7300C6C6C600C6C6C600C6C6C600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00F7FFFF00F7FFFF00DEDEDE00F7FFFF00F7FFFF00DEDEDE00DEDEDE00C6C6
      C600C6C6C600C6C6C60084848400848484005252520000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A0084848400B5B5
      B500C6C6C600A5A5A5009C9C9C009C9C9C009C9C9C0094949400949494008484
      84004A4A4A004A4A4A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000073737300C6C6
      C6008484840084848400C6C6C600C6C6C600C6C6C600C6C6C60052525200C6C6
      C6009C9C9C009C9C9C009C9C9C00313131003131310084848400313131009CCE
      FF009CCEFF009CCEFF0063CECE0000000000FFFFFF0000000000212121006363
      6300737373009C9C9C0000000000000000000000000052525200737373007373
      7300C6C6C600C6C6C600DEDEDE00DEDEDE00DEDEDE0073737300737373007373
      7300737373007373730073737300525252005252520052525200DEDEDE00C6C6
      C600C6C6C600C6C6C600C6C6C600848484008484840052525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A0084848400B5B5B500DEDE
      DE0052525200ADADAD009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009494
      940094949400848484004A4A4A004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400DEDEDE00DEDEDE0073737300C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6009C9C9C009C9C9C0031313100319CCE0031313100313131009CFF
      FF009CCEFF009CCEFF0063CECE0000000000FFFFFF0073737300212121006363
      630063636300737373009C9C9C0000000000737373007373730073737300C6C6
      C600C6C6C600C6C6C600737373007373730073737300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00737373007373
      730073737300C6C6C600C6C6C600848484008484840084848400525252000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A0084848400B5B5B500DEDEDE005252
      5200C6C6C6009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009494940094949400848484004A4A4A004A4A4A00000000000000
      000000000000000000000000000000000000000000009C9C9C00CEFFFF00CEFF
      FF00F7FFFF00DEDEDE00DEDEDE0073737300C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60031313100319CCE00009C9C00319CCE0031639C003131
      31009CCEFF009CFFFF0063CECE0000000000FFFFFF0073737300000000006363
      63007373730073737300737373009C9C9C00737373007373730073737300C6C6
      C6007373730073737300FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00FFFF
      FF00FFFFFF007373730052525200C6C6C6008484840084848400525252000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A0084848400B5B5B500DEDEDE0052525200DEDE
      DE0052525200A5A5A500ADADAD009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009494940094949400848484004A4A4A004A4A
      4A0000000000000000000000000000000000000000009C9C9C00CEFFFF00CEFF
      FF00CEFFFF00F7FFFF00DEDEDE00DEDEDE00DEDEDE00C6C6C600C6C6C600C6C6
      C600319CCE00319CCE00319CCE00009C9C00319CCE000084840031639C003131
      31009CCEFF009CCEFF0063CECE0000000000FFFFFF0073737300000000006363
      6300737373009C9C9C009C9C9C00000000007373730073737300C6C6C6007373
      7300FFFFFF00F7FFFF00F7FFFF00F7FFFF005252520073737300737373007373
      7300737373007373730073737300737373007373730052525200F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00FFFFFF00737373008484840084848400525252000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A0084848400B5B5B500DEDEDE0052525200DEDEDE005252
      52006B6BFF0094949400ADADAD00ADADAD00ADADAD009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C0094949400949494008484
      84004A4A4A004A4A4A000000000000000000000000009C9C9C00737373007373
      730073737300FFFFFF00F7FFFF00F7FFFF00DEDEDE00DEDEDE00C6C6C6003163
      9C0031639C0031639C0000848400319CCE003131310031313100313131003131
      31009CFFFF0063CECE0000000000DEDEDE00FFFFFF0073737300000000006363
      6300A5A5A500000000000000000000000000737373007373730073737300FFFF
      FF00F7FFFF00F7FFFF007373730073737300FFFFCE00FFFFCE00FFFFCE00FFFF
      CE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00737373007373
      730052525200F7FFFF00F7FFFF00FFFFFF005252520084848400525252000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      00004A4A4A0084848400B5B5B500DEDEDE0052525200DEDEDE00525252006B6B
      FF006BFF6B00848484009494940094949400ADADAD00ADADAD00ADADAD009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009494
      940094949400848484004A4A4A0000000000000000009C9C9C00CEFFFF00CEFF
      FF00FFFFFF00CEFFFF00FFFFFF00F7FFFF00F7FFFF00DEDEDE00DEDEDE003131
      3100313131003131310031639C0031639C00008484000084840031639C003131
      31009CCEFF0063CECE0000000000DEDEDE00FFFFFF0073737300000000006363
      6300000000000000000000000000000000007373730073737300FFFFFF00F7FF
      FF00F7FFFF0073737300FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFF
      CE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFF
      CE00FFFFCE0052525200F7FFFF00F7FFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000004A4A
      4A0084848400B5B5B500DEDEDE0052525200DEDEDE0052525200C6C6C6006BFF
      6B0094949400C6C6C600CECECE00CECECE009494940094949400ADADAD00ADAD
      AD00ADADAD009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C00ADADAD00949494004A4A4A00000000009C9C9C00CEFFFF00CEFF
      FF00CEFFFF00FFFFFF00CEFFFF00FFFFFF00FFFFFF00F7FFFF0084848400C6C6
      C6007373730052525200313131003131310031639C0031639C0031639C003131
      31009CCEFF0063CECE0000000000DEDEDE00FFFFFF007373730063CECE000000
      00000000000000000000000000000000000073737300FFFFFF00F7FFFF00F7FF
      FF0073737300FFFF6300FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFF
      CE00FFFFCE00FFFFCE00FFFFCE00FFFFFF00FFFFFF00FFFFFF00FFFFCE00FFFF
      CE00FFFFCE00FFFFCE0052525200F7FFFF00F7FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C60000000000000000000000000000000000000000004A4A4A008484
      8400B5B5B500DEDEDE0052525200DEDEDE0052525200C6C6C600ADADAD009494
      9400C6C6C600CECECE009494940094949400CECECE00CECECE00949494009494
      9400ADADAD00ADADAD00ADADAD009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C00949494004A4A4A0000000000000000009C9C9C00CEFF
      FF00CEFFFF00CEFFFF00FFFFFF00CEFFFF00FFFFFF00FFFFFF00F7FFFF008484
      8400C6C6C6007373730052525200424242003131310031313100313131009CFF
      FF009CFFFF0063CECE0000000000DEDEDE00FFFFFF007373730063CECE000000
      00000000000000000000000000000000000073737300FFFFFF00F7FFFF007373
      7300C6C6C600FFFFCE00FFFF6300FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFF
      CE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFFFF00FFFF
      CE00FFFFCE00FFFF6300FFFFCE0000000000F7FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000004A4A4A0084848400B5B5
      B500DEDEDE0052525200DEDEDE0052525200C6C6C600ADADAD0094949400C6C6
      C600CECECE0094949400DEDEDE00DEDEDE009494940094949400CECECE00CECE
      CE009494940094949400ADADAD00ADADAD00ADADAD009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C00949494004A4A4A0000000000000000009C9C9C00CEFF
      FF00CEFFFF00CEFFFF0073737300FFFFFF00CEFFFF00FFFFFF00FFFFFF00F7FF
      FF0084848400C6C6C60073737300424242004242420042424200313131009CCE
      FF009CCEFF0063CECE0000000000DEDEDE00FFFFFF007373730063CECE000000
      00000000000000000000000000000000000073737300FFFFFF00F7FFFF007373
      7300FFCE9C00C6C6C600FFFFCE00FFFFCE00FFFFCE00FFCECE00FFFFCE00FFFF
      CE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFFFF00FFFF
      6300FFFF6300FFFFCE00DEDEDE0000000000F7FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000004A4A4A00ADADAD00DEDE
      DE0052525200DEDEDE0052525200C6C6C600ADADAD0094949400C6C6C600CECE
      CE0094949400DEDEDE00FFFFD600FFFFD600DEDEDE00DEDEDE00949494009494
      9400CECECE00CECECE009494940094949400ADADAD00ADADAD00ADADAD009C9C
      9C009C9C9C009C9C9C00949494004A4A4A000000000000000000000000009C9C
      9C00CEFFFF0073737300CEFFFF00CEFFFF00FFFFFF00CEFFFF00FFFFFF00FFFF
      FF00FFFFFF0084848400C6C6C600737373004242420042424200313131009CFF
      FF009CFFFF0063CECE0000000000DEDEDE00FFFFFF00737373009CCEFF0063CE
      CE000000000000000000000000000000000073737300FFFFFF00F7FFFF007373
      7300FFCE9C00C6C6C600C6C6C600FFFFCE00FFCECE00FFFFFF00FFCECE00FFFF
      6300FFFF6300FFFF6300FFFF6300FFFF6300FFFF6300FFFF6300FFFF6300FFFF
      CE00DEDEDE00DEDEDE00DEDEDE0000000000F7FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000004A4A4A00ADADAD005252
      5200DEDEDE0052525200C6C6C600ADADAD0094949400C6C6C600CECECE009494
      9400DEDEDE00BD7B0000FFFFD600FFFFD600FFFFD600FFFFD600DEDEDE00DEDE
      DE009494940094949400CECECE00CECECE009494940094949400ADADAD00ADAD
      AD00ADADAD009C9C9C00949494004A4A4A00000000000000000000000000009C
      9C009C9C9C009C9C9C00CEFFFF00CEFFFF00CEFFFF00FFFFFF0073737300CEFF
      FF00CEFFFF00FFFFFF0084848400FFFFFF008484840042424200313131009CCE
      FF0063CECE0000000000F7FFFF00DEDEDE00DEDEDE00FFFFFF007373730063CE
      CE000000000000000000000000000000000073737300FFFFFF00F7FFFF00FFFF
      FF0073737300FFCE9C00FFCE9C00C6C6C600C6C6C600FFCECE00FFFFCE00FFFF
      CE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00FFFFCE00C6C6
      C600A5A5A500FFCE9C0073737300F7FFFF00F7FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000004A4A4A00ADADAD00DEDE
      DE0052525200C6C6C600ADADAD0094949400C6C6C600CECECE0094949400C6C6
      C600DE940000DE940000BD7B0000BD7B0000FFFFD600FFFFD600FFFFD600C6C6
      C60031313100CECECE009494940094949400CECECE00CECECE00949494009494
      9400ADADAD00ADADAD00ADADAD004A4A4A00000000000000000000000000009C
      9C00FFFFFF009CFFFF009C9C9C009C9C9C00CEFFFF00CEFFFF0073737300CEFF
      FF00CEFFFF009C9C9C009C9C9C0084848400FFFFFF0073737300313131009CFF
      FF0063CECE0000000000DEDEDE00DEDEDE00DEDEDE00FFFFFF007373730063CE
      CE00000000000000000000000000000000000000000073737300F7FFFF00F7FF
      FF00FFFFFF00A5A5A50073737300FFCE9C00FFCE9C00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFCE
      9C00FFCE9C0073737300FFFFFF00F7FFFF00FFFFFF0073737300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000004A4A4A00ADADAD005252
      5200C6C6C600ADADAD0094949400C6C6C600CECECE0094949400DEDEDE003131
      310031313100BD7B0000DE940000DE940000BD7B0000BD7B0000C6C6C6003131
      3100FFFFD600FFFFD600CECECE00CECECE009494940094949400CECECE00CECE
      CE009494940094949400949494004A4A4A00000000000000000000000000009C
      9C00FFFFFF009CFFFF009CFFFF009CFFFF009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009CFFFF009CCEFF009CFFFF0084848400FFFFFF00737373009CFF
      FF00F7FFFF0000000000F7FFFF00DEDEDE00DEDEDE00FFFFFF00737373009CCE
      FF0063CECE00210000000000000000000000000000000000000084848400F7FF
      FF00F7FFFF00F7FFFF00A5A5A500A5A5A500A5A5A500FFCE9C00FFCE9C00FFCE
      9C00FFCE9C00FFCE9C00FFCE9C00FFCE9C00FFCE9C00FFCE9C00FFCE9C00A5A5
      A500A5A5A500FFFFFF00F7FFFF00F7FFFF007373730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000004A4A4A00ADADAD00C6C6
      C600ADADAD0094949400C6C6C600CECECE0094949400ADADAD00ADADAD00ADAD
      AD00C6C6C6003131310031313100BD7B0000DE940000DE940000C6C6C6003131
      3100C6C6C600FFFFD600FFFFD600FFFFD600BD7B0000DE94000094949400ADAD
      AD00CECECE00C6C6C600949494004A4A4A00000000000000000000000000009C
      9C00FFFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CCEFF00848484009CFFFF009CCE
      FF00009C9C00F7FFFF00DEDEDE00F7FFFF00DEDEDE00FFFFFF00737373009CCE
      FF0063CECE000000000000000000000000000000000000000000000000008484
      8400FFFFFF00F7FFFF00F7FFFF00F7FFFF00FFFFFF00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500FFFF
      FF00F7FFFF00F7FFFF00FFFFFF00737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000004A4A4A00ADADAD00ADAD
      AD0094949400C6C6C600CECECE0094949400ADADAD00DEDEDE0031313100C6C6
      C600FFE7B500FFF7D600FFE7B5003131310031313100C6C6C60031313100C6C6
      C60031313100C6C6C600FFFFD600BD7B0000DE940000C6C6C600313131004A4A
      4A00CECECE00C6C6C6004A4A4A00000000000000000000000000009C9C00F7FF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CCEFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CCEFF00F7FFFF00F7FFFF00009C9C00009C9C00F7FF
      FF00F7FFFF00DEDEDE00F7FFFF00DEDEDE00F7FFFF00FFFFFF00737373009CCE
      FF0063CECE000000000000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00FFFFFF0073737300737373009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000004A4A4A00ADADAD009494
      9400C6C6C600CECECE0094949400C6C6C600DEDEDE0031313100C6C6C600FFE7
      B500FFF7D600FFE7B500FFF7D600FFE7B500C6C6C60031313100FFF7D600FFF7
      D600C6C6C60031313100BD7B0000DE940000C6C6C60031313100FFF7D600C6C6
      C6004A4A4A004A4A4A0000000000000000000000000000000000009C9C00F7FF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CCE
      FF009CFFFF00F7FFFF00F7FFFF00009C9C00009C9C00F7FFFF00F7FFFF00F7FF
      FF00DEDEDE00F7FFFF00DEDEDE00F7FFFF00DEDEDE00FFFFFF00737373009CCE
      FF0063CECE000000000000000000000000000000000000000000000000000000
      00000000000000000000848484008484840084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007373
      730073737300C6C6C600C6C6C600C6C6C6009C9C9C0052000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000004A4A4A0094949400B5B5
      B500CECECE00C6C6C6004A4A4A00ADADAD0031313100C6C6C600FFE7B500FFF7
      D600FFE7B500FFF7D600FFE7B500C6C6C6004A4A4A00C6C6C600FFF7D600FFF7
      D600FFF7D60031313100BD7B0000C6C6C60031313100FFF7D600FFF7D600C6C6
      C6004A4A4A000000000000000000000000000000000000000000009C9C00F7FF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF00F7FF
      FF00F7FFFF00009C9C00009C9C00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00FFFFFF00FFFFFF00737373009CFF
      FF009CCEFF0063CECE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400737373007373730073737300737373007373
      7300FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C60052000000520000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C60000000000000000000000000000000000000000004A4A4A009C9C
      9C00B5B5B5004A4A4A00DE94000031313100BD7B0000BD7B0000FFF7D600FFE7
      B500FFF7D600FFE7B500FFF7D6004A4A4A00DE940000BD7B0000BD7B0000FFF7
      D600FFF7D600FFF7D6003131310031313100FFF7D600FFF7D600FFF7D600C6C6
      C6004A4A4A000000000000000000000000000000000000000000009C9C00F7FF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF00F7FFFF00F7FFFF00009C
      9C00009C9C00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00FFFFFF00FFFFFF0073737300737373009CFFFF009CCE
      FF009CFFFF0063CECE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007300
      0000C6C6C600FFFFFF00FFFFFF00C6C6C60000000000FF9C3100520000005200
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A004A4A4A00BD7B000031313100BD7B0000DE940000BD7B0000BD7B
      0000FFE7B500FFF7D600FFE7B5004A4A4A00BD7B0000DE940000DE940000BD7B
      0000BD7B0000FFF7D600FFF7D600FFF7D600FFF7D600FFF7D600C6C6C6004A4A
      4A000000000000000000000000000000000000000000009C9C00F7FFFF009CFF
      FF009CFFFF009CFFFF009CFFFF00F7FFFF00F7FFFF00009C9C00009C9C00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00FFFFFF00FFFFFF0073737300737373009CFFFF009CFFFF009CCEFF009CCE
      FF009CCEFF0063CECE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000073000000730000000000000000000000FF9C3100FF9C3100FF9C31005200
      0000520000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A00BD7B0000BD7B000031313100DE940000DE940000DE94
      0000BD7B0000FFE7B500FFF7D600C6C6C6004A4A4A004A4A4A00BD7B0000DE94
      0000DE940000BD7B0000BD7B0000FFF7D600FFF7D600C6C6C6004A4A4A000000
      00000000000000000000000000000000000000000000009C9C00F7FFFF009CFF
      FF009CFFFF00F7FFFF00F7FFFF00009C9C00009C9C00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00FFFFFF00FFFF
      FF0073737300737373009CFFFF009CFFFF009CFFFF009CCEFF009CFFFF009CFF
      FF009CCEFF0063CECE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000073000000FF9C3100FFFF0000FF9C3100FF9C3100FF9C3100FF9C
      3100520000005200000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A0031313100BD7B0000DE94
      0000DE940000BD7B0000BD7B0000E7E7E700C6C6C6004A4A4A004A4A4A004A4A
      4A00BD7B0000DE940000DE940000DE940000DE9400004A4A4A00313131000000
      00000000000000000000000000000000000000000000009C9C00F7FFFF00F7FF
      FF00F7FFFF00009C9C00009C9C00FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00FFFFFF00FFFFFF00737373007373
      73009CFFFF009CFFFF009CFFFF009CCEFF009CFFFF009CFFFF009CCEFF009CCE
      FF0063CECE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073000000FF9C3100FFFF0000FF9C3100FF9C3100FF9C
      3100FF9C31005200000052000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFFFF00C6C6C6008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00313131003131
      3100BD7B0000DE940000DE940000BD7B0000BD7B000031313100DEDEDE00C6C6
      C6004A4A4A004A4A4A00DE940000DE9400004A4A4A00BD7B0000313131000000
      000000000000000000000000000000000000009C9C00F7FFFF00F7FFFF00009C
      9C00009C9C000000000073737300FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00FFFFFF00FFFFFF0073737300737373009CFFFF009CFF
      FF00FFFFFF00FFFFFF009CFFFF009CFFFF009CCEFF009CFFFF009CFFFF009CCE
      FF0063CECE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000073000000FF9C3100FFFF0000FF9C3100FF9C
      3100FF9C3100FF9C310052000000520000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A003131310031313100BD7B0000BD7B000031313100C6C6C600DEDEDE00DEDE
      DE00DEDEDE00C6C6C6004A4A4A004A4A4A00BD7B000031313100000000000000
      000000000000000000000000000000000000009C9C00009C9C00009C9C000000
      0000000000000000000073737300FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00FFFFFF00FFFFFF0073737300737373009CFFFF009CFFFF00FFFFFF00FFFF
      FF00009C9C00009C9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073000000FF9C3100FFFF0000FF9C
      3100FF9C3100FF9C3100FF9C3100520000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A00ADADAD003131310031313100DE94000031313100C6C6C600DEDE
      DE00DEDEDE00BD7B0000DE940000BD7B00003131310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300FFFFFF00F7FFFF00F7FFFF00FFFFFF00FFFF
      FF0073737300737373009CFFFF009CFFFF00FFFFFF00FFFFFF00009C9C00009C
      9C000000000000000000009C9C00009C9C00009C9C00009C9C00009C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073000000FF9C3100FFFF
      0000FF9C3100FF9C3100FF9C3100520000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A00DE940000DE940000BD7B0000BD7B000031313100C6C6
      C600BD7B0000DE940000BD7B0000313131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300FFFFFF00FFFFFF00FFFFFF00737373007373
      73009CFFFF009CFFFF00FFFFFF00FFFFFF00009C9C00009C9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000073000000FF9C
      3100FFFF0000FF9C310073000000520000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A00BD7B0000BD7B00004A4A4A004A4A4A00000000003131
      3100BD7B0000BD7B000031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300FFFFFF00737373007373730000000000009C
      9C00FFFFFF00FFFFFF00009C9C00009C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007300
      0000730000007300000073000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A000000000000000000000000000000
      0000313131003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007373730073737300000000000000000000000000009C
      9C00009C9C00009C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000600000000100010000000000000600000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFFFFFE7FFF00000000
      FFFFFFFFFFC4FFFFFFFC3FFF0000000000000000FF00FFFFFFF81FFF00000000
      00000000FC003FFFFFF01FFF0000000000000000F0000000FFF01FFF00000000
      00000000F0000000FFF81FFF0000000000000000F8000000FFFC1FFF00000000
      00000000F8000000FFF81FFF0000000000000000D0000000FFF01FFF00000000
      0000000080000000FFF81FFF000000000000000000000000FFFC1FFF00000000
      0000000000000000FFF81FFF000000000000000000000000FFF01FFF00000000
      0000000000000000FFF01FFF000000000000000000000000FFF81FFF00000000
      0000000000000000FFF81FFF000000000000000000000000FFF81FFF00000000
      0000000000000000FFF00FFF000000000000000010000000FFE007FF00000000
      FFF00FFF30000000FFC003FF00000000FFF00FFF70000000FF8001FF00000000
      FFF00FFFF0000000FF8001FF00000000FFF00FFFF0000000FF0000FF00000000
      FFF00FFFF0000000FF0000FF00000000FFF81FFFF0000000FF0000FF00000000
      FFFC3FFFF0000000FF0000FF00000000FFFC3FFFF0000000FF0180FF00000000
      00000000F0000000FF8181FF0000000000000000F0000000FF8001FF00000000
      00000000F8000000FFC003FF0000000000000000FFFFF801FFE007FF00000000
      FFFFFFFFFFFFFC03FFF81FFF00000000FFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFF
      FFFFFFFFFFFE1FFFFFFFC07FFE7FFFFFFFFFFFFFFFF80FFFFFFF001FFE0FFE3F
      FFFFFFFFFFF807FFFFFC0007FC03FC0FFFFFFFFFFFFC03FFFFF00001FC01F807
      FFFFFFFFFFFE01FFFFC00000F800F007FFFFFFFFF1FC00FFFF000001F800600F
      FE0000FFE000007FFC000007F800000FFE0000FFC000003FF000001FFE00001F
      FE0000FF8000001FC000007FFF80003FFE0000FF8000000F0000007FFFC0003F
      FE0000FF800000070000007FFFE0007FFE0000FF800000030000007FFFF000FF
      FE0000FF800000030000007FFFF000FFFE0000FFC00000030000007FFFF0001F
      FE0000FFE00000030000007FFFF0000FFE0000FFF00000070000007FFFF0000F
      FE0000FFF800000F0000007FFFF8000FFE0000FFFC00003F0000007FFFF8001F
      FE0000FFFE00FFFF0000007FFFF8001FFE0000FFFF01FFFF0000007FFFFC013F
      FE0000FFFF80FFFF0000007FFFFE00FFFE0001FFFFC0FFFF0000007FFFFF007F
      FE0003FFFFE1FFFF000000FFFFFE007FFE0007FFFFFFFFFF000000FFFFFE007F
      FE000FFFFFFFFFFF000001FFFFFE007FFFFFFFFFFFFFFFFF000003FFFFFE007F
      FFFFFFFFFFFFFFFF00060FFFFFFE007FFFFFFFFFFFFFFFFF001FFFFFFFFF00FF
      FFFFFFFFFFFFFFFF007FFFFFFFFF81FFFFFFFFFFFFFFFFFFC1FFFFFFFFFFC3FF
      FFFFFFFFFFFFFFFFC7FFFFFFFFFFFFFFF0000003FFFFFFFFFFFFFC7FFF803FFF
      F0000003FFFFFFFFFF07F03FFC0007FFF0000003FFF0FFFFFC01C01FF00001FF
      F0000003FFE03FFFF000000FE00000FFF0000003FFC00FFFE0000007C000007F
      F0000003FF8003FFC00000038000003FF0000003FF0000FFC00000010000001F
      F0000003FE00003F800000000000001FF0000003FC00000F800000010000001F
      F0000003F8000003800000070000001FF0000003F00000018000000F0000001F
      F0000003E00000008000000F0000001FF0000003C0000000C000000F0000001F
      F000000380000000C000000F0000001FF000000380000000E00000070000001F
      F000000380000000E00000070000001FF000000380000000E00000078000003F
      F000000380000000E0000003C000007FF000000380000000E0000003E00000FF
      F000000380000001C0000003F000007FF000000380000003C0000003FC00003F
      F000000380000007C0000001FF80001FF0000003C0000007C0000001FFFFE00F
      F0000003E000000F80000001FFFFF007F0000003F800001F80000001FFFFF803
      F0000003FC00001F80000003FFFFFC01F0000007FF80001F04000003FFFFFE00
      F000000FFFE0003F1C000007FFFFFF00F000001FFFF0007FFC000C1FFFFFFF80
      F000003FFFF800FFFC003FFFFFFFFFC0F000007FFFF821FFFC20FFFFFFFFFFE1
      F00000FFFFFCF3FFFCE3FFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object Imglst_Task: TImageList
    Left = 408
    Top = 112
    Bitmap = {
      494C010104000900840010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
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
      0000000000000000000000000000FF636300FF636300FF636300FF636300FF31
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF9C0000FF9C00000000000000000000FF636300FF63
      6300FF3131000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C0000FFCE630000000000FF630000FF313100FF313100FF31
      3100FF313100FF31310000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF9C0000FFCE0000FFCE0000FF9C0000FF63000000000000000000000000
      000063000000FF63000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF9C0000FFCE0000FF9C0000FF9C0000FF63000000000000000000000000
      0000000000006300000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF000000000000FFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF9C
      0000FFFF0000FFCE0000FF9C0000FF6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400FFFF0000FFFF0000FFFF0000FFFF00008484
      84008484840000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FF9C
      0000FFFF0000FFFF0000FFCE0000FF6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF630000FFCE0000FFFF0000FFFF0000FF9C00000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000094949400949494009494
      9400FFFF0000FFFF0000FFFF0000949494009494940094949400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF630000FFCE0000FF9C0000FFCE0000FF9C00000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF000000
      0000848484000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF630000FF9C0000FF9C0000FF9C0000FF636300FF9C00000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF313100CE630000FF630000FF9C0000FFCE0000FF636300FF9C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      000000000000000000000000000000000000FF313100FF313100FF313100FF31
      3100FF313100FF313100FF63000000000000FF636300FF636300000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF313100FF636300FF63
      6300FF6363000000000000000000FF636300FF63630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF313100FF63
      6300FF636300FF636300FF636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFE0FFF7FFFFF
      FFFFFCC7FE3F0000F87FF903FC1F7FFEFC7FF073F80F0000FC7FF07BF0070002
      F83FE0FFE0030002F01FE0FFFC1F0002E01F001FFC1F0002C017803FF81F07E2
      E01FC07FF01F1FF8F03FE0FF013F4000EC6FF1FF867F9001FCF7FBFFC1FFE407
      FCFFFFFFFFFFF91FFCFFFFFFFFFFFE7F00000000000000000000000000000000
      000000000000}
  end
  object Pmn_Task: TPopupMenu
    Left = 616
    Top = 128
    object pmnitem_send: TMenuItem
      Action = Asendprj
    end
    object newsubprj1: TMenuItem
      Action = newsubprj
      Caption = #26032#24314#23376#24037#31243'...'
    end
    object N25: TMenuItem
      Action = newyg
      Caption = #26032#24314#29992#25913'('#19994#25193')'#24037#31243'...'
    end
    object Pmnitem_Wtdesign: TMenuItem
      Action = Awtdesign
    end
    object N67: TMenuItem
      Caption = '-'
    end
    object Pmnitem_Hide: TMenuItem
      Caption = #38544#34255#29238#24037#31243
      OnClick = Pmnitem_HideClick
    end
    object Pmnitem_disuse: TMenuItem
      Action = DisusePrj
    end
    object Pmnitem_arc: TMenuItem
      Action = Archprj
    end
    object Pmnitem_pause: TMenuItem
      Action = Pause
    end
    object Pmnitem_react: TMenuItem
      Action = reactive
    end
    object N69: TMenuItem
      Caption = '-'
    end
    object Pmnitem_del: TMenuItem
      Action = delete
    end
    object Pmnitem_return: TMenuItem
      Action = return
    end
    object Pmnitem_cleardel: TMenuItem
      Action = clearrecycle
    end
  end
  object Imglst_Larg: TImageList
    Height = 32
    Width = 32
    Left = 552
    Top = 176
    Bitmap = {
      494C010105000900840020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000004000000001002000000000000080
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
      0000004242000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000042
      4200000000000021210000000000000000000000000000000000000000000000
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
      0000002121000000000000212100000000000000000000000000000000000000
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
      0000002121000000000000000000002121000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000004242000000
      0000002121000000000000212100000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000021
      2100000000000021210000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000002121000000
      0000002121000000000000000000000000000000000000000000000000000000
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
      00000000000000FFFF0000000000002121000021210000212100002121000000
      0000000000000021210000000000000000000021210000000000000000000021
      2100000000000000000000212100002121000021210000212100000000000021
      2100000000000000000000000000000000000000000000000000000000000000
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
      00000000000000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000002121000000
      0000004242000000000000000000000000000000000000000000000000000000
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
      00000000000000FFFF0000424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000212100000000000042
      4200004242000000000000000000000000000000000000000000000000000000
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
      00000000000000FFFF0000424200004242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000021210000000000004242000042
      4200000000000000000000000000000000000000000000000000000000000000
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
      00000000000000FFFF0000424200004242000042420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000002121000000000000000000000000000000
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
      00000000000000FFFF0000FFFF00004242000042420000424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000212100000000000000000000000000000000000000
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
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000042
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000021210000000000000000000000000000000000000000000000
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
      0000002121000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000021
      2100000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000002121000000
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
      0000000000000000000000000000000000000000000000212100000000000000
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
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000021210000212100002121000021210000212100002121000021
      2100002121000021210000212100002121000021210000212100002121000021
      2100002121000021210000212100002121000021210000212100002121000021
      21000021210000212100FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00004242000042420000424200004242000042420000424200004242000042
      4200004242000042420000424200004242000042420000424200004242000042
      4200004242000042420000424200004242000042420000424200004242000042
      4200004242000042420000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000212100FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00004242000042420000424200004242000042420000424200004242000042
      4200004242000042420000424200004242000042420000424200004242000042
      4200004242000042420000424200004242000042420000424200004242000042
      4200004242000042420000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00004242000042420000424200004242000042420000424200004242000042
      4200004242000042420000424200004242000042420000424200004242000042
      4200004242000042420000424200004242000042420000424200004242000042
      4200004242000042420000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000042420000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF00000042420000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000084840084C6FF0084C6FF0084C6FF0084C6FF0084C6FF0084C6FF0084C6
      FF0084C6FF0084C6FF0084C6FF0084C6FF0084C6FF0084C6FF0084C6FF0084C6
      FF0084C6FF0084C6FF0084C6FF0084C6FF0084C6FF0084C6FF0084C6FF0084C6
      FF0084C6FF000084840000212100FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00004242000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000042420000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF0000424200FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000042420000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000042420000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF00000042420000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000084840084FFFF0084FFFF0084C6FF0084FFFF0084FFFF0084C6FF0084FF
      FF0084FFFF0084C6FF0084C6FF0084FFFF0084C6FF0084C6FF0084FFFF0084FF
      FF0084C6FF0084FFFF0084C6FF0084FFFF0084C6FF0084FFFF0084C6FF0084C6
      FF0084C6FF000084840000212100FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00004242000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000042420000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF0000424200FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000042420000000000FFFFFF0000000000FFFFFF00FFFFFF000042
      4200FFFFFF0000FF00000084FF0000FF00000084FF0000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF00000042420000000000FFFFFF0000000000FFFFFF00FFFFFF000084
      8400FFFFFF0084FFFF0084C6FF0084FFFF0084C6FF0084FFFF0084FFFF0084C6
      FF0084C6FF0084FFFF0084FFFF0084C6FF0084FFFF0084FFFF0084C6FF0084C6
      FF0084FFFF0084C6FF0084FFFF0084C6FF0084C6FF0084C6FF0084FFFF0084C6
      FF0084C6FF000084840000212100FFFFFF0000000000FFFFFF00FFFFFF000042
      4200FFFFFF000000FF000084FF000000FF000084FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000042420000000000FFFFFF0000000000FFFFFF00FFFFFF000042
      4200FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000042420000000000FFFFFF0000000000FFFFFF00FFFFFF000042
      4200FFFFFF000084FF0000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF00000042420000000000FFFFFF0000000000FFFFFF00FFFFFF000084
      8400FFFFFF0084C6FF0084FFFF0084FFFF0084FFFF0084C6FF0084FFFF0084FF
      FF0084FFFF0084C6FF0084FFFF0084C6FF0084C6FF0084FFFF0084FFFF0084C6
      FF0084FFFF0084C6FF0084C6FF0084FFFF0084C6FF0084FFFF0084C6FF0084FF
      FF0084C6FF000084840000212100FFFFFF0000000000FFFFFF00FFFFFF000042
      4200FFFFFF000084FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000042420000000000FFFFFF0000000000FFFFFF00FFFFFF000042
      4200FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000042420000000000FFFFFF0000000000FFFFFF00FFFFFF000042
      4200FFFFFF0000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF00000042420000000000FFFFFF0000000000FFFFFF00FFFFFF000084
      8400FFFFFF0084FFFF0084FFFF0084FFFF0084FFFF0084FFFF0084FFFF0084C6
      FF0084FFFF0084FFFF0084C6FF0084FFFF0084FFFF0084C6FF0084C6FF0084FF
      FF0084C6FF0084FFFF0084FFFF0084C6FF0084FFFF0084C6FF0084C6FF0084C6
      FF0084C6FF000084840000212100FFFFFF0000000000FFFFFF00FFFFFF000042
      4200FFFFFF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000042420000000000FFFFFF0000000000FFFFFF00FFFFFF000042
      4200FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000042420000000000FFFFFF0000000000FFFFFF00FFFFFF000042
      4200FFFFFF0000FF00000084FF0000FF00000084FF0000FF00000084FF0000FF
      000000FF00000084FF0000FFFF000084FF0000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF00000000000000000000FFFFFF0000000000FFFFFF00FFFFFF000084
      8400FFFFFF0084FFFF0084C6FF0084FFFF0084C6FF0084FFFF0084C6FF0084FF
      FF0084FFFF0084C6FF0084FFFF0084C6FF0084FFFF0084FFFF0084FFFF0084C6
      FF0084FFFF0084C6FF0084C6FF0084FFFF0084C6FF0084FFFF0084C6FF0084FF
      FF0084C6FF000021210000212100FFFFFF0000000000FFFFFF00FFFFFF000042
      4200FFFFFF000000FF000084FF000000FF000084FF000000FF000084FF000000
      FF000000FF000084FF0000FFFF000084FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF000042
      4200FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000FFFFFF0000000000FFFFFF0000424200FFFF
      FF0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00000084FF0000FF00000084FF0000FF000000FF00000084FF0000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF00000000000000000000FFFFFF0000000000FFFFFF0000848400FFFF
      FF0084FFFF0084FFFF0084FFFF0084C6FF0084FFFF0084FFFF0084FFFF0084FF
      FF0084C6FF0084FFFF0084C6FF0084FFFF0084FFFF0084C6FF0084C6FF0084FF
      FF0084C6FF0084FFFF0084FFFF0084C6FF0084FFFF0084C6FF0084FFFF0084C6
      FF0084C6FF000021210000212100FFFFFF0000000000FFFFFF0000424200FFFF
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000084FF000000FF000084FF000000FF000000FF000084FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000FFFFFF0000000000FFFFFF0000424200FFFF
      FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000FFFFFF0000000000FFFFFF0000424200FFFF
      FF0000FF000000FF000000FF000000FF00000084FF0000FF00000084FF0000FF
      000000FF000000FF000000FF000000FF00000084FF0000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000008484000000000000000000FFFFFF0000000000FFFFFF0000848400FFFF
      FF0084FFFF0084FFFF0084FFFF0084FFFF0084C6FF0084FFFF0084C6FF0084FF
      FF0084FFFF0084FFFF0084FFFF0084FFFF0084C6FF0084FFFF0084C6FF0084FF
      FF0084FFFF0084C6FF0084FFFF0084C6FF0084FFFF0084C6FF0084FFFF0084C6
      FF0042C6C6000021210000212100FFFFFF0000000000FFFFFF0000424200FFFF
      FF000000FF000000FF000000FF000000FF000084FF000000FF000084FF000000
      FF000000FF000000FF000000FF000000FF000084FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00008484000000000000000000FFFFFF0000000000FFFFFF0000424200FFFF
      FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000008484000000000000000000FFFFFF0000000000FFFFFF0000424200FFFF
      FF0000FF00000084FF0000FF000000FF000000FF000000FF000000FF000000FF
      00000084FF0000FF00000084FF0000FF000000FF00000084FF0000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000004242000000000000000000FFFFFF0000000000FFFFFF0000848400FFFF
      FF0084FFFF0084C6FF0084FFFF0084FFFF0084FFFF0084FFFF0084FFFF0084FF
      FF0084C6FF0084FFFF0084C6FF0084FFFF0084FFFF0084C6FF0084FFFF0084C6
      FF0084C6FF0084FFFF0084C6FF0084FFFF0084C6FF0084FFFF0084C6FF0084C6
      FF00008484000021210000212100FFFFFF0000000000FFFFFF0000424200FFFF
      FF000000FF000084FF000000FF000000FF000000FF000000FF000000FF000000
      FF000084FF000000FF000084FF000000FF000000FF000084FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00004242000000000000000000FFFFFF0000000000FFFFFF0000424200FFFF
      FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000004242000000000000000000FFFFFF0000000000FFFFFF0000424200FFFF
      FF0000FF000000FF000000FF000000FF00000084FF0000FF00000084FF0000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF00000084FF0000FF000000FF000000FF000000FF000000FF
      0000004242000000000000000000FFFFFF0000000000FFFFFF0000848400FFFF
      FF0084FFFF0084FFFF0084FFFF0084FFFF0084C6FF0084FFFF0084C6FF0084FF
      FF0084FFFF0084FFFF0084FFFF0084FFFF0084FFFF0084FFFF0084FFFF0084FF
      FF0084C6FF0084FFFF0084C6FF0084FFFF0084FFFF0084FFFF0084FFFF0084C6
      FF00008484000000000000212100FFFFFF0000000000FFFFFF0000424200FFFF
      FF000000FF000000FF000000FF000000FF000084FF000000FF000084FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000084FF000000FF000000FF000000FF000000FF000000
      FF00004242000000000000000000FFFFFF0000000000FFFFFF0000424200FFFF
      FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000004242000000000000000000FFFFFF000000000000424200FFFFFF0000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000084
      FF0000FF000000FF00000084FF0000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000084
      8400004242000063630000000000FFFFFF000000000000848400FFFFFF0084FF
      FF0084FFFF0084FFFF0084FFFF0084FFFF0084FFFF0084FFFF0084FFFF0084C6
      FF0084FFFF0084FFFF0084C6FF0084FFFF0084C6FF0084FFFF0084FFFF0084FF
      FF0084FFFF0084FFFF0084FFFF0084FFFF0084FFFF0084C6FF0084FFFF0042C6
      C6000084840084A5A50000000000FFFFFF000000000000424200FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000084
      FF000000FF000000FF000084FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000084
      8400004242000063630000000000FFFFFF000000000000424200FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000084
      8400004242000063630000000000FFFFFF000000000000424200FFFFFF0000FF
      000000FF000000FF00000084FF0000FF000000FF000000FF00000084FF0000FF
      000000FF00000084FF0000FF000000FF000000FF000000FF00000084FF0000FF
      000000FF000000FF000000FF000000FF00000084FF0000FF000000FF00000042
      420000636300FFFFFF0000636300000000000000000000848400FFFFFF0084FF
      FF0084FFFF0084FFFF0084C6FF0084FFFF0084FFFF0084FFFF0084C6FF0084FF
      FF0084FFFF0084C6FF0084FFFF0084FFFF0084FFFF0084FFFF0084C6FF0084FF
      FF0084C6FF0084FFFF0084FFFF0084FFFF0084C6FF0084FFFF0084FFFF000084
      840084A5A500FFFFFF0084A5A500000000000000000000424200FFFFFF000000
      FF000000FF000000FF000084FF000000FF000000FF000000FF000084FF000000
      FF000000FF000084FF000000FF000000FF000000FF000000FF000084FF000000
      FF000000FF000000FF000000FF000000FF000084FF000000FF000000FF000042
      420000636300FFFFFF0000636300000000000000000000424200FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000042
      420000636300FFFFFF0000636300000000000000000000424200FFFFFF0000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000042
      420000636300FFFFFF00FFFFFF00006363000000000000848400FFFFFF0084FF
      FF0084FFFF0084FFFF0084FFFF0084FFFF0084FFFF0084FFFF0084FFFF0084FF
      FF0084FFFF0084FFFF0084FFFF0084FFFF0084FFFF0084FFFF0084FFFF0084FF
      FF0084FFFF0084FFFF0084C6FF0084FFFF0084FFFF0084C6FF0084FFFF000084
      840084A5A500FFFFFF00FFFFFF0084A5A5000000000000424200FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000042
      420000636300FFFFFF00FFFFFF00006363000000000000424200FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000042
      420000636300FFFFFF00FFFFFF00006363000000000000424200FFFFFF0000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00000084FF0000FF000000FF00000084FF0000FF00000084FF0000FF00000084
      FF0000FF000000FF000000FF000000FF000000FF000000FF0000008484000042
      420000636300FFFFFF0000636300000000000000000000848400FFFFFF0084FF
      FF0084FFFF0084FFFF0084FFFF0084FFFF0084FFFF0084FFFF0084FFFF0084FF
      FF0084C6FF0084FFFF0084FFFF0084C6FF0084FFFF0084C6FF0084FFFF0084C6
      FF0084FFFF0084FFFF0084FFFF0084C6FF0084FFFF0084FFFF0042C6C6000084
      840084A5A500FFFFFF0084A5A500000000000000000000424200FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000084FF000000FF000000FF000084FF000000FF000084FF000000FF000084
      FF000000FF000000FF000000FF000000FF000000FF000000FF00008484000042
      420000636300FFFFFF0000636300000000000000000000424200FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000008484000042
      420000636300FFFFFF0000636300000000000000000000424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF0000004242000063
      6300FFFFFF000063630000000000FFFFFF000000000000848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084FFFF000084840084A5
      A500FFFFFF0084A5A50000000000FFFFFF000000000000424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF00004242000063
      6300FFFFFF000063630000000000FFFFFF000000000000424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000004242000063
      6300FFFFFF000063630000000000FFFFFF0000000000FFFFFF00004242000042
      4200004242000042420000424200004242000042420000424200004242000042
      4200004242000042420000424200004242000042420000424200004242000042
      420000424200004242000042420000424200004242000042420000636300FFFF
      FF00006363000000000000000000FFFFFF0000000000FFFFFF00008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      840000848400008484000084840000848400008484000084840084A5A500FFFF
      FF0084A5A5004242420000210000FFFFFF0000000000FFFFFF00004242000042
      4200004242000042420000424200004242000042420000424200004242000042
      4200004242000042420000424200004242000042420000424200004242000042
      420000424200004242000042420000424200004242000042420000636300FFFF
      FF00006363000000000000000000FFFFFF0000000000FFFFFF00004242000042
      4200004242000042420000424200004242000042420000424200004242000042
      4200004242000042420000424200004242000042420000424200004242000042
      420000424200004242000042420000424200004242000042420000636300FFFF
      FF00006363000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000021210000FFFF0000424200006363000063630000636300006363000000
      0000004242000063630000000000004242000063630000000000004242000063
      6300000000000042420000636300006363000063630000636300FFFFFF000063
      6300000000000021210000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000063630084FFFF008484840084A5A50084A5A50084A5A50084A5A5008421
      00008484840084A5A500842100008484840084A5A500842100008484840084A5
      A500842100008484840084A5A50084A5A50084A5A50084A5A500FFFFFF0084A5
      A500424242000063630000210000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000021210000FFFF0000424200006363000063630000636300006363000000
      0000004242000063630000000000004242000063630000000000004242000063
      6300000000000042420000636300006363000063630000636300FFFFFF000063
      6300000000000021210000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000021210000FFFF0000424200006363000063630000636300006363000000
      0000004242000063630000000000004242000063630000000000004242000063
      6300000000000042420000636300006363000063630000636300FFFFFF000063
      6300000000000021210000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000021210000FFFF000042420000424200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000424200FFFFFF000000000000424200FFFFFF00000000000042
      4200FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00006363000000
      0000008484000021210000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000063630084FFFF000084840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008421000084848400FFFFFF008421000084848400FFFFFF00842100008484
      8400FFFFFF0084210000FFFFFF00FFFFFF00FFFFFF00FFFFFF0084A5A5004242
      420042C6C6000063630000210000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000021210000FFFF000042420000424200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000424200FFFFFF000000000000424200FFFFFF00000000000042
      4200FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00006363000000
      0000008484000021210000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000021210000FFFF000042420000424200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000424200FFFFFF000000000000424200FFFFFF00000000000042
      4200FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00006363000000
      0000008484000021210000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000021210000FFFF00008484000042420000424200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000424200FFFFFF000000000000424200FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000636300000000000084
      8400008484000021210000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000063630084FFFF0000C6C6000084840084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008421000084848400FFFFFF008421000084848400FFFFFF008421
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084A5A5000021000042C6
      C60042C6C6000063630000210000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000021210000FFFF00008484000042420000424200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000424200FFFFFF000000000000424200FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000636300000000000084
      8400008484000021210000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000021210000FFFF00008484000042420000424200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000424200FFFFFF000000000000424200FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000636300000000000084
      8400008484000021210000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000021210000FFFF0000848400008484000042420000424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000424200FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000063630000000000008484000084
      84000021210000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000063630084FFFF0042C6C60042C6C6000084840084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008421000084848400FFFFFF0084210000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084A5A5004242420042C6C60042C6
      C6000063630000210000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000021210000FFFF0000848400008484000042420000424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000424200FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000063630000000000008484000084
      84000021210000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000021210000FFFF0000848400008484000042420000424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000424200FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000063630000000000008484000084
      84000021210000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000021210000FFFF000084840000848400008484000042420000424200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000424200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006363000000000000212100002121000021
      210000212100FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000063630084FFFF0042C6C60042C6C60042C6C6000084840084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008421000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084A5A5004242420000636300006363000063
      630000636300FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000021210000FFFF000084840000848400008484000042420000424200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000424200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006363000000000000212100002121000021
      210000212100FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000021210000FFFF000084840000848400008484000042420000424200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000424200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006363000000000000212100002121000021
      210000212100FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000021210000FFFF0000FFFF00008484000084840000848400004242000042
      4200FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000063630000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000063630084FFFF0084FFFF0042C6C60042C6C60042C6C600008484008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF0084210000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084A5A50042424200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000021210000FFFF0000FFFF00008484000084840000848400004242000042
      4200FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000063630000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000021210000FFFF0000FFFF00008484000084840000848400004242000042
      4200FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000063630000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000021210000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000084
      840000424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000063630000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000063630084FFFF0084FFFF0084FFFF0084FFFF0084FFFF0042C6
      C60084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084A5A50042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000021210000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000084
      840000424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000063630000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000021210000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000084
      840000424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000063630000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000212100002121000021210000212100002121000021
      21000021210000424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000063630000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000636300006363000063630000636300006363000063
      63000063630084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084A5A50042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000212100002121000021210000212100002121000021
      21000021210000424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000063630000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000212100002121000021210000212100002121000021
      21000021210000424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000063630000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000424200FFFFFF00FFFFFF00FFFFFF00FFFFFF000063
      630000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF0084A5
      A50042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000424200FFFFFF00FFFFFF00FFFFFF00FFFFFF000063
      630000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000424200FFFFFF00FFFFFF00FFFFFF00FFFFFF000063
      630000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000424200FFFFFF00FFFFFF00006363000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFFFF0084A5A5004242
      4200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000424200FFFFFF00FFFFFF00006363000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000424200FFFFFF00FFFFFF00006363000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00004242000063630000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084A5A50042424200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00004242000063630000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00004242000063630000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00424D3E000000000000003E000000
      2800000080000000400000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF000000000000000000000000
      FFFFFFFF000000000000000000000000F8000003000000000000000000000000
      F0000001000000000000000000000000F0000001000000000000000000000000
      F0000001000000000000000000000000E8000001000000000000000000000000
      E8000001000000000000000000000000E8000001000000000000000000000000
      E8000001000000000000000000000000D0000001000000000000000000000000
      D0000001000000000000000000000000D0000001000000000000000000000000
      D0000001000000000000000000000000A0000001000000000000000000000000
      A0000004000000000000000000000000A0000006000000000000000000000000
      A0000004000000000000000000000000BFFFFF89000000000000000000000000
      C0000011000000000000000000000000F0000021000000000000000000000000
      F0F24BC1000000000000000000000000F0792F81000000000000000000000000
      F03CBF03000000000000000000000000F01E7E07000000000000000000000000
      F00F7CFF000000000000000000000000F807F9FF000000000000000000000000
      FC03F3FF000000000000000000000000FFFDE7FF000000000000000000000000
      FFFECFFF000000000000000000000000FFFF1FFF000000000000000000000000
      FFFFBFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      8000000080000000800000008000000080000000800000008000000080000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000080000000800000008000000000000000000000000000000000000000
      000000000000}
  end
end
