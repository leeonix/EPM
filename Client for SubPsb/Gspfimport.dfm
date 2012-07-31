object frm_importGspf: Tfrm_importGspf
  Left = 0
  Top = 0
  Caption = #33829#38144#31867#39033#30446#21021#35774#19982#27010#31639#25209#22797#23548#20837
  ClientHeight = 535
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object rzpnl1: TRzPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 460
    Align = alClient
    BorderOuter = fsNone
    BorderSides = []
    Caption = #39033#30446#28165#21333
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitTop = -6
    object RzLabel5: TRzLabel
      Left = 800
      Top = 8
      Width = 182
      Height = 14
      Caption = #20197#19979#24037#31243#23457#20215#20449#24687#26410#33021#23548#20837#31995#32479
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 824
      Top = 28
      Width = 37
      Height = 16
      Caption = 'Label1'
    end
    object lbllable1: TLabel
      Left = 807
      Top = 62
      Width = 165
      Height = 17
      Caption = #20197#19979#24037#31243#36134#21495#26410#33021#23548#20837#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RzPanel1: TRzPanel
      Left = 0
      Top = 0
      Width = 1008
      Height = 57
      Align = alTop
      BorderOuter = fsNone
      TabOrder = 1
      ExplicitTop = 28
      object RzLabel2: TRzLabel
        Left = 344
        Top = 20
        Width = 64
        Height = 16
        Caption = #25209#25991#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel1: TRzLabel
        Left = 24
        Top = 20
        Width = 48
        Height = 16
        Caption = #25209#27425#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel3: TRzLabel
        Left = 414
        Top = 20
        Width = 4
        Height = 16
      end
      object RzLabel4: TRzLabel
        Left = 78
        Top = 20
        Width = 4
        Height = 16
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 57
      Width = 801
      Height = 403
      DataSource = DataSource1
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PRJACCOUNT'
          Width = 189
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRJNAME'
          Width = 246
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Sumfee'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Jzfee'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Azfee'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Sbfee'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Qtfee'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Ybfee'
          Visible = True
        end>
    end
    object RzListBox1: TRzListBox
      Left = 807
      Top = 85
      Width = 185
      Height = 375
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 2
    end
  end
  object rzpnl2: TRzPanel
    Left = 0
    Top = 460
    Width = 1008
    Height = 75
    Align = alBottom
    BorderSides = []
    TabOrder = 1
    object btn_import: TRzButton
      Left = 360
      Top = 32
      Width = 161
      Height = 33
      Caption = #23548#20837#21021#35774#25209#22797#28165#21333
      TabOrder = 0
      OnClick = btn_importClick
    end
    object RzButton1: TRzButton
      Left = 552
      Top = 32
      Height = 33
      Caption = #21024#38500
      TabOrder = 1
    end
    object RzButton2: TRzButton
      Left = 641
      Top = 32
      Width = 80
      Height = 33
      Caption = #36864#20986
      TabOrder = 2
      OnClick = RzButton2Click
    end
  end
  object ADOQuery1: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'mycode'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT PCName,PWName,Projectinfo. PRJACCOUNT,  PRJNAME, Sumfee,J' +
        'zfee, Azfee , Sbfee , Qtfee , Ybfee       '
      'from dbo.Gspw '
      'INNER JOIN dbo.ProjectPS ON dbo.Gspw.PSNo = dbo.ProjectPS.PSNo '
      
        'left JOIN dbo.PROJECTINFO ON  dbo.ProjectPS.Prjcode = dbo.PROJEC' +
        'TINFO.Prjcode'
      'WHERE dbo.Gspw.PSNo=:mycode')
    Left = 608
    Top = 120
    object ADOQuery1PCName: TWideStringField
      DisplayLabel = #27010#31639#23457#25209#25209#27425
      DisplayWidth = 28
      FieldName = 'PCName'
      Size = 50
    end
    object ADOQuery1PWName: TWideStringField
      DisplayLabel = #25209#25991#21495
      DisplayWidth = 27
      FieldName = 'PWName'
      Size = 50
    end
    object ADOQuery1PRJACCOUNT: TStringField
      DisplayLabel = #24037#31243#36134#21495
      DisplayWidth = 47
      FieldName = 'PRJACCOUNT'
      Size = 40
    end
    object ADOQuery1PRJNAME: TStringField
      DisplayLabel = #24037#31243#21517#31216
      DisplayWidth = 70
      FieldName = 'PRJNAME'
      Size = 60
    end
    object ADOQuery1Sumfee: TIntegerField
      DisplayLabel = #27010#31639#25209#22797#21512#35745
      DisplayWidth = 15
      FieldName = 'Sumfee'
    end
    object ADOQuery1Jzfee: TIntegerField
      DisplayLabel = #24314#31569#36153
      DisplayWidth = 12
      FieldName = 'Jzfee'
    end
    object ADOQuery1Azfee: TIntegerField
      DisplayLabel = #23433#35013#36153
      DisplayWidth = 12
      FieldName = 'Azfee'
    end
    object ADOQuery1Sbfee: TIntegerField
      DisplayLabel = #35774#22791#36153
      DisplayWidth = 12
      FieldName = 'Sbfee'
    end
    object ADOQuery1Qtfee: TIntegerField
      DisplayLabel = #20854#20182#36153
      DisplayWidth = 12
      FieldName = 'Qtfee'
    end
    object ADOQuery1Ybfee: TIntegerField
      DisplayLabel = #39044#22791#36153
      DisplayWidth = 12
      FieldName = 'Ybfee'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 536
    Top = 120
  end
  object OpenDialog1: TOpenDialog
    Left = 680
    Top = 120
  end
end
