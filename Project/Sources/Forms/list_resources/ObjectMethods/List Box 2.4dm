
Case of 
	: (Form event code:C388=On Double Clicked:K2:5)
		
		LISTBOX GET CELL POSITION:C971(*; OBJECT Get name:C1087(Object current:K67:2); $col; $row)
		If ($row#0)
			SHOW ON DISK:C922(Application file:C491+Folder separator:K24:12+"Contents"+Folder separator:K24:12+"Resources"+Form:C1466.resources_sel[$row-1].file_path)
		End if 
		
End case 
