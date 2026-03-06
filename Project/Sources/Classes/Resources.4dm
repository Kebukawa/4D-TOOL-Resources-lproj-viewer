
Class constructor
	
	//MARK:-
Function getIncludeFiles($option : Object)->$files : Collection
	
	
	$list:=New collection:C1472
	
	
	If (String:C10($option.scope)="all")
		$path:=Application file:C491+Folder separator:K24:12+"Contents"+Folder separator:K24:12
	Else 
		$path:=Application file:C491+Folder separator:K24:12+"Contents"+Folder separator:K24:12+"Resources"+Folder separator:K24:12  //+Folder separator+"ja.lproj"+Folder separator
	End if 
	
	$files:=Folder:C1567($path; fk platform path:K87:2).files(fk recursive:K87:7)
	
	$files:=$files.query("extension = :1 or extension = :2 or extension = :3"; "@.lproj@"; "@.xlf"; "@.xml")
	
	
	//MARK:-
Function getResourceStrings($option : Object)->$resources : Collection
	
	ON ERR CALL:C155("Error_Method")
	
	$ref_bar:=Progress New
	
	var $resources : Collection
	$resources:=New collection:C1472
	
	Progress SET MESSAGE($ref_bar; "リストの作成中")
	
	$contents:=Folder:C1567(Application file:C491+Folder separator:K24:12+"Contents"+Folder separator:K24:12; fk platform path:K87:2)
	
	$list:=This:C1470.getIncludeFiles($option)
	
	Progress SET MESSAGE($ref_bar; "リストに基づいてファイルを読み込み中")
	
	var $file : 4D:C1709.File
	var $name; $prefix; $value_source; $value_target; $resname : Text
	
	
	//MARK: Resource from XML file
	
	$i:=0
	For each ($file; $list)
		
		$i+=1
		Progress SET PROGRESS($ref_bar; $i/$list.length; $file.fullName)
		
		//MARK:+ start XML Parse
		$ref_doc:=Open document:C264($file.platformPath; ""; Read mode:K24:5)
		If (OK=1)
			
			ARRAY TEXT:C222($attrNames; 0)
			ARRAY TEXT:C222($attrValues; 0)
			
			Repeat 
				$MyEvent:=SAX Get XML node:C860($ref_doc)
				Case of 
					: ($MyEvent=XML start document:K45:7)
						
						//MARK:++ SAX Event = XML start element
						
					: ($MyEvent=XML start element:K45:10)
						
						//MARK:++ XML start element
						SAX GET XML ELEMENT:C876($ref_doc; $name; $prefix; $attrNames; $attrValues)
						
						$pos:=Find in array:C230($attrNames; "resname")
						If ($pos>0)
							$resname:=$attrValues{$pos}
						End if 
						
					: ($MyEvent=XML DATA:K45:12)
						
						//MARK:++ SAX Event = XML DATA
						Case of 
							: ($resname="")
								
							: ($name="source") & ($value_source="")
								SAX GET XML ELEMENT VALUE:C877($ref_doc; $value_source)
								
							: ($name="target")
								SAX GET XML ELEMENT VALUE:C877($ref_doc; $value_target)
								
						End case 
						
					: ($MyEvent=XML end element:K45:11)
						
						//MARK:++ SAX Event = XML end element
						
						If ($resname#"") & ($name="target") & ($value_source#"")
							$resources.insert($resources.length; New object:C1471("resname"; $resname; "source"; $value_source; "target"; $value_target; "path"; $file.path; "platformPath"; $file.platformPath))
							$value_source:=""
							$value_target:=""
						End if 
						
					: ($MyEvent=XML comment:K45:8)
						
						//MARK:++ SAX Event = XML comment
						
				End case 
			Until ($MyEvent=XML end document:K45:15)
			
			//MARK:+ end XML Parse
			
			CLOSE DOCUMENT:C267($ref_doc)
			
		End if 
		
	End for each 
	
	Progress QUIT($ref_bar)
	
	$0:=$resources
	
	ON ERR CALL:C155("")
	