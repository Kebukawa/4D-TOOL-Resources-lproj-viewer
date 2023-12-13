

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		C_OBJECT:C1216(OBJ_FORM)
		OBJ_FORM:=Form:C1466
		
		Case of 
			: (OB Is defined:C1231(OBJ_FORM; "option")=False:C215)
				SET WINDOW TITLE:C213(Current process name:C1392)
				OBJ_FORM.option:=""
			: (OBJ_FORM.option="")
				SET WINDOW TITLE:C213(Current process name:C1392)
			Else 
				SET WINDOW TITLE:C213(Current process name:C1392+" ("+OBJ_FORM.option+")")
		End case 
		
		If (OBJ_FORM.option="")
			OBJ_FORM.current_path:=Application file:C491+Folder separator:K24:12+"Contents"  //+Folder separator
		Else 
			OBJ_FORM.current_path:=Application file:C491+Folder separator:K24:12+"Contents"+Folder separator:K24:12+"Resources"
		End if 
		
		
		OBJ_FORM.pict_all:=New collection:C1472
		OBJ_FORM.pict_all:=Get_list_pictures(OBJ_FORM)
		OBJ_FORM.pict_sel:=New collection:C1472
		
		
End case 
