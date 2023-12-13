

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		C_OBJECT:C1216(OBJ_FORM)
		OBJ_FORM:=New object:C1471
		OBJ_FORM.commands_all:=New collection:C1472
		OBJ_FORM.commands_all:=Get_list_command
		OBJ_FORM.commands_sel:=New collection:C1472
		
End case 
