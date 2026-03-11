
Case of 
		//mark:-
	: (Form event code:C388=On Double Clicked:K2:5)
		
		LISTBOX GET CELL POSITION:C971(*; FORM Event:C1606.objectName; $col; $row)
		If ($row#0)
			SHOW ON DISK:C922(Form:C1466.resources_sel[$row-1].platformPath)
		End if 
		
		
		//mark:-
	: (Form event code:C388=On Clicked:K2:4) && (Right click:C712)
		
		var $popup; $refMenuEdit : Text
		$popup:=Create menu:C408
		APPEND MENU ITEM:C411($popup; Get indexed string:C510(131; 21))  //copy the displayed value
		SET MENU ITEM PARAMETER:C1004($popup; -1; "copy")
		APPEND MENU ITEM:C411($popup; "-")
		APPEND MENU ITEM:C411($popup; Get indexed string:C510(10001; 1))  //show on disk
		SET MENU ITEM PARAMETER:C1004($popup; -1; "show")
		$select:=Dynamic pop up menu:C1006($popup)
		RELEASE MENU:C978($popup)
		
		If ($select#"")
			LISTBOX GET CELL POSITION:C971(*; OBJECT Get name:C1087; $col; $row)
		End if 
		
		Case of 
			: ($select="copy")
				//the displayed value ​​in the cell to the pasteboard
				LISTBOX GET ARRAYS:C832(*; OBJECT Get name:C1087; $arrColNames; $arrHeaderNames; $arrColVars; $arrHeaderVars; $arrColsVisible; $arrStyles)
				$formula:=LISTBOX Get column formula:C1202(*; $arrColNames{$col})
				$formula:="SET TEXT TO PASTEBOARD("+Replace string:C233($formula; "This."; "Form.listCurrent.")+")"
				EXECUTE FORMULA:C63($formula)
			: ($select="show")
				SHOW ON DISK:C922(Form:C1466.listCurrent.platformPath)
		End case 
		
		
End case 
