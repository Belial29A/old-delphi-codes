�
 TFRMORDERS 0ci  TPF0
TfrmOrders	frmOrdersLeft� Top� BorderStylebsDialogCaption%Table <-> Database Demo (Orders form)ClientHeightClientWidth=
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterOnCreate
FormCreate	OnDestroyFormDestroyPixelsPerInch`
TextHeight TPanelPanel2Left Top Width=HeightAlignalTopCaptionOrders (Read-Only)
Font.ColorclRedFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder   	TOvcTabletblOrderLeft TopWidth=Height� RowLimit
LockedRowsTopRow	ActiveRow
LockedColsLeftCol	ActiveColAccess	otxNormalAdjustotaCenterLeftAlignalTopBorderStylebsSingleColor	clBtnFaceColorUnusedclWindowColors.ActiveFocusedclHighlightColors.ActiveFocusedTextclHighlightTextColors.ActiveUnfocusedclHighlightColors.ActiveUnfocusedTextclHighlightTextColors.Locked	clBtnFaceColors.LockedTextclWindowTextColors.Editing	clBtnFaceColors.EditingTextclWindowTextColors.SelectedclHighlightColors.SelectedTextclHighlightText
ControllerOvcController1
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style !GridPenSet.NormalGrid.NormalColorclBtnShadow!GridPenSet.NormalGrid.SecondColorclBtnHighlightGridPenSet.NormalGrid.StylepsSolidGridPenSet.NormalGrid.Effectge3D!GridPenSet.LockedGrid.NormalColorclBtnShadow!GridPenSet.LockedGrid.SecondColorclBtnHighlightGridPenSet.LockedGrid.StylepsSolidGridPenSet.LockedGrid.Effectge3D&GridPenSet.CellWhenFocused.NormalColorclBlack&GridPenSet.CellWhenFocused.SecondColorclBtnHighlight GridPenSet.CellWhenFocused.StylepsSolid!GridPenSet.CellWhenFocused.EffectgeBoth(GridPenSet.CellWhenUnfocused.NormalColorclBlack(GridPenSet.CellWhenUnfocused.SecondColorclBtnHighlight"GridPenSet.CellWhenUnfocused.StylepsDash#GridPenSet.CellWhenUnfocused.EffectgeBothLockedRowsCelldbOrderHeaderCellOptionsotoNoRowResizingotoNoColResizingotoTabToArrowotoEnterToArrow ParentColor
ParentFont
ScrollBarsssBothTabOrderTabStop	OnActiveCellChangedtblOrderActiveCellChangedOnBeginEdittblOrderBeginEditOnGetCellDatatblOrderGetCellDataOnLockedCellClicktblOrderLockedCellClickCellDatafrmOrders.dbOrderHeaderCellfrmOrders.RowLablefrmOrders.sfOrderNofrmOrders.pfSaleDatefrmOrders.pfShipDatefrmOrders.sfEmpNofrmOrders.sfShipToContactfrmOrders.sfShipToAddr1frmOrders.sfShipToAddr2frmOrders.sfShipToCityfrmOrders.sfShipToStatefrmOrders.pfShipToZipfrmOrders.sfShipToCountryfrmOrders.pfShipToPhonefrmOrders.sfShipToViafrmOrders.sfPOfrmOrders.sfTermsfrmOrders.sfPaymentMethodfrmOrders.pfItemsTotalfrmOrders.pfTaxRate2frmOrders.pfFreightfrmOrders.pfAmountPaid RowData ColData	frmOrders.RowLable7	frmOrders.sfOrderNoP	frmOrders.pfSaleDateP	frmOrders.pfShipDate7	frmOrders.sfEmpNo}	frmOrders.sfShipToContact� 	frmOrders.sfShipToAddr1� 	frmOrders.sfShipToAddr2}	frmOrders.sfShipToCityP	frmOrders.sfShipToStateP	frmOrders.pfShipToZipd	frmOrders.sfShipToCountry}	frmOrders.pfShipToPhoneK	frmOrders.sfShipToViaP	frmOrders.sfPOK	frmOrders.sfTermsd	frmOrders.sfPaymentMethodU	frmOrders.pfItemsTotalU	frmOrders.pfTaxRate2U	frmOrders.pfFreightU	frmOrders.pfAmountPaid   TBitBtnBitBtn1Left�Top� WidthKHeightCaption&CloseTabOrderOnClickBitBtn1Click	NumGlyphs  TQuerydbOrderQueryDatabaseNameBCDEMOSSQL.Strings SELECT * FROM "ORDERS.DB" ORDERSWHERE ORDERS.CUSTNO = :Number Params.Data
     Number       �@ LeftTop�  TFloatFielddbOrderQueryOrderNo	FieldNameOrderNo  TDateTimeFielddbOrderQuerySaleDate	FieldNameSaleDate  TDateTimeFielddbOrderQueryShipDate	FieldNameShipDate  TIntegerFielddbOrderQueryEmpNo	FieldNameEmpNo  TStringFielddbOrderQueryShipToContact	FieldNameShipToContact  TStringFielddbOrderQueryShipToAddr1	FieldNameShipToAddr1Size  TStringFielddbOrderQueryShipToAddr2	FieldNameShipToAddr2Size  TStringFielddbOrderQueryShipToCity	FieldName
ShipToCitySize  TStringFielddbOrderQueryShipToState	FieldNameShipToState  TStringFielddbOrderQueryShipToZip	FieldName	ShipToZipSize
  TStringFielddbOrderQueryShipToCountry	FieldNameShipToCountry  TStringFielddbOrderQueryShipToPhone	FieldNameShipToPhoneSize  TStringFielddbOrderQueryShipVIA	FieldNameShipVIASize  TStringFielddbOrderQueryPO	FieldNamePOSize  TStringFielddbOrderQueryTerms	FieldNameTermsSize  TStringFielddbOrderQueryPaymentMethod	FieldNamePaymentMethodSize  TCurrencyFielddbOrderQueryItemsTotal	FieldName
ItemsTotal  TFloatFielddbOrderQueryTaxRate	FieldNameTaxRate  TCurrencyFielddbOrderQueryFreight	FieldNameFreight  TCurrencyFielddbOrderQueryAmountPaid	FieldName
AmountPaid   TOvcTCSimpleField	sfOrderNoAccess
otxDefaultAdjust
otaDefaultCaretIns.BitmapHotSpotX CaretIns.BitmapHotSpotY CaretIns.Shape
csVertLineCaretIns.AligncaLeftCaretIns.BlinkTime CaretIns.CaretHeight
CaretIns.CaretWidthCaretIns.IsGrayCaretOvr.BitmapHotSpotX CaretOvr.BitmapHotSpotY CaretOvr.ShapecsBlockCaretOvr.AligncaLeftCaretOvr.BlinkTime CaretOvr.CaretHeight
CaretOvr.CaretWidthCaretOvr.IsGrayControlCharColorclRedDataType	sftDoubleDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightText
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style Margin	MaxLengthOptionsefoCaretToEnd PadChar PasswordChar*PictureMaskXShowHintTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight
TextMargin	TextStyletsFlatLeftTop� 	RangeHigh

   t�۹����CRangeLow

   t�۹�����  TOvcTCPictureField
pfSaleDateDataTypepftDatePictureMask
mm/dd/yyyy	MaxLength
Access
otxDefaultAdjust
otaDefaultCaretIns.BitmapHotSpotX CaretIns.BitmapHotSpotY CaretIns.Shape
csVertLineCaretIns.AligncaLeftCaretIns.BlinkTime CaretIns.CaretHeight
CaretIns.CaretWidthCaretIns.IsGrayCaretOvr.BitmapHotSpotX CaretOvr.BitmapHotSpotY CaretOvr.ShapecsBlockCaretOvr.AligncaLeftCaretOvr.BlinkTime CaretOvr.CaretHeight
CaretOvr.CaretWidthCaretOvr.IsGrayControlCharColorclRedDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightTextEpochl
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style MarginOptionsefoCaretToEnd PadChar PasswordChar*ShowHintTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight
TextMargin	TextStyletsFlatLeft0Top� 	RangeHigh

   %`       RangeLow

               TOvcTCPictureField
