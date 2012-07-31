object Frm_Dag_LinkNode: TFrm_Dag_LinkNode
  Left = 312
  Top = 235
  BorderStyle = bsDialog
  Caption = 'Frm_Dag_LinkNode'
  ClientHeight = 244
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 0
    Top = 185
    Width = 353
    Height = 2
    Align = alTop
  end
  object SpeedButton1: TSpeedButton
    Left = 256
    Top = 200
    Width = 81
    Height = 33
    Caption = #30830' '#23450
    Flat = True
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 160
    Top = 200
    Width = 81
    Height = 33
    Caption = #21462' '#28040
    Flat = True
    OnClick = SpeedButton2Click
  end
  inline LinkLineInfo: TFrame_LinkNode
    Left = 0
    Top = 0
    Width = 353
    Height = 185
    Align = alTop
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    inherited Pan_Interface: TPanel
      Width = 353
      Height = 185
      inherited Label1: TLabel
        Top = 28
        Width = 30
        Height = 15
      end
      inherited Label3: TLabel
        Top = 53
        Width = 30
        Height = 15
      end
      inherited Label2: TLabel
        Top = 84
        Width = 30
        Height = 15
      end
      inherited Bevel3: TBevel
        Left = 53
        Top = 91
      end
      inherited Edt_FromTaskName: TEdit
        Top = 23
      end
      inherited Edt_EndTaskName: TEdit
        Top = 50
      end
      inherited Memo_LinkTaskNodeInfo: TMemo
        Left = 12
        Top = 106
        Width = 325
        Height = 71
      end
    end
  end
end
