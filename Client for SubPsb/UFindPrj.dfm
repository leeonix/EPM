object frm_findprj: Tfrm_findprj
  Left = 291
  Top = 164
  BorderStyle = bsDialog
  Caption = 'Easy Project'
  ClientHeight = 391
  ClientWidth = 557
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 75
    Height = 15
    Caption = #24037#31243#24080#21495#65306
  end
  object Label2: TLabel
    Left = 24
    Top = 52
    Width = 75
    Height = 15
    Caption = #24037#31243#21517#31216#65306
  end
  object RzDialogButtons1: TRzDialogButtons
    Left = 0
    Top = 355
    Width = 557
    CaptionOk = #30830#23450
    CaptionCancel = #21462#28040
    CaptionHelp = '&Help'
    ShowGlyphs = True
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 104
    Top = 12
    Width = 289
    Height = 23
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 104
    Top = 48
    Width = 289
    Height = 23
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 88
    Width = 557
    Height = 267
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 557
      Height = 267
      Align = alClient
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'prjaccount'
          Title.Caption = #24037#31243#24080#21495
          Width = 133
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'prjname'
          Title.Caption = #24037#31243#21517#31216
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'prjadd'
          Title.Caption = #24037#31243#22320#22336
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lxr'
          Title.Caption = #32852#31995#20154
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lxdh'
          Title.Caption = #32852#31995#30005#35805
          Width = 200
          Visible = True
        end>
    end
  end
  object Button1: TButton
    Left = 424
    Top = 48
    Width = 75
    Height = 25
    Caption = #26597#25214
    TabOrder = 4
    OnClick = Button1Click
  end
  object qry_find: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select prjcode,prjaccount,prjname,prjadd,lxr,lxdh'
      'from projectinfo '
      'where corpcode='#39'2'#39'  ')
    Left = 400
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = qry_find
    Left = 440
    Top = 144
  end
end
