�
 TFORM1 0�  TPF0TForm1Form1LeftSTop� WidthHeight,ActiveControlOvcDbTable1CaptionForm1
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterOnCreate
FormCreatePixelsPerInch`
TextHeight TOvcDbTableOvcDbTable1LeftTopWidth� Height� LockedColumns Access	otxNormalAdjustotaCenterLeftBorderStylebsSingleColorUnusedclWindowColors.ActiveFocusedclHighlightColors.ActiveFocusedTextclHighlightTextColors.ActiveUnfocusedclHighlightColors.ActiveUnfocusedTextclHighlightTextColors.Locked	clBtnFaceColors.LockedTextclWindowTextColors.EditingclWindowColors.EditingTextclWindowTextColors.SelectedclHighlightColors.SelectedTextclHighlightText
ControllerOvcController1
DataSourceDataSource1DefaultMargin!GridPenSet.NormalGrid.NormalColorclBtnShadow!GridPenSet.NormalGrid.SecondColorclBtnHighlightGridPenSet.NormalGrid.StylepsDotGridPenSet.NormalGrid.EffectgeBoth!GridPenSet.LockedGrid.NormalColorclBtnShadow!GridPenSet.LockedGrid.SecondColorclBtnHighlightGridPenSet.LockedGrid.StylepsSolidGridPenSet.LockedGrid.Effectge3D&GridPenSet.CellWhenFocused.NormalColorclBlack&GridPenSet.CellWhenFocused.SecondColorclBtnHighlight GridPenSet.CellWhenFocused.StylepsSolid!GridPenSet.CellWhenFocused.EffectgeBoth(GridPenSet.CellWhenUnfocused.NormalColorclBlack(GridPenSet.CellWhenUnfocused.SecondColorclBtnHighlight"GridPenSet.CellWhenUnfocused.StylepsDash#GridPenSet.CellWhenUnfocused.EffectgeBothHeaderHeightHeaderOptionshoShowHeader OptionsdtoShowIndicators ParentColor	RowHeightRowIndicatorWidth
ScrollBarsssBothTabOrder TabStop		TextStyletsFlatCellDataForm1.OvcTCSimpleField1Form1.OvcTCComboBox1 ColDatauNAME 	OvcTCComboBox1@SIZE 	OvcTCSimpleField1   TDBNavigatorDBNavigator1LeftTop� Width� Height
DataSourceDataSource1TabOrder  TMemoMemo1Left� TopWidthHeight� Lines.Strings.This example shows how to load items from one /database table into the Items TStringList of a .OvcTCComboBox that is used for another table. +There are several IMPORTANT points to keep in mind about this example: 3  1. For the sake of simplicity, the same database 1      table is used as the primary and secondary 1      table. In this case, the ANIMALS.DBF sample,      database that comes with Delphi. In a 1      "real-world" case, the two database tables .      would have a common field, say the name 0      of a state; the combobox Items list would 2      be filled with the names of the states from /      the secondary table and used to choose a 2      state while working with the primary table.       4      In this example, the names of possible animals.      is those already entered into the table. 1  2. The datatype and datalength of the field in 2      the primary and that in the secondary table .      *must* be the same. This requirement is 9       general, i.e., it is not specific to this example. )  3. The Items list does not and cannont 3      automatically update itself. For example, if 1      someone added or deleted a record from the 3      secondary table, the Items list of the combo 3      box would be unaware of that change. Specific4      to this example, if you add a new animal name 6      in the primary table, the Items list will *not* 2      include the new name. This feature is on our1      wish list and may be addressed in a future       version of Orpheus. ReadOnly	
ScrollBars
ssVerticalTabOrderWordWrap  TDataSourceDataSource1DataSetTable1LeftcTop  TTableTable1Active	DatabaseNameDBDEMOS	TableNameANIMALS.DBFLeft� Top TStringField
Table1NAME	FieldNameNAMESize
  TSmallintField
Table1SIZE	FieldNameSIZE   TOvcControllerOvcController1EntryCommands.TableListDefault	 WordStar Grid  EpochlLeft� TopA  TOvcTCComboBoxOvcTCComboBox1AcceptActivationClick	Access
otxDefaultAdjust
otaDefaultAutoAdvanceCharAutoAdvanceLeftRightColorclWindowDropDownCount
HideButtonShowHintMargin	MaxLength
SaveStringValue	ShowArrowSortedStyle
csDropDownTableOvcDbTable1
TableColor	TableFont	TextHiColorclBtnHighlight	TextStyletsFlatUseRunTimeItemsLeftfTopA  TDataSourceDataSource2DataSetTable1LefteTopc  TTableTable2Active	DatabaseNameDBDEMOS	TableNameANIMALS.DBFLeft� Topg  TOvcTCSimpleFieldOvcTCSimpleField1Access
otxDefaultAdjust
otaDefaultCaretOvr.ShapecsBlockColorclWindowControlCharColorclRedDataType
sftIntegerDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightTextMargin	MaxLengthOptionsefoCaretToEnd PadChar PasswordChar*PictureMaskiShowHintTableOvcDbTable1
TableColor	TableFont	TextHiColorclBtnHighlight
TextMargin	TextStyletsFlatLefthTop� 	RangeHigh

   �        RangeLow

    ���         