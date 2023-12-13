//%attributes = {}

C_OBJECT:C1216($1)

C_TEXT:C284($process_mane)
$process_mane:="display images"


$my_name:=Current process name:C1392

Case of 
		
	: ($my_name#$process_mane)
		
		C_TEXT:C284($text)
		$text:=Get selected menu item parameter:C1005
		
		If ($text="")
			
			$ref_proc:=New process:C317(Current method name:C684; 0; $process_mane)
			
		Else 
			
			$obj:=New object:C1471
			$obj.option:=$text
			
			$ref_proc:=New process:C317(Current method name:C684; 0; $process_mane; $obj)
			
		End if 
		
	Else 
		
		
		If (Count parameters:C259=0)
			$obj:=New object:C1471
		Else 
			$obj:=$1
		End if 
		
		
		$ref_window:=Open form window:C675("list_images")
		DIALOG:C40("list_images"; $obj)
		
End case 