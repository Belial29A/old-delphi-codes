object Form1: TForm1
  Left = 192
  Top = 133
  Width = 112
  Height = 98
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100001000400E80200001600000028000000200000004000
    0000010004000000000000000000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000800000080000000000000000000000000FFF778000000000000
    000000000000FFFFF77DEEE07000000000000000008FFFFFF78DEEEF00000000
    0000000000FFFFFFF77EEFEFE0000000008000000FFFFFFFF77DFEFEFA000000
    000FFF770FFFFFFFF77EEFEFEE0000000FFFFF788FFFFFFF88577EFAEA000000
    FFFFFF70877FFF8F000D8EBBBBB0000FFFFFFF70FF77F8F08F802EDB3D8000FF
    FFFFFF707E7DE870FFF04878778000FFFFFFFF708D8BDE608F80FF7F77F080FF
    FFFFF880BBBBBE8D000F87F77F700787FFF8F0088AAAFE785788FFF77F000FFF
    7F8F08F00EFFEFEE77FFFFFF770007E887870FF00AEEFEFD77FFFFFF7F0008DD
    BDE6000FF0FFEFEE77FFFFFFF0000BBBBBE8D00FFF8EFEED77FFFFFF000080AA
    AFE7888FFFF0EEED7FFFFFF0080000EFFEFEE0877FFF008877FF800BB00000AE
    EFEFD0FF77F8F08000008B9D8000000FFEFEE07E7DE870FFF08DE87E80000008
    EFEE848DDBDE408F80FF7F77F00000000EEED0BBBBBE8D000F87F77F70000000
    0000888AAAFE7717787FF77F080000000008000EFFEFEE77FFFFFF7700000000
    0000000AEEFEFD77FFFFFF7F0000000000000000FFEFEE77FFFFFFF000000000
    000000008EFEE877FFFFFF00000000000000000000EEED77FFFFF00000000000
    0000000000000877FF000000000000000000000000008000008000000000FFFF
    807FFFFF001FFFFE0007FFFC0007FFF80003FC000001F8000001F0000001E000
    0000C00000008000000080000000000000000000000100000001000000010000
    000300000007000000038000000380000003C0000003E0000003F0000003F800
    0003FE000007FFC00007FFE0000FFFF0001FFFF8003FFFFC007FFFFF01FF}
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Left = 8
    Top = 8
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    Left = 8
    Top = 40
  end
  object WordApplication1: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 40
    Top = 8
  end
  object WordDocument1: TWordDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 72
    Top = 8
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 40
    Top = 40
  end
end
