object frm_jffzr: Tfrm_jffzr
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #26045#24037#21512#21516#30002#26041#36127#36131#20154#21517#21333#32500#25252
  ClientHeight = 370
  ClientWidth = 285
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object RzSpacer1: TRzSpacer
    Left = 20
    Top = 205
    Width = 239
    Height = 8
    Grooved = True
  end
  object RzGroupBox1: TRzGroupBox
    Left = 0
    Top = 0
    Width = 267
    Height = 313
    Caption = #36127#36131#20154#21517#21333#32500#25252
    TabOrder = 7
  end
  object DBGrid1: TDBGrid
    Left = 21
    Top = 24
    Width = 217
    Height = 175
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Width = 134
        Visible = True
      end>
  end
  object cxDBTextEdit1: TcxDBTextEdit
    Left = 106
    Top = 224
    DataBinding.DataField = 'Name'
    DataBinding.DataSource = DataSource1
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -14
    Style.Font.Name = #23435#20307
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 1
    Width = 121
  end
  object cxLabel1: TcxLabel
    Left = 21
    Top = 225
    Caption = #36127#36131#20154#22995#21517':'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -14
    Style.Font.Name = #23435#20307
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object RzButton1: TRzButton
    Left = 101
    Top = 272
    Caption = #21024#38500
    TabOrder = 3
    OnClick = RzButton1Click
  end
  object RzButton2: TRzButton
    Left = 20
    Top = 272
    Caption = #26032#22686
    TabOrder = 4
    OnClick = RzButton2Click
  end
  object RzButton3: TRzButton
    Left = 182
    Top = 272
    Caption = #20445#23384
    TabOrder = 5
    OnClick = RzButton3Click
  end
  object RzButton4: TRzButton
    Left = 159
    Top = 335
    Width = 108
    Height = 26
    ModalResult = 1
    Caption = #20851#38381#24182#36820#22238
    TabOrder = 6
  end
  object ADOQuery1: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from JfFzr'
      '')
    Left = 64
    Top = 112
    object ADOQuery1ID: TAutoIncField
      DisplayLabel = #32534#21495
      FieldName = 'ID'
      ReadOnly = True
    end
    object ADOQuery1Name: TWideStringField
      DisplayLabel = #25351#23450#36127#36131#20154#22995#21517#13#10
      FieldName = 'Name'
      FixedChar = True
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 152
    Top = 104
  end
end
