/*

Searchpicker

*/




Case of 
		//MARK:-
	: (Form event code:C388=On Load:K2:1)
		
		var searchKeyword : Text
		SearchPicker SET HELP TEXT(FORM Event:C1606.objectName; "Command")
		
		
		//MARK:-
	: (Form event code:C388=On Data Change:K2:15)
		
		If (searchKeyword#"")
			Form:C1466.commands_sel:=Form:C1466.commands_all.query("command = :1"; "@"+searchKeyword+"@")
		Else 
			Form:C1466.commands_sel:=New collection:C1472
		End if 
		
		OBJECT Get pointer:C1124(Object named:K67:5; "result number")->:=Form:C1466.commands_sel.length
		
		
		
End case 

