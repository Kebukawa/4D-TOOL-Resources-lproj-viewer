


Case of 
	: (Form event code:C388=On Double Clicked:K2:5)
		
		C_TEXT:C284($name)
		C_LONGINT:C283($col; $row)
		
		$name:=OBJECT Get name:C1087(Object current:K67:2)
		LISTBOX GET CELL POSITION:C971(*; $name; $col; $row)
		
		If ($row>0)
			$url:="http://doc.4d.com/4dv17/help/command/ja/page"+OB Get:C1224(OBJ_FORM.commands_all[$row-1]; "number"; Is text:K8:3)+".html"
			ALERT:C41(OBJ_FORM.commands_all[$row-1].command+"\r"+$url)
			OPEN URL:C673($url)
		End if 
		
End case 
