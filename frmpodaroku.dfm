object frmPodarok: TfrmPodarok
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Greetfest.com'
  ClientHeight = 359
  ClientWidth = 80
  Color = clBtnFace
  TransparentColor = True
  TransparentColorValue = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object imgMain: TImage
    Left = 0
    Top = 0
    Width = 80
    Height = 359
    Align = alClient
    AutoSize = True
    Center = True
    IncrementalDisplay = True
    PopupMenu = mnActImg
    Transparent = True
    OnDblClick = imgMainDblClick
    ExplicitWidth = 193
    ExplicitHeight = 209
  end
  object HTTP: TIdHTTP
    AllowCookies = True
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 24
    Top = 16
  end
  object TrayIcon: TTrayIcon
    Icon.Data = {
      000001000200101000000100200068040000260000002020000001002000A810
      00008E040000280000001000000020000000010020000000000000040000120B
      0000120B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ABB6B20056B55EFF56B55EFF56B5
      5EFF56B55EFF54AF5CFF1852CFFF1852CFFF54AF5CFF56B55EFF56B55EFF56B5
      5EFF56B55EFFABB6B2000000000000000000ABB6B2FF5FC167FF4BB350FF4BB3
      50FF4BB350FF4BB350FF1852CFFF1852CFFF4BB350FF4BB350FF4BB350FF4BB3
      50FF5FC167FFABB6B2FF0000000000000000ABB6B2FF66CA6FFF4BB350FF4BB3
      50FF4BB350FF4BB350FF1852CFFF1852CFFF4BB350FF4BB350FF4BB350FF4BB3
      50FF66CA6FFFABB6B2FF0000000000000000ABB6B2FF66CA6FFF56B55EFF56B5
      5EFF56B55EFF4BB350FF1852CFFF1852CFFF4BB350FF56B55EFF56B55EFF56B5
      5EFF66CA6FFFABB6B2FF0000000000000000ABB6B2FF77D682FF5BBA64FF5BBA
      64FF5BBA64FF56B55EFF1852CFFF1852CFFF56B55EFF5BBA64FF5BBA64FF5BBA
      64FF77D682FFABB6B2FF0000000000000000ABB6B2FF77D682FF66CA6FFF66CA
      6FFF66CA6FFF5BBA64FF296DE1FF296DE1FF5BBA64FF66CA6FFF66CA6FFF66CA
      6FFF77D682FFABB6B2FF0000000000000000ABB6B2FF6BBD76FF5DB667FF5DB6
      67FF5DB667FF54AF5CFF1852CFFF1852CFFF54AF5CFF5DB667FF5DB667FF5DB6
      67FF6BBD76FFABB6B2FF000000000000000052AC57FF56B55EFF56B55EFF56B5
      5EFF56B55EFF54AF5CFF296DE1FF296DE1FF54AF5CFF56B55EFF56B55EFF56B5
      5EFF56B55EFF52AC57FF00000000000000005DB667FF5BBA64FF5BBA64FF5BBA
      64FF5BBA64FF52AC57FF296DE1FF296DE1FF52AC57FF5BBA64FF5BBA64FF5BBA
      64FF5BBA64FF5DB667FF00000000000000006BBD76FF77D682FF77D682FF77D6
      82FF77D682FF5DB667FF296DE1FF296DE1FF5DB667FF77D682FF77D682FF77D6
      82FF77D682FF6BBD76FF000000000000000052AC57FF6BBD76FF6BBD76FF6BBD
      76FF6BBD76FF6BBD76FF296DE1FF296DE1FF6BBD76FF6BBD76FF6BBD76FF6BBD
      76FF6BBD76FF52AC57FF000000000000000000000000000000006B84C5006B84
      C5FF296DE1FF1852CFFF1852CFFF1852CFFF1852CFFF1852CFFF1852CFFF6B84
      C5000000000000000000000000000000000000000000000000006B84C50062B9
      A2FF296DE1FF1852CFFF6B84C5FF6B84C5FF1852CFFF296DE1FF296DE1FF6B84
      C50000000000000000000000000000000000000000000000000000000000296D
      E1FF296DE1FF6B84C50000000000000000006B84C500296DE1FF296DE1FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003FFC00007FFE00007FFE00007FFE
      00007FFE00007FFE00007FFE00007FFE00007FFE00007FFE00007FFE00000FF0
      00000FF000000C30000000000000280000002000000040000000010020000000
      000000100000120B0000120B00000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00378340A43C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F
      46FF3C8F46FF3C8F46FF42994BFF0034B8FF0034B8FF0034B8FF0034B8FF4299
      4BFF3C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F
      46FF3C8F46FF378340A43C8F4600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003C8F46FF6FD377FF6FD377FF6FD377FF6FD377FF6FD377FF6FD377FF6FD3
      77FF6FD377FF6FD377FF68CB6FFF0036BAFF1449D1FF1449D1FF0036BAFF68CB
      6FFF6FD377FF6FD377FF6FD377FF6FD377FF6FD377FF6FD377FF6FD377FF6FD3
      77FF6FD377FF3C8F46FF3C8F4600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003C8F46FF72D47AFF46B049FF46B049FF46B049FF46B049FF46B049FF46B0
      49FF46B049FF46B049FF48AE4BFF0038BDFF154BD3FF154BD3FF0038BDFF48AE
      4BFF46B049FF46B049FF46B049FF46B049FF46B049FF46B049FF46B049FF46B0
      49FF72D47AFF3C8F46FF3C8F4600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003C8F46FF74D57CFF48B24DFF47B14CFF47B14CFF47B14CFF47B14CFF47B1
      4CFF47B14CFF47B14CFF47AD4DFF003BC0FF164ED5FF164ED5FF003BC0FF47AD
      4DFF47B14CFF47B14CFF47B14CFF47B14CFF47B14CFF47B14CFF47B14CFF48B2
      4DFF74D57CFF3C8F46FF3C8F4600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003C8F46FF77D67FFF4CB550FF4BB44FFF4BB44FFF4BB44FFF4BB44FFF4BB4
      4FFF4BB44FFF4BB44FFF49AC4EFF003DC3FF1751D6FF1751D6FF003DC3FF49AC
      4EFF4BB44FFF4BB44FFF4BB44FFF4BB44FFF4BB44FFF4BB44FFF4BB44FFF4CB5
      50FF77D67FFF3C8F46FF3C8F4600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003C8F46FF79D882FF4FB855FF4EB754FF4EB754FF4EB754FF4EB754FF4EB7
      54FF4EB754FF4EB754FF4AAC50FF0040C7FF1854D8FF1854D8FF0040C7FF4AAC
      50FF4EB754FF4EB754FF4EB754FF4EB754FF4EB754FF4EB754FF4EB754FF4FB8
      55FF79D882FF3C8F46FF3C8F4600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003C8F46FF7CDA85FF53BB59FF52BA58FF52BA58FF52BA58FF52BA58FF52BA
      58FF52BA58FF52BA58FF4CAC52FF0043CAFF1A57DAFF1A57DAFF0043CAFF4CAC
      52FF52BA58FF52BA58FF52BA58FF52BA58FF52BA58FF52BA58FF52BA58FF53BB
      59FF7CDA85FF3C8F46FF3C8F4600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003C8F46FF7FDB89FF57BE5EFF56BD5DFF56BD5DFF56BD5DFF56BD5DFF56BD
      5DFF56BD5DFF56BD5DFF4EAB54FF0046CEFF1B5BDDFF1B5BDDFF0046CEFF4EAB
      54FF56BD5DFF56BD5DFF56BD5DFF56BD5DFF56BD5DFF56BD5DFF56BD5DFF57BE
      5EFF7FDB89FF3C8F46FF3C8F4600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003C8F46FF82DD8CFF5BC263FF5AC162FF5AC162FF5AC162FF5AC162FF5AC1
      62FF5AC162FF5AC162FF4FAB56FF004AD2FF1C5EDFFF1C5EDFFF004AD2FF4FAB
      56FF5AC162FF5AC162FF5AC162FF5AC162FF5AC162FF5AC162FF5AC162FF5BC2
      63FF82DD8CFF3C8F46FF3C8F4600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003C8F46FF85DF90FF5FC568FF5EC467FF5EC467FF5EC467FF5EC467FF5EC4
      67FF5EC467FF5EC467FF51AA59FF004DD6FF1E62E1FF1E62E1FF004DD6FF51AA
      59FF5EC467FF5EC467FF5EC467FF5EC467FF5EC467FF5EC467FF5EC467FF5FC5
      68FF85DF90FF3C8F46FF3C8F4600FFFFFF00FFFFFF00FFFFFF00FFFFFF003C8F
      46003C8F46FF88E193FF63C96DFF62C86CFF62C86CFF62C86CFF62C86CFF62C8
      6CFF62C86CFF62C86CFF53AA5BFF0050D9FF2066E3FF2066E3FF0050D9FF53AA
      5BFF62C86CFF62C86CFF62C86CFF62C86CFF62C86CFF62C86CFF62C86CFF63C9
      6DFF88E193FF3C8F46FF3C8F4600FFFFFF00FFFFFF00FFFFFF00FFFFFF003C8F
      46003C8F46FF8BE398FF67CD72FF66CC71FF66CC71FF66CC71FF66CC71FF66CC
      71FF66CC71FF66CC71FF54AA5DFF0053DDFF2169E6FF2169E6FF0053DDFF54AA
      5DFF66CC71FF66CC71FF66CC71FF66CC71FF66CC71FF66CC71FF66CC71FF67CD
      72FF8BE398FF3C8F46FF3C8F4600FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0004398843FF85D691FF64C26FFF63C16EFF63C16EFF63C16EFF63C16EFF63C1
      6EFF63C16EFF63C16EFF519F59FF0057E1FF236DE8FF236DE8FF0057E1FF519F
      59FF63C16EFF63C16EFF63C16EFF63C16EFF63C16EFF63C16EFF63C16EFF64C2
      6FFF85D691FF398843FF00000004FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000C337A3CFF75BB80FF5AAA64FF59AA63FF59AA63FF59AA63FF59AA63FF59AA
      63FF59AA63FF59AA63FF488B50FF005AE5FF2470EAFF2470EAFF005AE5FF488B
      50FF59AA63FF59AA63FF59AA63FF59AA63FF59AA63FF59AA63FF59AA63FF5AAA
      64FF75BB80FF337A3CFF0000000CFFFFFF00FFFFFF00FFFFFF00FFFFFF003989
      439D3C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F
      46FF3C8F46FF3C8F46FF317439FF005DE9FF2574EDFF2574EDFF005DE9FF3174
      39FF3C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F
      46FF3C8F46FF3C8F46FF3989439DFFFFFF00FFFFFF00FFFFFF00FFFFFF003C8F
      46FF74D57CFF74D57CFF74D57CFF74D57CFF74D57CFF74D57CFF74D57CFF74D5
      7CFF74D57CFF74D57CFF59A55FFF0060ECFF2777EFFF2777EFFF0060ECFF59A5
      5FFF74D57CFF74D57CFF74D57CFF74D57CFF74D57CFF74D57CFF74D57CFF74D5
      7CFF74D57CFF74D57CFF3C8F46FFFFFFFF00FFFFFF00FFFFFF00FFFFFF003C8F
      46FF7CDA85FF53BB59FF53BB59FF53BB59FF53BB59FF53BB59FF53BB59FF53BB
      59FF53BB59FF53BB59FF409044FF0063F0FF287AF1FF287AF1FF0063F0FF4090
      44FF53BB59FF53BB59FF53BB59FF53BB59FF53BB59FF53BB59FF53BB59FF53BB
      59FF53BB59FF7CDA85FF3C8F46FFFFFFFF00FFFFFF00FFFFFF00FFFFFF003C8F
      46FF85DF90FF5FC568FF5EC467FF5EC467FF5EC467FF5EC467FF5EC467FF5EC4
      67FF5EC467FF5EC467FF47944EFF0066F3FF3987F3FF3987F3FF0066F3FF4794
      4EFF5EC467FF5EC467FF5EC467FF5EC467FF5EC467FF5EC467FF5EC467FF5EC4
      67FF5FC568FF85DF90FF3C8F46FFFFFFFF00FFFFFF00FFFFFF00FFFFFF003C8F
      46FF8EE59BFF6BD077FF6ACF76FF6ACF76FF6ACF76FF6ACF76FF6ACF76FF6ACF
      76FF6ACF76FF6ACF76FF4F9A58FF0068F6FF5C9EF7FF5C9EF7FF0068F6FF4F9A
      58FF6ACF76FF6ACF76FF6ACF76FF6ACF76FF6ACF76FF6ACF76FF6ACF76FF6ACF
      76FF6BD077FF8EE59BFF3C8F46FFFFFFFF00FFFFFF00FFFFFF00FFFFFF003C8F
      46FF96EAA4FF76D884FF76D884FF76D884FF76D884FF76D884FF76D884FF76D8
      84FF76D884FF76D884FF579F61FF006AF9FF73ADF9FF73ADF9FF006AF9FF579F
      61FF76D884FF76D884FF76D884FF76D884FF76D884FF76D884FF76D884FF76D8
      84FF76D884FF96EAA4FF3C8F46FFFFFFFF00FFFFFF00FFFFFF00FFFFFF003C8F
      46BD83D591FF9CEDABFF9CEDABFF9CEDABFF9CEDABFF9CEDABFF9CEDABFF9CED
      ABFF9CEDABFF9CEDABFF72AD7DFF006DFBFF78B0FAFF78B0FAFF006DFBFF72AD
      7DFF9CEDABFF9CEDABFF9CEDABFF9CEDABFF9CEDABFF9CEDABFF9CEDABFF9CED
      ABFF9CEDABFF83D591FF3C8F46BDFFFFFF00FFFFFF00FFFFFF00FFFFFF003C8F
      46543C8F46BD3C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F
      46FF3C8F46FF3C8F46FF3C8F46FF006EFDFF006EFDFF006EFDFF006EFDFF3C8F
      46FF3C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F46FF3C8F
      46FF3C8F46FF3C8F46BD3C8F4654FFFFFF00FFFFFF00FFFFFF00FFFFFF003C8F
      46003C8F46003C8F46003C8F46003C8F46000034B80F0034B8720034B8C60034
      B8F00034B8FF0034B8FF0034B8FF0034B8FF0034B8FF0034B8FF0034B8FF0034
      B8FF0034B8FF0034B8FF0034B8F00034B8C60034B8720034B80F3C8F46003C8F
      46003C8F46003C8F46003C8F4600FFFFFF00FFFFFF00FFFFFF00FFFFFF003C8F
      46003C8F46003C8F46003C8F46000034B8090034B8DB3062CFFF4172D9FF4070
      DCFF3969DBFF3162D8FF2E60D8FF0034B8FF3986F3FF3986F3FF0034B8FF2457
      D5FF2658D5FF2E5FD7FF3566D9FF386AD8FF2B5ECDFF0034B8DB0034B8093C8F
      46003C8F46003C8F46003C8F4600FFFFFF00FFFFFF00FFFFFF00FFFFFF003C8F
      46003C8F46003C8F46003C8F46000034B8150D40BDFF5E8CE6FF4F7EE1FF4776
      DFFF3F6FDDFF3869DAFF2357CCFF0034B8EB0034B8FF0034B8FF0034B8EB1F53
      CBFF2E5FD7FF3464D9FF3B6CDCFF4373DEFF86A6EAFF0B3FBDFF0034B8153C8F
      46003C8F46003C8F46003C8F4600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000034B8C688A9E8FF5785E4FF4E7D
      E1FF4776DFFF2E61D1FF0034B8E70034B815FFFFFF00FFFFFF000034B8150034
      B8E7295BCFFF3C6DDCFF4373DEFF4B7AE0FF4373D9FF0034B8C9FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000034B8482C5DCAFF95B5EEFF8AAA
      ECFF3466D3FF0034B8ED0034B833FFFFFF00FFFFFF00FFFFFF00FFFFFF000034
      B8330034B8ED2F62D1FF83A5EAFF89A9EBFF2759C9FF0034B848FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000034B884194BC2FF1D50
      C4FF0034B8DB0034B82AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000034B82A0034B8DB1A4DC4FF1649C1FF0034B887FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000034B8270034
      B8360034B803FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000034B8030034B8360034B827FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000FFF
      FFF01FFFFFF81FFFFFF81FFFFFF81FFFFFF81FFFFFF81FFFFFF81FFFFFF81FFF
      FFF81FFFFFF81FFFFFF81FFFFFF81FFFFFF81FFFFFF81FFFFFF83FFFFFFC3FFF
      FFFC3FFFFFFC3FFFFFFC3FFFFFFC1FFFFFF80FFFFFF0001FF80000FFFF0001FD
      BF8000F81F0000F00F00006006000000000000000000}
    PopupMenu = TrayMenu
    Visible = True
    OnClick = TrayIconClick
    Left = 24
    Top = 64
  end
  object TrayMenu: TPopupMenu
    Left = 24
    Top = 112
    object mnSettings: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnClick = mnSettingsClick
    end
    object mnCloseApp: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
      OnClick = mnCloseAppClick
    end
  end
  object tmrMainWork: TTimer
    Enabled = False
    Interval = 300000
    OnTimer = tmrMainWorkTimer
    Left = 24
    Top = 232
  end
  object tmrControl: TTimer
    Interval = 2000
    OnTimer = tmrControlTimer
    Left = 24
    Top = 296
  end
  object mnActImg: TPopupMenu
    Left = 24
    Top = 168
    object mnRefuseImg: TMenuItem
      Caption = #1041#1086#1083#1100#1096#1077' '#1085#1077' '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1101#1090#1086#1090' '#1087#1086#1076#1072#1088#1086#1082
      OnClick = mnRefuseImgClick
    end
  end
end
