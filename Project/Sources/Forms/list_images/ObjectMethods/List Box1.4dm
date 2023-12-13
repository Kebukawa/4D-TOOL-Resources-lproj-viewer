
Case of 
	: (Form event code:C388=On Double Clicked:K2:5)
		
		C_TEXT:C284($name)
		$name:=OBJECT Get name:C1087(Object current:K67:2)
		
		C_LONGINT:C283($row; $col)
		LISTBOX GET CELL POSITION:C971(*; $name; $row; $col)
		
		
		If ($row>0)
			
			$path:=OBJ_FORM.current_path+OBJ_FORM.pict_sel[$row-1].file_path
			SHOW ON DISK:C922($path)
			
		End if 
		
		
		
End case 
