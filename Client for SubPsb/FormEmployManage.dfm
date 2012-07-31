object Frm_ManageEmploy: TFrm_ManageEmploy
  Left = 249
  Top = 127
  BorderStyle = bsDialog
  Caption = #29992#25143#31649#29702
  ClientHeight = 458
  ClientWidth = 564
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 120
  TextHeight = 18
  object Bevel1: TBevel
    Left = 0
    Top = 418
    Width = 564
    Height = 2
    Align = alBottom
  end
  object Panel1: TPanel
    Left = 0
    Top = 420
    Width = 564
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object SBtn_OK: TSpeedButton
      Left = 446
      Top = 2
      Width = 103
      Height = 36
      Caption = #20851'  '#38381'(&X)'
      Flat = True
      OnClick = SBtn_OKClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 564
    Height = 418
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 0
    object Panel7: TPanel
      Left = 0
      Top = 0
      Width = 564
      Height = 418
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel7'
      TabOrder = 0
      inline Frame_AllUsers: TFrame_UserLiset
        Left = 0
        Top = 153
        Width = 564
        Height = 265
        Align = alClient
        TabOrder = 0
        inherited Lvw_UserList: TListView
          Top = 23
          Width = 564
          Height = 242
          OnClick = Frame_AllUsersLvw_UserListClick
        end
        inherited Pan_ListInfo: TPanel
          Width = 564
          Height = 23
          Caption = ' '#29992#25143#21015#34920
          inherited Bevel1: TBevel
            Width = 564
          end
          inherited Sbtn_ListViewStyle: TSpeedButton
            Left = 522
            Top = 3
            Width = 30
          end
        end
        inherited Pmn_ViewEmployList: TPopupMenu
          Left = 429
          Top = 240
        end
      end
      object Pan_Employ: TPanel
        Left = 0
        Top = 118
        Width = 564
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Bevel2: TBevel
          Left = 0
          Top = 0
          Width = 564
          Height = 2
          Align = alTop
        end
        object SBtn_SaveEmploy: TSpeedButton
          Left = 431
          Top = 3
          Width = 102
          Height = 31
          Caption = #20445#23384'(&S)'
          Flat = True
          OnClick = SBtn_SaveEmployClick
        end
        object SBtn_DelEmploy: TSpeedButton
          Left = 226
          Top = 3
          Width = 103
          Height = 31
          Caption = #21024#38500'(&D)'
          Flat = True
          OnClick = SBtn_DelEmployClick
        end
        object SBtn_AddEmploy: TSpeedButton
          Left = 21
          Top = 3
          Width = 103
          Height = 31
          Caption = #26032#22686'(&A)'
          Flat = True
          OnClick = AddEmploy
        end
        object SBtn_Cancel: TSpeedButton
          Left = 329
          Top = 3
          Width = 102
          Height = 31
          Caption = #21462#28040'(C)'
          Flat = True
          OnClick = SBtn_CancelClick
        end
        object SBtn_ModifyEmploy: TSpeedButton
          Left = 124
          Top = 3
          Width = 102
          Height = 31
          Caption = #20462#25913'(&M)'
          Flat = True
          OnClick = SBtn_ModifyEmployClick
        end
      end
      inline Frame_EditEmploy: TFrame_EditOperators
        Left = 0
        Top = 0
        Width = 564
        Height = 118
        Align = alTop
        TabOrder = 2
        inherited Pan_Interface: TPanel
          Width = 564
          Align = alClient
          inherited Label1: TLabel
            Left = 294
            Top = 21
            Width = 54
            Height = 18
          end
          inherited Label2: TLabel
            Top = 54
            Width = 54
            Height = 18
          end
          inherited Label3: TLabel
            Left = 294
            Top = 52
            Width = 54
            Height = 18
          end
          inherited Label4: TLabel
            Top = 90
            Width = 54
            Height = 18
          end
          inherited Label5: TLabel
            Left = 294
            Top = 84
            Width = 54
            Height = 18
          end
          inherited Label6: TLabel
            Width = 54
            Height = 18
          end
          inherited EMPLOYEENAME: TEdit
            Left = 342
            Top = 17
            Height = 24
          end
          inherited TITLE: TEdit
            Left = 342
            Top = 48
          end
          inherited PASSWORD: TEdit
            Top = 86
          end
          inherited PERMISSION: TComboBox
            Left = 342
            Top = 79
            Height = 26
            ItemHeight = 18
          end
          inherited DEPARTMENT: TComboBox
            Top = 46
            Height = 26
            ItemHeight = 18
          end
        end
      end
    end
  end
end
