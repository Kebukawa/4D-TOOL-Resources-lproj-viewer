
Case of 
		//MARK:-
	: (Form event code:C388=On Load:K2:1)
		
		var searchKeyword : Text
		SearchPicker SET HELP TEXT(FORM Event:C1606.objectName; "Keyword")
		
		
		//MARK:-
	: (Form event code:C388=On Data Change:K2:15)
		
		If (searchKeyword#"")
			
			Form:C1466.resources_sel:=Form:C1466.resources_all.query("resname = :1 or source = :1 or target = :1"; "@"+searchKeyword+"@")
			If (Form:C1466.resources_sel.length=0)
				Form:C1466.resources_sel:=Form:C1466.resources_all.query("file_path = :1"; "@"+searchKeyword+"@")
			End if 
			
		Else 
			
			Form:C1466.resources_sel:=Form:C1466.resources_all.copy()
			
		End if 
		
		OBJECT SET VALUE:C1742("result number"; String:C10(Form:C1466.resources_sel.length)+"/"+String:C10(Form:C1466.resources_all.length))
		
End case 

