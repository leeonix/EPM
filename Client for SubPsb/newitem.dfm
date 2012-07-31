object Frm_New: TFrm_New
  Left = 314
  Top = 144
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Easy Project'
  ClientHeight = 463
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 422
    Width = 484
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Button1: TButton
      Left = 221
      Top = 9
      Width = 76
      Height = 28
      Caption = #20445#23384
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 314
      Top = 9
      Width = 77
      Height = 28
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 1
    end
    object Button3: TButton
      Left = 402
      Top = 9
      Width = 77
      Height = 28
      Caption = #25171#21360'...'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
end
