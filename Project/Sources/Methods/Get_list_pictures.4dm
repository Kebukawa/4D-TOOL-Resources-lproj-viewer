//%attributes = {"invisible":true}

C_OBJECT:C1216($1)

ON ERR CALL:C155("Error_Method")

$ref_bar:=Progress New

ARRAY TEXT:C222($codec_list; 0)
PICTURE CODEC LIST:C992($codec_list)
C_TEXT:C284($regx)
$regx:=".+\\.("
C_LONGINT:C283($i)
For ($i; 1; Size of array:C274($codec_list))
	$regx:=$regx+Substring:C12($codec_list{$i}; 2)+"|"
End for 
$regx:=Substring:C12($regx; 1; Length:C16($regx)-1)+")"

C_COLLECTION:C1488($pictures)
$pictures:=New collection:C1472

$path_folder:=$1.current_path

Progress SET MESSAGE($ref_bar; "リストの作成中")

DOCUMENT LIST:C474($path_folder; $document; Recursive parsing:K24:13)

C_LONGINT:C283($i)
For ($i; Size of array:C274($document); 1; -1)
	If (Not:C34(Match regex:C1019($regx; $document{$i})))
		DELETE FROM ARRAY:C228($document; $i)
	End if 
End for 


Progress SET MESSAGE($ref_bar; "リストに基づいてファイルを読み込み中")

C_OBJECT:C1216($obj_path)
C_PICTURE:C286($pict)

C_LONGINT:C283($max)
$max:=Size of array:C274($document)
For ($i; 1; $max)
	
	Progress SET PROGRESS($ref_bar; $i/$max; $document{$i})
	
	READ PICTURE FILE:C678($path_folder+$document{$i}; $pict)
	CONVERT PICTURE:C1002($pict; ".png")
	
	$obj_path:=Path to object:C1547($document{$i})
	$pictures.insert($pictures.length; New object:C1471("pict"; $pict; "size"; Picture size:C356($pict); "name"; $obj_path.name; "extension"; $obj_path.extension; "file_path"; $document{$i}))
	
End for 


Progress QUIT(0)
//Progress QUIT ($ref_bar)


$0:=$pictures

ON ERR CALL:C155("")
