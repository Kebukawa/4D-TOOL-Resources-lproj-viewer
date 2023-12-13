//%attributes = {"invisible":true}

C_OBJECT:C1216($1; $obj)
$obj:=$1

ON ERR CALL:C155("Error_Method")

$ref_bar:=Progress New

C_COLLECTION:C1488($resources)
$resources:=New collection:C1472

If ($obj.option="ALL")
	$path_folder:=Application file:C491+Folder separator:K24:12+"Contents"
Else 
	$path_folder:=Application file:C491+Folder separator:K24:12+"Contents"+Folder separator:K24:12+"Resources"  //+Folder separator+"ja.lproj"+Folder separator
End if 

Progress SET MESSAGE($ref_bar; "リストの作成中")

DOCUMENT LIST:C474($path_folder; $document; Recursive parsing:K24:13)

C_LONGINT:C283($i)
For ($i; Size of array:C274($document); 1; -1)
	Case of 
		: ($document{$i}="@.lproj@")
		: ($document{$i}="@.xlf")
		: ($document{$i}="@.xml")
		Else 
			DELETE FROM ARRAY:C228($document; $i)
	End case 
End for 


Progress SET MESSAGE($ref_bar; "リストに基づいてファイルを読み込み中")

C_LONGINT:C283($max)
$max:=Size of array:C274($document)
For ($i; 1; $max)
	
	Progress SET PROGRESS($ref_bar; $i/$max; $document{$i})
	
	
	$ref_doc:=Open document:C264($path_folder+$document{$i}; ""; Read mode:K24:5)
	If (OK=1)
		
		C_TEXT:C284($name; $prefix; $value_source; $value_target; $resname)
		ARRAY TEXT:C222($attrNames; 0)
		ARRAY TEXT:C222($attrValues; 0)
		
		Repeat 
			$MyEvent:=SAX Get XML node:C860($ref_doc)
			Case of 
				: ($MyEvent=XML start document:K45:7)
					
				: ($MyEvent=XML start element:K45:10)
					
					SAX GET XML ELEMENT:C876($ref_doc; $name; $prefix; $attrNames; $attrValues)
					
					$pos:=Find in array:C230($attrNames; "resname")
					If ($pos>0)
						$resname:=$attrValues{$pos}
					End if 
					
				: ($MyEvent=XML DATA:K45:12)
					
					Case of 
						: ($resname="")
							
						: ($name="source") & ($value_source="")
							SAX GET XML ELEMENT VALUE:C877($ref_doc; $value_source)
							
						: ($name="target")
							SAX GET XML ELEMENT VALUE:C877($ref_doc; $value_target)
							
					End case 
					
				: ($MyEvent=XML end element:K45:11)
					
					
					If ($resname#"") & ($name="target")
						
						$resources.insert($resources.length; New object:C1471("resname"; $resname; "source"; $value_source; "target"; $value_target; "file_path"; $document{$i}))
						
						$resname:=""
						$value_source:=""
						$value_target:=""
						
					End if 
					
					
					
				: ($MyEvent=XML comment:K45:8)
					
			End case 
		Until ($MyEvent=XML end document:K45:15)
		
		CLOSE DOCUMENT:C267($ref_doc)
		
	End if 
	
End for 


Progress QUIT(0)
//Progress QUIT ($ref_bar)


$0:=$resources

ON ERR CALL:C155("")
