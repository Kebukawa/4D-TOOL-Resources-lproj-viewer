

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Case of 
			: (OB Is defined:C1231(Form:C1466; "option")=False:C215)
				SET WINDOW TITLE:C213(Current process name:C1392)
				Form:C1466.option:=""
			: (Form:C1466.option="")
				SET WINDOW TITLE:C213(Current process name:C1392)
			Else 
				SET WINDOW TITLE:C213(Current process name:C1392+" ("+Form:C1466.option+")")
		End case 
		
		If (Form:C1466.option="")
			Form:C1466.current_path:=Application file:C491+Folder separator:K24:12+"Contents"  //+Folder separator
		Else 
			Form:C1466.current_path:=Application file:C491+Folder separator:K24:12+"Contents"+Folder separator:K24:12+"Resources"
		End if 
		
		
		Form:C1466.pict_all:=New collection:C1472
		Form:C1466.pict_all:=Get_list_pictures(Form:C1466)
		Form:C1466.pict_sel:=New collection:C1472
		
		
End case 
