//Searchpicker sample code


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
			
			SearchPicker SET HELP TEXT($ObjectName; "Command")
			
		End if 
		
		
	: (Form event code:C388=On Data Change:K2:15)
		
		If (fv_keyword#"")
			OBJ_FORM.commands_sel:=OBJ_FORM.commands_all.query("command = :1"; "@"+fv_keyword+"@")
		Else 
			OBJ_FORM.commands_sel:=New collection:C1472
		End if 
		
		OBJECT Get pointer:C1124(Object named:K67:5; "result number")->:=OBJ_FORM.commands_sel.length
		
		
		
End case 

