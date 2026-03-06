

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.contents:=Folder:C1567(Application file:C491+Folder separator:K24:12+"Contents"+Folder separator:K24:12; fk platform path:K87:2)
		Form:C1466.rootPosition:=Length:C16(Form:C1466.contents.path)
		
		Form:C1466.resources_all:=cs:C1710.Resources.new().getResourceStrings(Form:C1466)
		Form:C1466.resources_sel:=Form:C1466.resources_all.copy()
		
End case 
