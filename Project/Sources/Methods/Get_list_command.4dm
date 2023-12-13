//%attributes = {"invisible":true}

C_COLLECTION:C1488($0; $cmd_list)
$cmd_list:=New collection:C1472

C_LONGINT:C283($i)
For ($i; 1; 5000)
	$name:=Command name:C538($i)
	If ($name#"")
		$cmd_list.insert($cmd_list.length; New object:C1471("command"; $name; "number"; $i))
	End if 
End for 

$0:=$cmd_list


