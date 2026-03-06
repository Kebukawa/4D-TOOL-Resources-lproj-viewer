
Case of 
	: (Form event code:C388=On Double Clicked:K2:5)
		
		LISTBOX GET CELL POSITION:C971(*; FORM Event:C1606.objectName; $col; $row)
		If ($row#0)
			SHOW ON DISK:C922(Form:C1466.resources_sel[$row-1].platformPath)
		End if 
		
	: (Form event code:C388=On Clicked:K2:4) && (Right click:C712)
		
		
		
End case 
