object frmKerdes: TfrmKerdes
  Left = 308
  Top = 185
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'K�rd�s'
  ClientHeight = 99
  ClientWidth = 233
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 0
    Width = 233
    Height = 64
    Caption = 'V�lassz'
    ItemIndex = 0
    Items.Strings = (
      '�n mondom az �vsz�mot, Te az esem�nyt'
      'Te mondod az �vsz�mot, �n az esem�nyt')
    TabOrder = 0
  end
  object cmdOK: TButton
    Left = 8
    Top = 72
    Width = 97
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object cmdMegse: TButton
    Left = 128
    Top = 72
    Width = 97
    Height = 25
    Caption = '&M�gse'
    ModalResult = 2
    TabOrder = 2
  end
end
