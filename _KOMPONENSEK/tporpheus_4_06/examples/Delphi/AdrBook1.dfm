�
 TADDRFORM 0�J  TPF0	TAddrFormAddrFormLeftTop� 
AutoScrollCaptionAddress Book DemoClientHeight�ClientWidth�
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style Menu	MainMenu1PositionpoScreenCenterOnCreate
FormCreate	OnDestroyFormDestroyOnResize
FormResizePixelsPerInch`
TextHeight TOvcNotebookOvcNotebook1Left Top!Width�HeightMActiveTabFont.ColorclBlackActiveTabFont.Height�ActiveTabFont.NameArialActiveTabFont.StylefsBold ConserveResourcesDefaultPageIndex HighlightColorclBtnHighlightOldStylePageUsesTabColor	ShadowColorclBtnShadowShadowedTextTabAutoHeight		TabHeightTabOrientationtoRightTabTextOrientationttoHorizontalTabRowCount TextShadowColorclBtnShadowTabUseDefaultColor	UseActiveTabFont	OnPageChangeOvcNotebook1PageChangeOnPageChangedOvcNotebook1PageChangedAlignalClient
ControllerOvcController1Color	clBtnFace
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrder  TOvcTabPage LeftTopWidth�HeightJCaption
&DirectoryEnabled	PageVisible	 TOvcVirtualListBoxOvcVirtualListbox1LeftTopWidth�Height� HintListing of recordsHeaderLast Name, First Name (Company)HeaderColor.BackColor	clBtnFaceHeaderColor.TextColor	clBtnTextProtectColor.BackColorclRedProtectColor.TextColorclWhite	RowHeightSelectColor.BackColorclHighlightSelectColor.TextColorclHighlightText
ShowHeader		OnGetItemOvcVirtualListbox1GetItem
ControllerOvcController1Ctl3D	
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style ParentCtl3D
ParentFontTabOrder 
OnDblClickModify1Click   TOvcTabPage LeftTopWidth�HeightJCaption&Client InfoEnabled	PageVisible	 	TGroupBox	GroupBox1LeftTopWidth�Height� CaptionName and AddressCtl3D	ParentCtl3DTabOrder  TLabelLabel1LeftTop;WidthHeightCaptionLast:
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabel Left� Top:WidthHeightCaptionFirst:
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabel LeftTopXWidth0HeightCaptionCompany:
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabel LeftToprWidth HeightCaptionStreet:
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabel LeftTop� WidthHeightCaptionCity:
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabel Left� Top� WidthHeightCaptionState:
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabel LeftTop� WidthHeightCaptionZip:
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style 
ParentFont  TOvcSimpleFieldLastNameFieldLeft@Top8WidthzHeightCursorcrIBeamHint|Enter Last NameDataType	sftStringCaretOvr.ShapecsBlockControlCharColorclRed
ControllerOvcController1DecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclYellowEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightText
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style OptionsefoInputRequiredefoSoftValidation 
ParentFontPictureMaskXTabOrder  TOvcSimpleFieldFirstNameFieldLeft� Top8WidthxHeightCursorcrIBeamHint|Enter First NameDataType	sftStringCaretOvr.ShapecsBlockControlCharColorclRed
ControllerOvcController1DecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightText
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style OptionsefoInputRequiredefoSoftValidation 
ParentFontPictureMaskXTabOrder  TOvcSimpleFieldCompanyFieldLeft@TopTWidth1HeightCursorcrIBeamHint|Enter Company NameDataType	sftStringCaretOvr.ShapecsBlockControlCharColorclRed
ControllerOvcController1DecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightText
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	MaxLength
ParentFontPictureMaskXTabOrder  TOvcSimpleFieldStreetFieldLeft@ToppWidth1HeightCursorcrIBeamHint|Enter Street AddressDataType	sftStringCaretOvr.ShapecsBlockControlCharColorclRed
ControllerOvcController1DecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightText
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	MaxLength
ParentFontPictureMaskXTabOrder  TOvcSimpleField	CityFieldLeft@Top� WidthzHeightCursorcrIBeamHint|Enter CityDataType	sftStringCaretOvr.ShapecsBlockControlCharColorclRed
ControllerOvcController1DecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightText
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontPictureMaskXTabOrder  TOvcSimpleField
StateFieldLeft� Top� WidthHeightCursorcrIBeamHint$|Enter Two-Letter State AbbreviationDataType	sftStringCaretOvr.ShapecsBlockControlCharColorclRed
ControllerOvcController2DecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightText
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	MaxLength
ParentFontPictureMaskATabOrderOnErrorStateFieldErrorOnUserCommandStateFieldUserCommandOnUserValidationStateFieldUserValidation  TOvcPictureFieldZipFieldLeft*Top� WidthGHeightCursorcrIBeamHint|Enter Zip CodeDataType	pftStringCaretOvr.ShapecsBlock
ControllerOvcController1ControlCharColorclRedDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightTextEpochl
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style InitDateTime	MaxLength
OptionsefoCaretToEnd 
ParentFontPictureMask
99999-9999TabOrderOnExitPictureFieldExitOnUserValidationZipFieldUserValidation  TOvcSpinnerOvcSpinner1Left� Top� WidthHeightAcceleration
AutoRepeat		DelayTime�FocusedControl
StateField
ShowArrows	StylestNormalVerticalWrapMode	OnClickOvcSpinner1Click  TO32FlexEdit	FlexEdit1LeftTopWidthqHeightTabStopAutoSizeBorders.Active	Borders.BorderSet.ShowLeftBorders.BorderSet.ShowRightBorders.BorderSet.ShowTopBorders.BorderSet.ShowBottom	Borders.BorderStylebstyFlatBorders.FlatColorclMaroonColor	clBtnFaceEditLines.MaxLinesEditLines.DefaultLinesEditLines.FocusedLinesEditLines.MouseOverLinesEfColors.Disabled.BackColorclWindowEfColors.Disabled.TextColor
clGrayTextEfColors.Error.BackColorclRedEfColors.Error.TextColorclBlackEfColors.Highlight.BackColorclHighlightEfColors.Highlight.TextColorclHighlightTextPopupAnchorpaLeftReadOnly	
ShowButtonTabOrder Validation.BeepOnError	Validation.ValidationEventveOnExitValidation.ValidatorTypeNoneValidation.ValidationTypevtNoneValidation.InputRequiredWantReturns	   	TGroupBox	GroupBox2LeftTop� Width� HeightiCaptionPhone NumbersCtl3D	ParentCtl3DTabOrder TLabel LeftTop$WidthHeightCaptionHome:
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabel LeftTopJWidth-HeightAutoSizeCaption Work:
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style 
ParentFont  TOvcPictureFieldHomePhoneFieldLeftLTop Width]HeightCursorcrIBeamHint|Enter Home Phone NumberDataType	pftStringCaretOvr.ShapecsBlock
ControllerOvcController1ControlCharColorclRedDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightTextEpochl
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style InitDateTime	MaxLengthOptionsefoCaretToEnd 
ParentFontPictureMask(999) 999-9999TabOrder Uninitialized	OnExitPictureFieldExitOnUserValidationPhoneFieldUserValidation  TOvcPictureFieldWorkPhoneFieldLeftLTopHWidth]HeightCursorcrIBeamHint|Enter Work Phone NumberDataType	pftStringCaretOvr.ShapecsBlock
ControllerOvcController1ControlCharColorclRedDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightTextEpochl
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style InitDateTime	MaxLengthOptionsefoCaretToEnd 
ParentFontPictureMask(999) 999-9999TabOrderUninitialized	OnExitPictureFieldExitOnUserValidationPhoneFieldUserValidation   	TGroupBox	GroupBox3Left� Top� Width� HeightiCaptionImportant DatesCtl3D	ParentCtl3DTabOrder TLabel LeftTop#Width+HeightCaption	Birthday:
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabel LeftTopKWidth?HeightCaptionAnniversary:
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style 
ParentFont  TOvcPictureFieldBirthdayFieldLeftQTop WidthIHeightCursorcrIBeamHint|Enter BirthdateDataTypepftDateCaretOvr.ShapecsBlock
ControllerOvcController1ControlCharColorclRedDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightTextEpochl
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style InitDateTime	MaxLength
OptionsefoCaretToEnd 
ParentFontPictureMask
MM/DD/yyyyTabOrder 
OnDblClickPopupCalendarOnExitPictureFieldExitOnUserCommandDisplayCalendar	RangeHigh

   %`       RangeLow

               TOvcPictureFieldAnniversaryFieldLeftQTopHWidthIHeightCursorcrIBeamHint|Enter Anniversary DateDataTypepftDateCaretOvr.ShapecsBlock
