//%attributes = {}

C_TEXT:C284($process_mane)
$process_mane:="display commands"


$my_name:=Current process name:C1392

If ($my_name#$process_mane)
	
	$ref_proc:=New process:C317(Current method name:C684; 0; $process_mane)
	
Else 
	
	$ref_window:=Open form window:C675("list_command")
	DIALOG:C40("list_command")
	
End if 