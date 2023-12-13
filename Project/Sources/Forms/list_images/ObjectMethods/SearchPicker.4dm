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
			
			SearchPicker SET HELP TEXT($ObjectName; "Keyword")
			
		End if 
		
		
	: (Form event code:C388=On Data Change:K2:15)
		
		//C_COLLECTION($item)
		
		OBJ_FORM.pict_sel:=New collection:C1472
		
		If (fv_keyword#"")
			OBJ_FORM.pict_sel:=OBJ_FORM.pict_all.query("file_path = :1"; "@"+fv_keyword+"@")
		Else 
			OBJ_FORM.pict_sel:=New collection:C1472
		End if 
		
		OBJECT Get pointer:C1124(Object named:K67:5; "result number")->:=OBJ_FORM.pict_sel.length
		
		
		If (False:C215)  // (OBJ_FORM.resources_sel.length>0)
			For ($i; 1; OBJ_FORM.pict_all.length)
				$code:=Choose:C955(OBJ_FORM.pict_sel.query("resname = :1"; OBJ_FORM.pict_all[$i-1].resname).length=1; 0x00FFFF00; -255)
				LISTBOX SET ROW COLOR:C1270(*; "List Box"; $i; $code; lk background color:K53:25)
			End for 
		End if 
		
End case 

