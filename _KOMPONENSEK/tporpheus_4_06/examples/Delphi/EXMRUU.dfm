�
 TFORM1 0  TPF0TForm1Form1Left� TopkWidth�HeightMCaptionOrpheus MRU ExampleFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style Menu	MainMenu1PixelsPerInch`
TextHeight TMemoMemo1Left Top Width�HeightAlignalClientLines.StringsWThis example uses TOvcMenuMRU component to implement a most-recent-used file list. Two ^MRU lists are used. The first implements a traditional MRU list that appears on the File menu `above the Exit menu item. The second implements a Delphi-style split MRU list. This type of MRU fdisplays Delphi project files in the top portion of the MRU list and Delphi source files in the bottom^portion of the MRU list. You can see this type of MRU list by clicking on the Reopen menu itemon the File menu. ]Persistence of the MRU list is maintained through the TOvcComponentState and TOvcIniFileStorecomponents. TabOrder   	TMainMenu	MainMenu1LeftTop�  	TMenuItemFile1Caption&File 	TMenuItemOpen1Caption&Open...OnClick
Open1Click  	TMenuItemReopen1Caption&ReopenEnabled  	TMenuItemClearHistoryList1Caption&Clear History ListsOnClickClearHistoryList1Click  	TMenuItemN1Caption-  	TMenuItemExit1CaptionE&xitOnClick
Exit1Click    TOpenDialogOpenDialog1Left0Top�   TOvcComponentStateOvcComponentState1Active	SectionMRUListStorageOvcIniFileStore1StoredProperties.StringsDelphiList.ItemsFileMenuList.Items LeftXTop�   TOvcIniFileStoreOvcIniFileStore1IniFileName.INI	UseExeDirLeftXTop�   TOvcMenuMRU
DelphiListEnabled	
GroupIndex MaxMenuWidth� MenuItemReopen1OptionsmoAddAccelerators StylemsSplitVisible	OnClickOvcMRUClickLeftTop�   TOvcMenuMRUFileMenuList
AnchorItemExit1Enabled	
GroupIndex MaxMenuWidth� MenuItemFile1OptionsmoAddAcceleratorsmoAddSeparator Visible	OnClickOvcMRUClickLeft0Top�    