object frmSettings: TfrmSettings
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 823
  ClientWidth = 831
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblHeader: TLabel
    Left = 14
    Top = 548
    Width = 45
    Height = 13
    Caption = 'lblHeader'
  end
  object pnl: TPanel
    Left = 0
    Top = 0
    Width = 831
    Height = 823
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = -8
    ExplicitWidth = 950
    ExplicitHeight = 836
    object lblVersion: TLabel
      Left = 126
      Top = 261
      Width = 61
      Height = 13
      Caption = #1042#1077#1088#1089#1080#1103' : 1.0'
    end
    object lblMinTime: TLabel
      Left = 49
      Top = 128
      Width = 68
      Height = 13
      Caption = ' ('#1084#1080#1085#1080#1084#1091#1084' 30)'
    end
    object btnClose: TButton
      Left = 4
      Top = 230
      Width = 195
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
      TabOrder = 5
      OnClick = btnCloseClick
    end
    object btnSaveHideSetts: TButton
      Left = 4
      Top = 198
      Width = 130
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      TabOrder = 4
      OnClick = btnSaveHideSettsClick
    end
    object chbIsAutoStart: TCheckBox
      Left = 5
      Top = 152
      Width = 80
      Height = 17
      Caption = #1040#1074#1090#1086#1079#1072#1087#1091#1089#1082
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object edtlogin: TLabeledEdit
      Left = 5
      Top = 16
      Width = 193
      Height = 21
      EditLabel.Width = 92
      EditLabel.Height = 13
      EditLabel.Caption = #1051#1086#1075#1080#1085' ('#1074#1072#1096' e-mail)'
      TabOrder = 0
    end
    object edtPass: TLabeledEdit
      Left = 5
      Top = 56
      Width = 193
      Height = 21
      EditLabel.Width = 37
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1072#1088#1086#1083#1100
      PasswordChar = '*'
      TabOrder = 1
      OnChange = edtPassChange
    end
    object edtRenewPeriod: TLabeledEdit
      Left = 4
      Top = 125
      Width = 41
      Height = 21
      EditLabel.Width = 169
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1077#1088#1080#1086#1076' '#1087#1088#1086#1074#1077#1088#1082#1080' '#1087#1086#1076#1072#1088#1082#1086#1074' ('#1089#1077#1082')'
      TabOrder = 2
      Text = '30'
    end
    object chbShowPass: TCheckBox
      Left = 5
      Top = 83
      Width = 113
      Height = 17
      Hint = #1076#1086#1089#1090#1091#1087#1085#1086' '#1090#1086#1083#1100#1082#1086' '#1087#1088#1080' '#1087#1091#1089#1090#1086#1084' '#1087#1086#1083#1077' '#1055#1072#1088#1086#1083#1100
      Caption = #1087#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1088#1086#1083#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = chbShowPassClick
    end
    object chbStayOnTop: TCheckBox
      Left = 5
      Top = 175
      Width = 169
      Height = 17
      Caption = #1042#1089#1077#1075#1076#1072' '#1085#1072' '#1087#1077#1088#1077#1076#1085#1077#1084' '#1087#1083#1072#1085#1077
      TabOrder = 7
    end
    object btnShowSetts: TButton
      Left = 5
      Top = 257
      Width = 18
      Height = 17
      Caption = '+'
      TabOrder = 8
      OnClick = btnShowSettsClick
    end
    object btnHideSetts: TButton
      Left = 137
      Top = 198
      Width = 61
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 9
      OnClick = btnSaveHideSettsClick
    end
  end
  object btnPaste: TButton
    Left = 13
    Top = 387
    Width = 41
    Height = 25
    Caption = 'paste'
    TabOrder = 1
    OnClick = btnPasteClick
  end
  object btnLoad: TButton
    Left = 60
    Top = 387
    Width = 89
    Height = 25
    Caption = 'load'
    TabOrder = 2
    OnClick = btnLoadClick
  end
  object edtFileLocation: TEdit
    Left = 13
    Top = 418
    Width = 184
    Height = 21
    TabOrder = 3
    Text = 
      'http://usrg1983.dyndns.org/system/files/images/2013/11/11/gifs_0' +
      '1.gif'
  end
  object edtPosX: TLabeledEdit
    Left = 14
    Top = 472
    Width = 80
    Height = 21
    EditLabel.Width = 141
    EditLabel.Height = 13
    EditLabel.Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1072' X '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103
    TabOrder = 5
    Text = '300'
  end
  object edtPosY: TLabeledEdit
    Left = 14
    Top = 515
    Width = 80
    Height = 21
    EditLabel.Width = 141
    EditLabel.Height = 13
    EditLabel.Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1072' Y '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103
    TabOrder = 6
    Text = '300'
  end
  object btnCheckPos: TButton
    Left = 168
    Top = 494
    Width = 32
    Height = 25
    Hint = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
    Caption = '+'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = btnCheckPosClick
  end
  object edtHash: TEdit
    Left = 16
    Top = 358
    Width = 184
    Height = 21
    TabOrder = 8
  end
  object btnHash: TButton
    Left = 14
    Top = 327
    Width = 183
    Height = 25
    Caption = 'password hash'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnHashClick
  end
  object WebBrowser1: TWebBrowser
    Left = 223
    Top = 10
    Width = 600
    Height = 600
    TabOrder = 9
    OnDocumentComplete = WebBrowser1DocumentComplete
    ControlData = {
      4C000000033E0000033E00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object mLog: TMemo
    Left = 14
    Top = 616
    Width = 807
    Height = 199
    ScrollBars = ssBoth
    TabOrder = 10
  end
  object btnSaveLog: TButton
    Left = 14
    Top = 585
    Width = 97
    Height = 25
    Caption = 'save log to file'
    TabOrder = 11
    OnClick = btnSaveLogClick
  end
end
