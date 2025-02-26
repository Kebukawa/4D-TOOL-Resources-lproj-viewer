


Case of 
	: (Form event code:C388=On Double Clicked:K2:5)
		
		C_TEXT:C284($name)
		C_LONGINT:C283($col; $row)
		
		$name:=OBJECT Get name:C1087(Object current:K67:2)
		LISTBOX GET CELL POSITION:C971(*; $name; $col; $row)
		
		//バージョンの文字列を得る
		$ver:=Application version:C493
		If ($ver[[3]]="0")
			$ver:=Substring:C12($ver; 1; 2)
		Else 
			$ver[[4]]:=$ver[[3]]
			$ver[[3]]:="R"
		End if 
		
		//リファレンスのリンクに飛ぶ
		If ($row>0)
			$url:="http://doc.4d.com/4Dv"+$ver+"/help/command/ja/page"+OB Get:C1224(Form:C1466.commands_all[$row-1]; "number"; Is text:K8:3)+".html"
			ALERT:C41(Form:C1466.commands_all[$row-1].command+"\r"+$url)
			OPEN URL:C673($url)
		End if 
		
End case 
