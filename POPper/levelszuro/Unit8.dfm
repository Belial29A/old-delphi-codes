object frameSzuro: TframeSzuro
  Left = 0
  Top = 0
  Width = 720
  Height = 76
  TabOrder = 0
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 48
    Height = 13
    Caption = 'Ha a lev�l'
  end
  object Label2: TLabel
    Left = 314
    Top = 8
    Width = 3
    Height = 13
    Caption = ':'
  end
  object Label3: TLabel
    Left = 448
    Top = 8
    Width = 30
    Height = 13
    Caption = 'akkor:'
  end
  object Label4: TLabel
    Left = 219
    Top = 45
    Width = 6
    Height = 13
    Caption = 'a'
  end
  object Label5: TLabel
    Left = 384
    Top = 45
    Width = 72
    Height = 13
    Caption = 'ezt a sz�veget:'
  end
  object cmdHozzaadas: TButton
    Left = 624
    Top = 1
    Width = 89
    Height = 25
    Caption = 'Hozz�ad�s'
    TabOrder = 8
    OnClick = cmdHozzaadasClick
  end
  object cmbMicsoda: TComboBox
    Left = 64
    Top = 4
    Width = 105
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    TabOrder = 0
    Items.Strings = (
      'felad�ja'
      't�rgya'
      'sz�vege')
  end
  object cmbMuvelet: TComboBox
    Left = 174
    Top = 4
    Width = 139
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    TabOrder = 1
    Items.Strings = (
      'tartalmazza'
      'nem tartalmazza'
      'ezzel kezd�dik')
  end
  object txtMit: TEdit
    Left = 320
    Top = 4
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 2
    Text = 'sz�veg'
  end
  object cmbMitcsinaljon: TComboBox
    Left = 64
    Top = 40
    Width = 145
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    TabOrder = 3
    OnChange = cmbMitcsinaljonChange
    Items.Strings = (
      't�r�ld'
      'tedd')
  end
  object cmbMitmodositson: TComboBox
    Left = 233
    Top = 40
    Width = 145
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    TabOrder = 4
    Items.Strings = (
      't�rgy elej�re'
      't�rgy v�g�re')
  end
  object txtMivelmodositson: TEdit
    Left = 468
    Top = 40
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 5
    Text = 'sz�veg'
  end
  object cmdMentes: TButton
    Left = 624
    Top = 25
    Width = 89
    Height = 25
    Caption = 'Ment�s'
    Enabled = False
    TabOrder = 6
  end
  object cmdTorles: TButton
    Left = 624
    Top = 49
    Width = 89
    Height = 25
    Caption = 'T�rl�s'
    Enabled = False
    TabOrder = 7
    OnClick = cmdTorlesClick
  end
end