pfShipDateDataTypepftDatePictureMask
mm/dd/yyyy	MaxLength
Access
otxDefaultAdjust
otaDefaultCaretIns.BitmapHotSpotX CaretIns.BitmapHotSpotY CaretIns.Shape
csVertLineCaretIns.AligncaLeftCaretIns.BlinkTime CaretIns.CaretHeight
CaretIns.CaretWidthCaretIns.IsGrayCaretOvr.BitmapHotSpotX CaretOvr.BitmapHotSpotY CaretOvr.ShapecsBlockCaretOvr.AligncaLeftCaretOvr.BlinkTime CaretOvr.CaretHeight
CaretOvr.CaretWidthCaretOvr.IsGrayControlCharColorclRedDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightTextEpochl
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style MarginOptionsefoCaretToEnd PadChar PasswordChar*ShowHintTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight
TextMargin	TextStyletsFlatLeftPTop� 	RangeHigh

   %`       RangeLow

               TOvcTCSimpleFieldsfEmpNoAccess
otxDefaultAdjust
otaDefaultCaretIns.BitmapHotSpotX CaretIns.BitmapHotSpotY CaretIns.Shape
csVertLineCaretIns.AligncaLeftCaretIns.BlinkTime CaretIns.CaretHeight
CaretIns.CaretWidthCaretIns.IsGrayCaretOvr.BitmapHotSpotX CaretOvr.BitmapHotSpotY CaretOvr.ShapecsBlockCaretOvr.AligncaLeftCaretOvr.BlinkTime CaretOvr.CaretHeight
CaretOvr.CaretWidthCaretOvr.IsGrayControlCharColorclRedDataType
sftLongIntDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightText
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style Margin	MaxLengthOptionsefoCaretToEnd PadChar PasswordChar*PictureMaskXShowHintTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight
TextMargin	TextStyletsFlatLeftpTop� 	RangeHigh

   ���      RangeLow

      �        TOvcTCSimpleFieldsfShipToContactAccess
otxDefaultAdjust
otaDefaultCaretIns.BitmapHotSpotX CaretIns.BitmapHotSpotY CaretIns.Shape
csVertLineCaretIns.AligncaLeftCaretIns.BlinkTime CaretIns.CaretHeight
CaretIns.CaretWidthCaretIns.IsGrayCaretOvr.BitmapHotSpotX CaretOvr.BitmapHotSpotY CaretOvr.ShapecsBlockCaretOvr.AligncaLeftCaretOvr.BlinkTime CaretOvr.CaretHeight
CaretOvr.CaretWidthCaretOvr.IsGrayControlCharColorclRedDataType	sftStringDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightText
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style Margin	MaxLengthOptionsefoCaretToEnd PadChar PasswordChar*PictureMaskXShowHintTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight
TextMargin	TextStyletsFlatLeft� Top� 	RangeHigh

             RangeLow

               TOvcTCSimpleFieldsfShipToAddr1Access
otxDefaultAdjust
otaDefaultCaretIns.BitmapHotSpotX CaretIns.BitmapHotSpotY CaretIns.Shape
csVertLineCaretIns.AligncaLeftCaretIns.BlinkTime CaretIns.CaretHeight
CaretIns.CaretWidthCaretIns.IsGrayCaretOvr.BitmapHotSpotX CaretOvr.BitmapHotSpotY CaretOvr.ShapecsBlockCaretOvr.AligncaLeftCaretOvr.BlinkTime CaretOvr.CaretHeight
CaretOvr.CaretWidthCaretOvr.IsGrayControlCharColorclRedDataType	sftStringDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightText
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style Margin	MaxLengthOptionsefoCaretToEnd PadChar PasswordChar*PictureMaskXShowHintTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight
TextMargin	TextStyletsFlatLeft� Top� 	RangeHigh

             RangeLow

               TOvcTCSimpleFieldsfShipToAddr2Access
otxDefaultAdjust
otaDefaultCaretIns.BitmapHotSpotX CaretIns.BitmapHotSpotY CaretIns.Shape
csVertLineCaretIns.AligncaLeftCaretIns.BlinkTime CaretIns.CaretHeight
CaretIns.CaretWidthCaretIns.IsGrayCaretOvr.BitmapHotSpotX CaretOvr.BitmapHotSpotY CaretOvr.ShapecsBlockCaretOvr.AligncaLeftCaretOvr.BlinkTime CaretOvr.CaretHeight
CaretOvr.CaretWidthCaretOvr.IsGrayControlCharColorclRedDataType	sftStringDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightText
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style Margin	MaxLengthOptionsefoCaretToEnd PadChar PasswordChar*PictureMaskXShowHintTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight
TextMargin	TextStyletsFlatLeft� Top� 	RangeHigh

             RangeLow

               TOvcTCSimpleFieldsfShipToCityAccess
otxDefaultAdjust
otaDefaultCaretIns.BitmapHotSpotX CaretIns.BitmapHotSpotY CaretIns.Shape
csVertLineCaretIns.AligncaLeftCaretIns.BlinkTime CaretIns.CaretHeight
CaretIns.CaretWidthCaretIns.IsGrayCaretOvr.BitmapHotSpotX CaretOvr.BitmapHotSpotY CaretOvr.ShapecsBlockCaretOvr.AligncaLeftCaretOvr.BlinkTime CaretOvr.CaretHeight
CaretOvr.CaretWidthCaretOvr.IsGrayControlCharColorclRedDataType	sftStringDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightText
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style Margin	MaxLengthOptionsefoCaretToEnd PadChar PasswordChar*PictureMaskXShowHintTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight
TextMargin	TextStyletsFlatLeft� Top� 	RangeHigh

             RangeLow

               TOvcTCSimpleFieldsfShipToStateAccess
otxDefaultAdjust
otaDefaultCaretIns.BitmapHotSpotX CaretIns.BitmapHotSpotY CaretIns.Shape
csVertLineCaretIns.AligncaLeftCaretIns.BlinkTime CaretIns.CaretHeight
CaretIns.CaretWidthCaretIns.IsGrayCaretOvr.BitmapHotSpotX CaretOvr.BitmapHotSpotY CaretOvr.ShapecsBlockCaretOvr.AligncaLeftCaretOvr.BlinkTime CaretOvr.CaretHeight
CaretOvr.CaretWidthCaretOvr.IsGrayControlCharColorclRedDataType	sftStringDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightText
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style Margin	MaxLengthOptionsefoCaretToEnd PadChar PasswordChar*PictureMaskXShowHintTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight
TextMargin	TextStyletsFlatLeftTop� 	RangeHigh

             RangeLow

               TOvcTCPictureFieldpfShipToZipDataType	pftStringPictureMask
XXXXXXXXXX	MaxLength
Access
otxDefaultAdjust
otaDefaultCaretIns.BitmapHotSpotX CaretIns.BitmapHotSpotY CaretIns.Shape
csVertLineCaretIns.AligncaLeftCaretIns.BlinkTime CaretIns.CaretHeight
CaretIns.CaretWidthCaretIns.IsGrayCaretOvr.BitmapHotSpotX CaretOvr.BitmapHotSpotY CaretOvr.ShapecsBlockCaretOvr.AligncaLeftCaretOvr.BlinkTime CaretOvr.CaretHeight
CaretOvr.CaretWidthCaretOvr.IsGrayControlCharColorclRedDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightTextEpochl
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style MarginOptionsefoCaretToEndefoTrimBlanks PadChar PasswordChar*ShowHintTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight
TextMargin	TextStyletsFlatLeft0Top� 	RangeHigh

             RangeLow

               TOvcTCSimpleFieldsfShipToCountryAccess
otxDefaultAdjust
otaDefaultCaretIns.BitmapHotSpotX CaretIns.BitmapHotSpotY CaretIns.Shape
csVertLineCaretIns.AligncaLeftCaretIns.BlinkTime CaretIns.CaretHeight
CaretIns.CaretWidthCaretIns.IsGrayCaretOvr.BitmapHotSpotX CaretOvr.BitmapHotSpotY CaretOvr.ShapecsBlockCaretOvr.AligncaLeftCaretOvr.BlinkTime CaretOvr.CaretHeight
CaretOvr.CaretWidthCaretOvr.IsGrayControlCharColorclRedDataType	sftStringDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightText
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style Margin	MaxLengthOptionsefoCaretToEnd PadChar PasswordChar*PictureMaskXShowHintTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight
TextMargin	TextStyletsFlatLeftPTop� 	RangeHigh

             RangeLow

               TOvcTCPictureFieldpfShipToPhoneDataType	pftStringPictureMaskXXXXXXXXXXXXXXX	MaxLengthAccess
otxDefaultAdjust
otaDefaultCaretIns.BitmapHotSpotX CaretIns.BitmapHotSpotY CaretIns.Shape
csVertLineCaretIns.AligncaLeftCaretIns.BlinkTime CaretIns.CaretHeight
CaretIns.CaretWidthCaretIns.IsGrayCaretOvr.BitmapHotSpotX CaretOvr.BitmapHotSpotY CaretOvr.ShapecsBlockCaretOvr.AligncaLeftCaretOvr.BlinkTime CaretOvr.CaretHeight
CaretOvr.CaretWidthCaretOvr.IsGrayControlCharColorclRedDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightTextEpochl
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style MarginOptionsefoCaretToEnd PadChar PasswordChar*ShowHintTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight
TextMargin	TextStyletsFlatLeftpTop� 	RangeHigh

             RangeLow

               TOvcTCSimpleFieldsfShipToViaAccess
otxDefaultAdjust
otaDefaultCaretIns.BitmapHotSpotX CaretIns.BitmapHotSpotY CaretIns.Shape
csVertLineCaretIns.AligncaLeftCaretIns.BlinkTime CaretIns.CaretHeight
CaretIns.CaretWidthCaretIns.IsGrayCaretOvr.BitmapHotSpotX CaretOvr.BitmapHotSpotY CaretOvr.ShapecsBlockCaretOvr.AligncaLeftCaretOvr.BlinkTime CaretOvr.CaretHeight
CaretOvr.CaretWidthCaretOvr.IsGrayControlCharColorclRedDataType	sftStringDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightText
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style Margin	MaxLengthOptionsefoCaretToEnd PadChar PasswordChar*PictureMaskXShowHintTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight
TextMargin	TextStyletsFlatLeftTop� 	RangeHigh

             RangeLow

               TOvcTCSimpleFieldsfPOAccess
otxDefaultAdjust
otaDefaultCaretIns.BitmapHotSpotX CaretIns.BitmapHotSpotY CaretIns.Shape
csVertLineCaretIns.AligncaLeftCaretIns.BlinkTime CaretIns.CaretHeight
CaretIns.CaretWidthCaretIns.IsGrayCaretOvr.BitmapHotSpotX CaretOvr.BitmapHotSpotY CaretOvr.ShapecsBlockCaretOvr.AligncaLeftCaretOvr.BlinkTime CaretOvr.CaretHeight
CaretOvr.CaretWidthCaretOvr.IsGrayControlCharColorclRedDataType	sftStringDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightText
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style Margin	MaxLengthOptionsefoCaretToEnd PadChar PasswordChar*PictureMaskXShowHintTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight
TextMargin	TextStyletsFlatLeft0Top� 	RangeHigh

             RangeLow

               TOvcTCSimpleFieldsfTermsAccess
otxDefaultAdjust
otaDefaultCaretIns.BitmapHotSpotX CaretIns.BitmapHotSpotY CaretIns.Shape
csVertLineCaretIns.AligncaLeftCaretIns.BlinkTime CaretIns.CaretHeight
CaretIns.CaretWidthCaretIns.IsGrayCaretOvr.BitmapHotSpotX CaretOvr.BitmapHotSpotY CaretOvr.ShapecsBlockCaretOvr.AligncaLeftCaretOvr.BlinkTime CaretOvr.CaretHeight
CaretOvr.CaretWidthCaretOvr.IsGrayControlCharColorclRedDataType	sftStringDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightText
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style Margin	MaxLengthOptionsefoCaretToEnd PadChar PasswordChar*PictureMaskXShowHintTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight
TextMargin	TextStyletsFlatLeftPTop� 	RangeHigh

             RangeLow

               TOvcTCSimpleFieldsfPaymentMethodAccess
otxDefaultAdjust
otaDefaultCaretIns.BitmapHotSpotX CaretIns.BitmapHotSpotY CaretIns.Shape
csVertLineCaretIns.AligncaLeftCaretIns.BlinkTime CaretIns.CaretHeight
CaretIns.CaretWidthCaretIns.IsGrayCaretOvr.BitmapHotSpotX CaretOvr.BitmapHotSpotY CaretOvr.ShapecsBlockCaretOvr.AligncaLeftCaretOvr.BlinkTime CaretOvr.CaretHeight
CaretOvr.CaretWidthCaretOvr.IsGrayControlCharColorclRedDataType	sftStringDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightText
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style Margin	MaxLengthOptionsefoCaretToEnd PadChar PasswordChar*PictureMaskXShowHintTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight
TextMargin	TextStyletsFlatLeftpTop� 	RangeHigh

             RangeLow

               TOvcTCPictureFieldpfItemsTotalDataType	pftDoublePictureMask
$######.##	MaxLength
Access
otxDefaultAdjustotaCenterRightCaretIns.BitmapHotSpotX CaretIns.BitmapHotSpotY CaretIns.Shape
csVertLineCaretIns.AligncaLeftCaretIns.BlinkTime CaretIns.CaretHeight
CaretIns.CaretWidthCaretIns.IsGrayCaretOvr.BitmapHotSpotX CaretOvr.BitmapHotSpotY CaretOvr.ShapecsBlockCaretOvr.AligncaLeftCaretOvr.BlinkTime CaretOvr.CaretHeight
CaretOvr.CaretWidthCaretOvr.IsGrayControlCharColorclRedDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightTextEpochl
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style MarginOptionsefoCaretToEnd PadChar PasswordChar*ShowHintTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight
TextMargin	TextStyletsFlatLeft� Top� 	RangeHigh

   t�۹����CRangeLow

   t�۹�����  TOvcTCPictureField
pfTaxRate2DataType	pftDoublePictureMask
#######.##	MaxLength
Access
otxDefaultAdjustotaCenterRightCaretIns.BitmapHotSpotX CaretIns.BitmapHotSpotY CaretIns.Shape
csVertLineCaretIns.AligncaLeftCaretIns.BlinkTime CaretIns.CaretHeight
CaretIns.CaretWidthCaretIns.IsGrayCaretOvr.BitmapHotSpotX CaretOvr.BitmapHotSpotY CaretOvr.ShapecsBlockCaretOvr.AligncaLeftCaretOvr.BlinkTime CaretOvr.CaretHeight
CaretOvr.CaretWidthCaretOvr.IsGrayControlCharColorclRedDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightTextEpochl
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style MarginOptionsefoCaretToEnd PadChar PasswordChar*ShowHintTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight
TextMargin	TextStyletsFlatLeft� Top� 	RangeHigh

   t�۹����CRangeLow

   t�۹�����  TOvcTCPictureField	pfFreightDataType	pftDoublePictureMask
$######.##	MaxLength
Access
otxDefaultAdjustotaCenterRightCaretIns.BitmapHotSpotX CaretIns.BitmapHotSpotY CaretIns.Shape
csVertLineCaretIns.AligncaLeftCaretIns.BlinkTime CaretIns.CaretHeight
CaretIns.CaretWidthCaretIns.IsGrayCaretOvr.BitmapHotSpotX CaretOvr.BitmapHotSpotY CaretOvr.ShapecsBlockCaretOvr.AligncaLeftCaretOvr.BlinkTime CaretOvr.CaretHeight
CaretOvr.CaretWidthCaretOvr.IsGrayControlCharColorclRedDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightTextEpochl
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style MarginOptionsefoCaretToEnd PadChar PasswordChar*ShowHintTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight
TextMargin	TextStyletsFlatLeft� Top� 	RangeHigh

   t�۹����CRangeLow

   t�۹�����  TOvcTCPictureFieldpfAmountPaidDataType	pftDoublePictureMask
$######.##	MaxLength
Access
otxDefaultAdjustotaCenterRightCaretIns.BitmapHotSpotX CaretIns.BitmapHotSpotY CaretIns.Shape
csVertLineCaretIns.AligncaLeftCaretIns.BlinkTime CaretIns.CaretHeight
CaretIns.CaretWidthCaretIns.IsGrayCaretOvr.BitmapHotSpotX CaretOvr.BitmapHotSpotY CaretOvr.ShapecsBlockCaretOvr.AligncaLeftCaretOvr.BlinkTime CaretOvr.CaretHeight
CaretOvr.CaretWidthCaretOvr.IsGrayControlCharColorclRedDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightTextEpochl
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style MarginOptionsefoCaretToEnd PadChar PasswordChar*ShowHintTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight
TextMargin	TextStyletsFlatLeft� Top� 	RangeHigh

   t�۹����CRangeLow

   t�۹�����  TOvcControllerOvcController1EntryCommands.TableListDefault	 WordStar Grid  EntryOptionsefoAutoSelectefoBeepOnErrorefoInsertPushes EpochlLeftToph  TOvcTCRowHeadRowLableShowActiveRow	ShowNumbersAdjust
otaDefault
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style MarginTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight	TextStyletsFlatLeft0Top�   TOvcTCColHeaddbOrderHeaderCellShowActiveCol	ShowLettersAdjust	otaCenter
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style MarginTabletblOrder
TableColor		TableFontTextHiColorclBtnHighlight	TextStyletsFlatUseWordWrapLeftPTop�    