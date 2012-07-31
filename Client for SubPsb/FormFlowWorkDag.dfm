object Frm_Dag_FlowWork: TFrm_Dag_FlowWork
  Left = 258
  Top = 149
  BorderStyle = bsDialog
  Caption = 'Frm_Dag_FlowWork'
  ClientHeight = 330
  ClientWidth = 464
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
    Top = 273
    Width = 464
    Height = 2
    Align = alTop
  end
  object SBtn_OK: TSpeedButton
    Left = 368
    Top = 288
    Width = 81
    Height = 33
    Caption = #30830'  '#23450'(&O)'
    Flat = True
    OnClick = SBtn_OKClick
  end
  object SBtn_Cancel: TSpeedButton
    Left = 280
    Top = 288
    Width = 81
    Height = 33
    Caption = #21462'  '#28040'(&C)'
    Flat = True
    OnClick = SBtn_CancelClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 464
    Height = 273
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    inline FlowWork: TFrame_EditFlowWork
      Left = 0
      Top = 0
      Width = 457
      Height = 273
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      inherited Pan_Interface: TPanel
        Width = 457
        Height = 273
        Align = alClient
        inherited Label1: TLabel
          Width = 64
          Height = 16
        end
        inherited Label2: TLabel
          Width = 64
          Height = 16
        end
        inherited Label3: TLabel
          Width = 64
          Height = 16
        end
        inherited Label4: TLabel
          Width = 64
          Height = 16
        end
        inherited Label5: TLabel
          Width = 48
          Height = 16
        end
        inherited Comb_FlowType: TComboBox
          Height = 24
          ItemHeight = 16
        end
      end
    end
  end
end
