

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.resources_all:=New collection:C1472
		Form:C1466.resources_all:=Get_list_resources(Form:C1466)
		Form:C1466.resources_sel:=New collection:C1472
		
		
	: (Form event code:C388=On Unload:K2:2)
		
		
End case 
