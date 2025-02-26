
Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		// Init the var itself
		// this can be done anywhere else in your code
		
		C_TEXT:C284(fv_keyword)
		
		// the let's customise the SearchPicker (if needed)
		
		C_BOOLEAN:C305($Customise)
		$Customise:=True:C214
		
		C_TEXT:C284($ObjectName)
		$ObjectName:=OBJECT Get name:C1087(Object current:K67:2)
		
		// The exemple below shows how to set a label (ex : "name") inside the search zone
		
		If ($Customise)
			
			SearchPicker SET HELP TEXT($ObjectName; "Keyword")
			
		End if 
		
		
	: (Form event code:C388=On Data Change:K2:15)
		
		//C_COLLECTION($item)
		
		Form:C1466.resources_sel:=New collection:C1472
		
		If (fv_keyword#"")
			
			Form:C1466.resources_sel:=Form:C1466.resources_all.query("resname = :1 or source = :1 or target = :1"; "@"+fv_keyword+"@")
			If (Form:C1466.resources_sel.length=0)
				Form:C1466.resources_sel:=Form:C1466.resources_all.query("file_path = :1"; "@"+fv_keyword+"@")
			End if 
			
		Else 
			
			Form:C1466.resources_sel:=New collection:C1472
			
		End if 
		
		OBJECT Get pointer:C1124(Object named:K67:5; "result number")->:=Form:C1466.resources_sel.length
		
		
		//If (False)  // (Form.resources_sel.length>0)
		//For ($i;1;Form.resources_all.length)
		//$code:=Choose(Form.resources_sel.query("resname = :1";Form.resources_all[$i-1].resname).length=1;0x00FFFF00;-255)
		//LISTBOX SET ROW COLOR(*;"List Box";$i;$code;lk background color)
		//End for 
		//End if 
		
End case 

