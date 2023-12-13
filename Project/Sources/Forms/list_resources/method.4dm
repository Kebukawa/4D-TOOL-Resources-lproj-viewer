

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		C_OBJECT:C1216(OBJ_FORM)
		
		OBJ_FORM:=Form:C1466
		OBJ_FORM.resources_all:=New collection:C1472
		OBJ_FORM.resources_all:=Get_list_resources(OBJ_FORM)
		OBJ_FORM.resources_sel:=New collection:C1472
		
		
	: (Form event code:C388=On Unload:K2:2)
		
		
End case 
