object InsaForm: TInsaForm
  Left = 0
  Top = 0
  Caption = 'InsaForm'
  ClientHeight = 302
  ClientWidth = 658
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    658
    302)
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 510
    Top = 9
    Width = 33
    Height = 25
    Anchors = [akTop, akRight]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333FF3333333333333003333333333333F77F33333333333009033
      333333333F7737F333333333009990333333333F773337FFFFFF330099999000
      00003F773333377777770099999999999990773FF33333FFFFF7330099999000
      000033773FF33777777733330099903333333333773FF7F33333333333009033
      33333333337737F3333333333333003333333333333377333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    OnClick = SpeedButton1Click
    ExplicitLeft = 561
  end
  object SpeedButton2: TSpeedButton
    Left = 543
    Top = 9
    Width = 33
    Height = 25
    Anchors = [akTop, akRight]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
      3333333333777F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
      3333333777737777F333333099999990333333373F3333373333333309999903
      333333337F33337F33333333099999033333333373F333733333333330999033
      3333333337F337F3333333333099903333333333373F37333333333333090333
      33333333337F7F33333333333309033333333333337373333333333333303333
      333333333337F333333333333330333333333333333733333333}
    NumGlyphs = 2
    OnClick = SpeedButton2Click
    ExplicitLeft = 594
  end
  object SpeedButton3: TSpeedButton
    Left = 576
    Top = 8
    Width = 33
    Height = 25
    Anchors = [akTop, akRight]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
      333333333337F33333333333333033333333333333373F333333333333090333
      33333333337F7F33333333333309033333333333337373F33333333330999033
      3333333337F337F33333333330999033333333333733373F3333333309999903
      333333337F33337F33333333099999033333333373333373F333333099999990
      33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333300033333333333337773333333}
    NumGlyphs = 2
    OnClick = SpeedButton3Click
    ExplicitLeft = 627
  end
  object SpeedButton4: TSpeedButton
    Left = 609
    Top = 8
    Width = 33
    Height = 25
    Anchors = [akTop, akRight]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333FF3333333333333003333
      3333333333773FF3333333333309003333333333337F773FF333333333099900
      33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
      99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
      33333333337F3F77333333333309003333333333337F77333333333333003333
      3333333333773333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    OnClick = SpeedButton4Click
    ExplicitLeft = 660
  end
  object Label1: TLabel
    Left = 12
    Top = 16
    Width = 33
    Height = 13
    Caption = #44160#49353#49692
  end
  object Label2: TLabel
    Left = 234
    Top = 16
    Width = 44
    Height = 13
    Caption = #44160#49353#51060#47492
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 56
    Width = 642
    Height = 240
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ExplicitWidth = 553
    ExplicitHeight = 288
    object TabSheet1: TTabSheet
      Caption = #51312#54924
      ExplicitWidth = 545
      ExplicitHeight = 260
      object TabControl1: TTabControl
        Left = 0
        Top = 0
        Width = 634
        Height = 212
        Align = alClient
        TabOrder = 0
        Tabs.Strings = (
          #51204#52404
          #49324#50896
          #45824#47532
          #44284#51109
          #48512#51109
          #52264#51109
          #49345#47924
          #51060#49324
          #51204#47924
          #44256#47928
          #49324#51109
          #54924#51109
          #51452#51076
          #52293#51076
          #49440#51076
          #44053#49324
          '')
        TabIndex = 0
        OnChange = TabControl1Change
        ExplicitWidth = 545
        ExplicitHeight = 260
        object DBGrid1: TDBGrid
          Left = 4
          Top = 24
          Width = 626
          Height = 184
          Align = alClient
          DataSource = dm.InsaSource
          Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
    end
    object t2: TTabSheet
      Caption = #54200#51665
      ImageIndex = 1
      ExplicitWidth = 545
      ExplicitHeight = 260
      object Label3: TLabel
        Left = 48
        Top = 24
        Width = 22
        Height = 13
        Caption = #49324#48264
      end
      object Label4: TLabel
        Left = 48
        Top = 55
        Width = 22
        Height = 13
        Caption = #51060#47492
      end
      object Label5: TLabel
        Left = 48
        Top = 88
        Width = 22
        Height = 13
        Caption = #45208#51060
      end
      object Label6: TLabel
        Left = 48
        Top = 128
        Width = 22
        Height = 13
        Caption = #51649#44553
      end
      object Label7: TLabel
        Left = 48
        Top = 160
        Width = 22
        Height = 13
        Caption = #48512#49436
      end
      object Label8: TLabel
        Left = 48
        Top = 200
        Width = 44
        Height = 13
        Caption = #51077#49324#51068#51088
      end
      object Label9: TLabel
        Left = 48
        Top = 235
        Width = 22
        Height = 13
        Caption = #44553#50668
      end
      object Label10: TLabel
        Left = 252
        Top = 24
        Width = 22
        Height = 13
        Caption = #49324#51652
      end
      object DBEdit1: TDBEdit
        Left = 104
        Top = 21
        Width = 121
        Height = 21
        TabOrder = 0
        OnKeyDown = DBEdit1KeyDown
      end
      object DBEdit3: TDBEdit
        Left = 104
        Top = 85
        Width = 121
        Height = 21
        TabOrder = 2
        OnKeyDown = DBEdit1KeyDown
      end
      object DBEdit4: TDBEdit
        Left = 102
        Top = 192
        Width = 123
        Height = 21
        MaxLength = 10
        TabOrder = 4
        OnKeyDown = DBEdit1KeyDown
      end
      object DBEdit5: TDBEdit
        Left = 102
        Top = 232
        Width = 121
        Height = 21
        TabOrder = 6
        OnKeyDown = DBEdit1KeyDown
      end
      object DBComboBox1: TDBComboBox
        Left = 102
        Top = 125
        Width = 123
        Height = 21
        Items.Strings = (
          #49324#50896
          #45824#47532
          #44284#51109
          #48512#51109
          #52264#51109
          #51060#49324
          #49345#47924)
        TabOrder = 1
        OnKeyDown = DBEdit1KeyDown
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 104
        Top = 160
        Width = 121
        Height = 21
        TabOrder = 3
        OnKeyDown = DBEdit1KeyDown
      end
      object DBImage1: TDBImage
        Left = 282
        Top = 21
        Width = 117
        Height = 125
        TabOrder = 5
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 413
        Top = 16
        Width = 112
        Height = 125
        Caption = #50629#47924#45733#47141
        Items.Strings = (
          #47588#50864' '#51339#51020
          #51339#51020
          #48372#53685
          #44536#51200#44536#47100)
        TabOrder = 7
      end
      object Button1: TButton
        Left = 282
        Top = 152
        Width = 111
        Height = 41
        Caption = 'Insert'
        TabOrder = 8
      end
      object Button2: TButton
        Left = 418
        Top = 152
        Width = 111
        Height = 41
        Caption = 'delete'
        TabOrder = 9
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 282
        Top = 199
        Width = 111
        Height = 41
        Caption = 'cancel'
        TabOrder = 10
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 418
        Top = 199
        Width = 109
        Height = 41
        Caption = 'post'
        TabOrder = 11
        OnClick = Button4Click
      end
      object DBEdit2: TDBEdit
        Left = 104
        Top = 58
        Width = 121
        Height = 21
        TabOrder = 12
        OnKeyDown = DBEdit1KeyDown
      end
    end
    object t3: TTabSheet
      Caption = #52264#53944
      ImageIndex = 2
      ExplicitWidth = 545
      ExplicitHeight = 260
    end
  end
  object ComboBox1: TComboBox
    Left = 70
    Top = 13
    Width = 145
    Height = 21
    ItemIndex = 1
    TabOrder = 1
    Text = #51060#47492
    OnChange = ComboBox1Change
    Items.Strings = (
      #48264#54840
      #51060#47492
      #48512#49436)
  end
  object Edit1: TEdit
    Left = 288
    Top = 8
    Width = 136
    Height = 21
    TabOrder = 2
    OnChange = Edit1Change
    OnKeyPress = Edit1KeyPress
  end
end