ControllerOvcController1ControlCharColorclRedDecimalPlaces EFColors.Disabled.BackColorclWindowEFColors.Disabled.TextColor
clGrayTextEFColors.Error.BackColorclRedEFColors.Error.TextColorclBlackEFColors.Highlight.BackColorclHighlightEFColors.Highlight.TextColorclHighlightTextEpochl
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style InitDateTime	MaxLength
OptionsefoCaretToEnd 
ParentFontPictureMask
MM/DD/yyyyTabOrder
OnDblClickPopupCalendarOnExitPictureFieldExitOnUserCommandDisplayCalendar	RangeHigh

   %`       RangeLow

               TOvcSpinnerOvcFourWaySpinner1Left� Top WidthHeightAcceleration
AutoRepeat		DelayTime�FocusedControlBirthdayField
ShowArrows	Style	stFourWayWrapMode	  TOvcSpinnerOvcFourWaySpinner2Left� TopHWidthHeightAcceleration
AutoRepeat		DelayTime�FocusedControlAnniversaryField
ShowArrows	Style	stFourWayWrapMode	    TOvcTabPage LeftTopWidth�HeightJCaption&NotesEnabled	PageVisible	 TLabelLabel2Left:TopWidthAHeight	AlignmenttaCenterAutoSizeCaption	Memo for:  
TOvcEditor
OvcEditor1LeftTop3WidthyHeight� CursorcrIBeam
AutoIndentNewStyleIndentBorderStylebsSingle	ByteLimit� CaretOvr.ShapecsBlockFixedFont.ColorclBlackFixedFont.NameCourier NewFixedFont.Size
FixedFont.Style HideSelection	HighlightColors.BackColorclHighlightHighlightColors.TextColorclHighlightText
InsertMode	
LeftMarginMarginColorclWindowMarginOptions.Right.EnabledMarginOptions.Right.LineWeightMarginOptions.Right.LineStylepsSolidMarginOptions.Right.LineColorclBlack MarginOptions.Right.LinePositionMarginOptions.Left.EnabledMarginOptions.Left.LineWeightMarginOptions.Left.LineStylepsSolidMarginOptions.Left.LineColorclBlackMarginOptions.Left.LinePositionParaLengthLimit�	ParaLimit���ReadOnlyRightMargin	RuleColorclNavy
ScrollBarsssNoneScrollBarsAlwaysScrollPastEndShowBookmarks	ShowLineNumbers	ShowRulesTabSizeTabTypettRealTrimWhiteSpace	UndoBufferSize  	WantEnter	WantTabWordWrap	
WrapAtLeft	
WrapColumnPWrapToWindow
WheelDelta
ControllerOvcController1Ctl3DParentCtl3DTabOrder TabStop	    TPanelPanel1Left TopnWidth�HeightAlignalBottom	AlignmenttaLeftJustify
BevelInner	bvLowered
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder  TPanelPanel2Left Top Width�Height!AlignalTopParentShowHintShowHint	TabOrder TSpeedButton
ExitButtonLeftTopWidthHeightHintExit|Exit Application
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 3     33wwwww33����33w?33333���33s�3333���337?3333��3333333��3333333��3333333��3333333��3333333��333�333���333w3333��3333333��33?3333���333333���33w��33     33wwwwws3	NumGlyphsOnClick
Exit1Click  TSpeedButton	InsButtonLeft#TopWidthHeightHintInsert|Insert Record
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 3333333333�3333�39�3330 373337w39�3330 3��337w9���33337ww333?9���333 7wws333w39�3333 373333w39�3333337s3333?3333333 3333�33w333<333 3337�33w333<�3333����?�<����Ù37wwwww�<����Ù37wwwwsw3333<�3333337s33�333<330 3337337w3333330 3333337w3333333333333333	NumGlyphsOnClickInsert1Click  TSpeedButton	DelButtonLeft;TopWidthHeightHintDelete|Delete Record
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 333333333333333�3333330 3333337w3333330 3���337w9���33337ww333?9���333 7wws333w3333333 3333333w333333333333333?3333333 33?3333w33�3333 333333w3<�333333����?�<����Ù37wwwww�<����Ù37wwwwsw33<�33333373333�33�3330 33s3337w3333330 3333337w3333333333333333	NumGlyphsOnClickDelete1Click  TSpeedButtonFirstButtonLeftZTopWidthHeightHintFirst Record|Goto First Record
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 33333333333333333333333333333?33333333333?33�3333303333�38�33333 3333�3��33330 3333�83�3333  3333��3�3333   3333��3�3333   3333��3�3333  3333��3�33330 3333�8�33333 3333�3��3333303333�38�33333333333333�3333333333333333333333333333333333	NumGlyphsOnClickFirstButtonClick  TSpeedButton
PrevButtonLeftrTopWidthHeightHint$Previous Record|Goto Previous Record
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 33333333333333333333333333333?33333333333333�33333303333338�333333 333333��333330 3333383�33333  33333�3�33330  33338�3�33330  33338�3�33333  33333�3�333330 333338�333333 333333��33333303333338�33333333333333�3333333333333333333333333333333333	NumGlyphsOnClickPrevButtonClick  TSpeedButton
NextButtonLeft� TopWidthHeightHintNext Record|Goto Next Record
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 3333333333333333333333333333333333033333338�33333303333338�3333330 3333338��333330 333338�333330  333338�8�33330  33338�3�33330  33338�3�33330  333338�8333330 333338�333330 3333338�33333303333338�3333330333333383333333333333333333333333333333333333	NumGlyphsOnClickNextButtonClick  TSpeedButton
HelpButtonLeft� TopWidthHeightHintHelp|Show About Box
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 33333333333���3333?y33333�77?�33;����3337swsw?33��y��33s3733s�;������37�33�37�?������37337�37?����{���337�33��������337�3��������333w�3��w�y���3?�73����y���s�w�73s?��y��37�w��s7�;������37?7ww3733������33s�ws?s33;����3337s��w3333?��333337ww333	NumGlyphsOnClickAbout1Click  TSpeedButton
LastButtonLeft� TopWidthHeightHintLast Record|Goto Last Record
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 3333333333333333333333333333333333033333338�33�33303033338�38�3330 3033338��8�3330 033338�8�3330  033338�8��3330   33338�3��3330   33338�3��3330  033338�88�3330 033338�8�3330 3033338�38�33303033338�3833330333333383333333333333333333333333333333333333	NumGlyphsOnClickLastButtonClick   TOvcControllerOvcController1EntryCommands.TableListDefault	q   EpochlLeftTop  	TMainMenu	MainMenu1Left6Top 	TMenuItemFile1Caption&File 	TMenuItemNew1Caption&NewOnClick	New1Click  	TMenuItemOpen1Caption&OpenOnClick
Open1Click  	TMenuItemN1Caption-  	TMenuItemSave1Caption&SaveOnClick
Save1Click  	TMenuItemSaveAs1CaptionSave &AsOnClickSaveAs1Click  	TMenuItemN2Caption-  	TMenuItemExit1CaptionE&xitOnClick
Exit1Click   	TMenuItemEdit1Caption&Edit 	TMenuItemInsert1Caption&Insert RecordOnClickInsert1Click  	TMenuItemModify1Caption&Modify RecordOnClickModify1Click  	TMenuItemDelete1Caption&Delete RecordOnClickDelete1Click   	TMenuItemHelp1Caption&Help 	TMenuItemAbout1Caption&AboutOnClickAbout1Click    TOvcTransferOvcTransfer1LeftUTop  TOvcControllerOvcController2EntryCommands.TableListDefault	& (  EpochlLefttTop  TOpenDialogOpenDialog1
DefaultExtADRFilterAddress Files|*.ADROptionsofOverwritePromptofHideReadOnlyofPathMustExistofCreatePrompt TitleOpen Address BookLeft�Top  TSaveDialogSaveDialog1
DefaultExtADRFilterAddress Files|*.ADROptionsofOverwritePromptofHideReadOnlyofPathMustExistofCreatePrompt TitleSave Address BookLeft�Top   