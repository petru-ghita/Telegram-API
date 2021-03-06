# ---------------------------------------------------------------------------- #
# Telegram-API Sticker module for Eggdrop v20180211                            #
#                                                                              #
# written by Eelco Huininga 2016-2018                                          #
# ---------------------------------------------------------------------------- #

# ---------------------------------------------------------------------------- #
# Replace sticker code with ASCII code                                         #
# ---------------------------------------------------------------------------- #
proc sticker2ascii {file_id} {
	global stickertable

	foreach {filedesc stickerdesc} [array get stickertable] {
		if {$file_id == $filedesc} {
			return $stickerdesc
		}
	}

	return [::msgcat::mc MSG_TG_UNKNOWNSTICKER]
}

# ---------------------------------------------------------------------------- #
# Sticker set definitions                                                      #
# ---------------------------------------------------------------------------- #

array set stickersets {
	{TelegramGreatMinds}	{"Great Minds"}
	{EvilMinds}		{"Evil Minds"}
}

array set stickertable {
	# Great minds stickerset
	{CAADBAADGQADyIsGAAFl6KYZBflVyQI}	{"Abraham Lincoln - https://telegram.org/file/811140066/1/7fM-CwKk4F0/53f9f1fc731c63547d"}
	{CAADBAADIQADyIsGAAHaCFln7THl9QI}	{"Albert Einstein - https://telegram.org/file/811140981/1/9ypk7z_8T4Q/4381a7a74256fe0b9b"}
	{CAADBAADOAADyIsGAAE7re09I3hMQwI}	{"Arthur C. Doyle - "}
	{CAADBAADKQADyIsGAAEPYMQ7iT8jRgI}	{"Audrey Hepburn - https://telegram.org/file/811140508/1/0BiCdZ28uVw/ca64f37939b1bdea11"}
	{CAADBAADPAADyIsGAAHP7udlFGeCVgI}	{"Benjamin Franklin - "}
	{CAADBAADJQADyIsGAAGoEDksgR1WpAI}	{"Bob Marley - https://telegram.org/file/811140235/2/_ZthaAI89Ds/4a2f85c6feac9e1bca"}
	{CAADBAADPQADyIsGAAER4mZIkRHRsgI}	{"Bruce Lee - "}
	{CAADBAADHQADyIsGAAFsLeimr-HBPAI}	{"Charlie Chaplin - https://telegram.org/file/811140437/2/VdpCps5zB1o/c906dac5e81170dc74"}
	{CAADBAADQwADyIsGAAHtlVE1rDyZXQI}	{"Che Guevaris - "}
	{CAADBAADJAADyIsGAAGbgy1wIY571wI}	{"Cleopatra - https://telegram.org/file/811140617/2/JdFfZi4Ruhk/3444e8ea6e1a88ace4"}
	{CAADBAADKAADyIsGAAHTcQFJMaFa0QI}	{"Coco Chanel - https://telegram.org/file/811140860/1/_sVhXePrr-I/02a6e44c917d7c7f6f"}
	{CAADBAADMAADyIsGAAEq-fQsNrRXjAI}	{"Dante Alighieri - https://telegram.org/file/811140444/1/NqWMRLWzg1U/623bd278ff0179ded9"}
	{CAADBAADIwADyIsGAAHeuQrNOU12cgI}	{"Edgar Allan Poe - https://telegram.org/file/811140654/1/xFdm58wPNH4/191814f44f5d36f9a4"}
	{CAADBAADNgADyIsGAAFUgH2PcO7e6QI}	{"Edvard Munch - "}
	{CAADBAADPwADyIsGAAGI1S2AmQ002AI}	{"Elvis Presley - "}
	{CAADBAADNwADyIsGAAFOgk-EJUfH-gI}	{"Ervin Shryodinger - "}
	{CAADBAADFgADyIsGAAGo-jfilnNJyAI}	{"Franz Kafka - https://telegram.org/file/811140332/2/KJzzslK440U/b11181fd7bbf1c56aa"}
	{CAADBAADQAADyIsGAAE7MpzFPFQX5QI}	{"Freddy Mercury - "}
	{CAADBAADMgADyIsGAAGw4osRBXRB3AI}	{"Frederik Douglas - https://telegram.org/file/811140519/1/8vLtx2w3n10/2a603572363d422fc0"} 
	{CAADBAADMwADyIsGAAFI6xgyK-qNMgI}	{"George Carlin - "}
	{CAADBAADRQADyIsGAAH1EiOQIkWtagI}	{"George Orwell - "}
	{CAADBAADNAADyIsGAAGjDT0cxHKm2gI}	{"George Washington - "}
	{CAADBAADOQADyIsGAAG3aA9Q2a6wywI}	{"Howard Lavkraft - "}
	{CAADBAADRAADyIsGAAFtStkoP5sgQQI}	{"Isaac Newton - "}
	{CAADBAADLQADyIsGAAGJcalkB0bXSQI}	{"Jay Hawkins - https://telegram.org/file/811140885/1/r4SVbb90Quc/7333932a5fdcf5f057"}
	{CAADBAADLgADyIsGAAGPsGcNmlLjPQI}	{"Jimi Hendrix - https://telegram.org/file/811140525/2/vCDL8Gv_k6U/a39c95e5aa621c46c6"}
	{CAADBAADOgADyIsGAAH3hdtO3aqUpwI}	{"Jeanne d'Arc - "}
	{CAADBAADGAADyIsGAAGsLFQJpxof0QI}	{"John Lennon - https://telegram.org/file/811140517/1/yDccYORy60c/da6c69de6ad5afcb8f"}
	{CAADBAADFAADyIsGAAFXtQ3Z4ZqdLAI}	{"J.R.R. Tolkien - https://telegram.org/file/811140679/1/qyTW5F98KLA/ed2db7cc24b8938e07"}
	{CAADBAADEgADyIsGAAE-gRk5Wrs8NwI}	{"Julius Cesar approves - https://telegram.org/file/811140007/2/uHbXgsdVXQY/a75eee858dd829fb89"}
	{CAADBAADIAADyIsGAAGwI-I5pMSEdQI}	{"Julius Cesar disapproves - https://telegram.org/file/811140801/1/14Ka_5LSkus/11ef924b87783bd339"}
	{CAADBAADPgADyIsGAAEuCrQ7AXgedwI}	{"Kurt Cobain - "}
	{CAADBAADRgADyIsGAAF-kAhqVu7-1QI}	{"Leopold von Sacher-Masoch - "}
	{CAADBAADQQADyIsGAAHv8OkTOGk0SwI}	{"Louis Armstrong - "}
	{CAADBAADGwADyIsGAAE68wt0DU90mgI}	{"Mahatma Gandhi - https://telegram.org/file/811140053/1/A6JVcXDZiZM/d28d4a5029d010e953"}
	{CAADBAADLwADyIsGAAHjj-PTeuEdBgI}	{"Malcom X - https://telegram.org/file/811140689/2/VQ95ysNb35U/4adabae15888ee9b37"}
	{CAADBAADEAADyIsGAAFCZre3kULkngI}	{"Marilyn Monroe - https://telegram.org/file/811140117/2/dGMVFePbDos/68ae9b4e90b10c1fb8"}
	{CAADBAADHwADyIsGAAFHId3ggt-PAAEC}	{"Mark Twain - https://telegram.org/file/811140849/1/cpP6i93xxaA/c082e8a2ad59522cfd"}
	{CAADBAADMQADyIsGAAEX-8KrVIT5lwI}	{"Napoleon Bonaparte - https://telegram.org/file/811140354/1/-NUBye754Pw/2fa1e3148047b624b3"}
	{CAADBAADFQADyIsGAAHPdbDyCcpB8gI}	{"Nikola Tesla - "}
	{CAADBAADLAADyIsGAAF6cRm5hiOkCAI}	{"Princess Diana - https://telegram.org/file/811140066/2/mv4D4qzDys8/d19275c7c681c63367"}
	{CAADBAADEwADyIsGAAHgGKfPXeaQDAI}	{"Richard Wagner - https://telegram.org/file/811140446/1/ZOVGuV17wSI/932a093624e7bec4c9"}
	{CAADBAADHAADyIsGAAFzjQavel2uswI}	{"Salvador Dali - https://telegram.org/file/811140579/1/i974MzakdcM/7752f8ee0262a57fdd"}
	{CAADBAADGgADyIsGAAHw_WAnR5mwUAI}	{"Siegmund Freud - https://telegram.org/file/811140811/2/FJWJRL9vxME/b44ed832aced2e6dc7"}
	{CAADBAADFwADyIsGAAF1CK9t7qjAigI}	{"Steve Jobs - https://telegram.org/file/811140823/2/gEXq-ZISs9g/55f6c9c9f87c4dceb0"}
	{CAADBAADJwADyIsGAAH6wu4EMqyrvgI}	{"Virginia Vulf - https://telegram.org/file/811140251/1/kjMKzKP2S6o/16635fe8e0485bd0b8"}
	{CAADBAADNQADyIsGAAF_Q3DFvKDCzgI}	{"Walt Disney - "}
	{CAADBAADQgADyIsGAAHbkbbtFVHNZAI}	{"Whitney Houston - "}
	{CAADBAADOwADyIsGAAFClAdwTFmgJwI}	{"Wilhelm Konrad Rontgen - "}
	{CAADBAADRwADyIsGAAGQU-a9UvB-xQI}	{"William Shakespear - "}

	# Evil minds stickerset
	{CAADAgADhQMAAgi3GQJJ-luqZysfcQI}	{"Adolf Hitler"}
	{CAADAgADDAQAAgi3GQLZhDzBxoQ47gI}	{"Albert de Gondi"}
	{CAADAgADDwQAAgi3GQKn6x4arMBASgI}	{"Albert Fish"}
	{CAADAgADLwQAAgi3GQIqOMZ-BTCsXAI}	{"Aleister Crowley"}
	{CAADAgADIQQAAgi3GQJm4nUGNLXssAI}	{"Anton LaVey"}
	{CAADAgADgwMAAgi3GQJR9yC4FrbWZAI}	{"Benito Mussolini"}
	{CAADAgADlgMAAgi3GQL1c5fysxo50QI}	{"Caligula"}
	{CAADAgADEgQAAgi3GQKgpTqoAoh63AI}	{"Elisabeth Bathory"}
	{CAADAgADgQMAAgi3GQIiG0lIV05f5AI}	{"Grigori Rasputin"}
	{CAADAgADiQMAAgi3GQJ7vTUBG994kQI}	{"Heinrich Himmler"}
	{CAADAgADHQQAAgi3GQLlWmBAyRLdAAEC}	{"Herod the Great"}
	{CAADAgADjQMAAgi3GQLa8GKrKtcI8wI}	{"Idi Amin Dada"}
	{CAADAgADhwMAAgi3GQJaBKaj3TGUPAI}	{"Ioseb Goebbels"}
	{CAADAgADkwMAAgi3GQIl7uGVipqu-QI}	{"Ivan the Terrible"}
	{CAADAgADHwQAAgi3GQID7ia8R0aqJgI}	{"Jim Jones"}
	{CAADAgADLQQAAgi3GQJ-iD6c-tUyxwI}	{"John Wilks Booth"}
	{CAADAgADiwMAAgi3GQJbJJ5TL4zWFAI}	{"Joseph Stalin"}
	{CAADAgADdQMAAgi3GQJVu8dRhRDFhwI}	{"Judas Iscariot"}
	{CAADAgADMQQAAgi3GQI12tfK6nbikQI}	{"Mao Zedong"}
	{CAADAgADKQQAAgi3GQJ45o2-bRDUZwI}	{"Nero Germanicus"}
	{CAADAgADkQMAAgi3GQJnw6KGbwNtmwI}	{"Osama Bin Laden"}
	{CAADAgADGwQAAgi3GQIAARgrCY1-Kg8C}	{"Pablo Escobar"}
	{CAADAgADKwQAAgi3GQJIDzoO-7w0jAI}	{"Pol Pot"}
	{CAADAgADfwMAAgi3GQImCrotVl2jpQI}	{"Pope Alexander VI"}
	{CAADAgADjwMAAgi3GQLeZcznLRZS9QI}	{"Saddam Hussein"}
	{CAADAgADfQMAAgi3GQLJsHVGG7QJ2gI}	{"Tomas de Torquemada"}
	{CAADAgADJQQAAgi3GQKS4b910iYMrgI}	{"Victor Lustig"}
	{CAADAgADeQMAAgi3GQIE0j5N4LIhQQI}	{"Vlad the Impaler"}
	{CAADAgADIwQAAgi3GQIp7k4OQeIooQI}	{"Vladimir Lenin"}
	{CAADAgAD6wcAAgi3GQLh6oKAnDyHSAI}	{"unknown military guy with sunglasses saluting"}
}
