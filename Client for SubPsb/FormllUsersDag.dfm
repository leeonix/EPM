object Frm_Dag_allUsers: TFrm_Dag_allUsers
  Left = 444
  Top = 163
  BorderStyle = bsSingle
  Caption = 'Frm_Dag_allUsers'
  ClientHeight = 299
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  inline Frame_Users: TFrame_UserLiset
    Left = 0
    Top = 0
    Width = 400
    Height = 268
    Align = alClient
    TabOrder = 0
    inherited Lvw_UserList: TListView
      Top = 19
      Height = 249
      MultiSelect = True
      OnDblClick = SelectUserToTarget
    end
    inherited Pan_ListInfo: TPanel
      Height = 19
      Caption = ' '#29992#25143#21015
      inherited Sbtn_ListViewStyle: TSpeedButton
        Top = 3
        Height = 15
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 268
    Width = 400
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Panel2: TPanel
      Left = 240
      Top = 0
      Width = 160
      Height = 31
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 85
        Top = 2
        Width = 71
        Height = 29
        Caption = #30830' '#23450'(&O)'
        Flat = True
        OnClick = SelectUserReturn
      end
      object SpeedButton2: TSpeedButton
        Left = 9
        Top = 2
        Width = 71
        Height = 29
        Caption = #21462' '#28040'(&C)'
        Flat = True
        OnClick = CancelSelectUser
      end
    end
  end
end
