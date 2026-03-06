//%attributes = {}

#DECLARE($option : Object)

var $process_mane : Text
$process_mane:="display resources"

var $my_name : Text
$my_name:=Current process name:C1392

Case of 
		//MARK:-
	: ($my_name#($process_mane+"@"))
		
		var $param : Text
		$param:=Get selected menu item parameter:C1005
		
		If ($param="")
			$ref_proc:=New process:C317(Current method name:C684; 0; $process_mane; *)
		Else 
			$ref_proc:=New process:C317(Current method name:C684; 0; $process_mane+"("+$param+")"; {scope: $param}; *)
		End if 
		
		BRING TO FRONT:C326($ref_proc)
		
		
		//MARK:-
	Else 
		
		If ($option=Null:C1517)
			$option:=New object:C1471
		End if 
		
		$ref_window:=Open form window:C675("list_resources")
		DIALOG:C40("list_resources"; $option)
		
End case 