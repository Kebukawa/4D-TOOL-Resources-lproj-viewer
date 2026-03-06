//Searchpicker sample code


Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		SearchPicker SET HELP TEXT(FORM Event:C1606.objectName; "Keyword")
		
		
	: (Form event code:C388=On Data Change:K2:15)
		
		Form:C1466.pict_sel:=New collection:C1472
		
		If (searchKeyword#"")
			Form:C1466.pict_sel:=Form:C1466.pict_all.query("file_path = :1"; "@"+searchKeyword+"@")
		Else 
			Form:C1466.pict_sel:=New collection:C1472
		End if 
		
		OBJECT Get pointer:C1124(Object named:K67:5; "result number")->:=Form:C1466.pict_sel.length
		
		//If (False)  // (Form.resources_sel.length>0)
		//For ($i; 1; Form.pict_all.length)
		//$code:=Choose(Form.pict_sel.query("resname = :1"; Form.pict_all[$i-1].resname).length=1; 0x00FFFF00; -255)
		//LISTBOX SET ROW COLOR(*; "List Box"; $i; $code; lk background color)
		//End for 
		//End if 
		
End case 

