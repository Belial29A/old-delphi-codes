object frmList: TfrmList
  Left = 268
  Top = 142
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Rekordok list�ja'
  ClientHeight = 372
  ClientWidth = 257
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000877000000000000000000000
    0000008887777000000000000000000000008888877777700000000000000000
    0088888887777777700000000000000088888888887777777770000000000088
    8888888FFF877777777770000000088888888FFFFFF877777777000000000888
    888FFFFFFFFF877777700F88770008888FFFF800078FF87777708F887770088F
    FFFF07777008FF87770F8000007007FFFFF0880088708FF8770F0F887700007F
    FF800FFFF0070FFF8700FF8877700007FF8FFF707F880FFFF800FF8877700000
    7F800F070F007FFFF880FF887770000007F7FF707FF78FFFF780F8FF88700000
    007F00FFF007FFFF80708FFFF87000000007F870088FF70F800FFFFF87000000
    00707FFFFFF7007F80FFFFF8700000000F8707FFF800777F70FFFF8700000000
    0F007007F80778777FFFF8700000000000FF8777F808FFFFFFF8700000000000
    07FFF877F70FFFFFF870000000000000007FFF87778FFFF87000000000000000
    0007FFFFFFFF87000000000000000000000007FFF87000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFF1
    FFFFFFC07FFFFF001FFFFC0007FFF00001FFC000007F0000001F000000030000
    000100000000000000000000000080000000C0000000E0000000F0000000F800
    0000FC000001F8000003F0000007F000000FF000001FF000007FF80001FFFC00
    07FFFE003FFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cmdBezaras: TBitBtn
    Left = 91
    Top = 344
    Width = 75
    Height = 25
    Caption = '&Bez�r�s'
    TabOrder = 0
    OnClick = cmdBezarasClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object ListBox1: TListBox
    Left = -1
    Top = 0
    Width = 258
    Height = 337
    ItemHeight = 13
    TabOrder = 1
    OnClick = ListBox1Click
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 72
    Top = 56
  end
end
