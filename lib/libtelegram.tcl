# ---------------------------------------------------------------------------- #
# Telegram-API library v20171216                                               #
# This library has functions for interacting with the Telegram servers         #
#                                                                              #
# written by Eelco Huininga 2016-2017                                          #
# ---------------------------------------------------------------------------- #

namespace eval libtelegram {

# ---------------------------------------------------------------------------- #
# ::libtelegram::getMe                                                         #
# ---------------------------------------------------------------------------- #
# Get some basic information about the bot                                     #
# See also https://core.telegram.org/bots/api#getMe                            #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::getMe {} {
	global tg_bot_id tg_bot_token

	if { [ catch {
		set result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$tg_bot_id:$tg_bot_token/getMe]
	} ] } {
		putlog "Telegram-API: cannot connect to api.telegram.com using getMe method: $result"
		return -1
	}
	return $result
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::getUpdates                                                    #
# ---------------------------------------------------------------------------- #
# Receive incoming updates from the Telegram servers                           #
# See also https://core.telegram.org/bots/api#getUpdates                       #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::getUpdates {offset} {
	global tg_bot_id tg_bot_token

	if { [ catch {
		set result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$tg_bot_id:$tg_bot_token/getUpdates -d offset=$offset]
	} ] } {
		putlog "Telegram-API: cannot connect to api.telegram.com using getUpdates method: $result"
		return -1
	}
	return $result
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::sendChatAction                                                #
# ---------------------------------------------------------------------------- #
# Changes the bot's status in Telegram                                         #
# See also https://core.telegram.org/bots/api#sendChatAction                   #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendChatAction {chat_id action} {
	global tg_bot_id tg_bot_token

	if { [ catch {
		set result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$tg_bot_id:$tg_bot_token/sendChatAction -d chat_id=$chat_id -d action=$action]
	} ] } {
		putlog "Telegram-API: cannot connect to api.telegram.com using sendChatAction method: $result"
		return -1
	}
	return $result
}

# ---------------------------------------------------------------------------- #
# sendMessage: Sends a message to a chat group in Telegram                     #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendMessage {chat_id msg_id parse_mode message} {
	global tg_bot_id tg_bot_token tg_web_page_preview

	if { [ catch {
		set result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$tg_bot_id:$tg_bot_token/sendMessage -d disable_web_page_preview=$tg_web_page_preview -d chat_id=$chat_id -d parse_mode=$parse_mode -d reply_to_message_id=$msg_id -d text=$message]
	} ] } {
		putlog "Telegram-API: cannot connect to api.telegram.com using sendMessage reply method: $result"
		return -1
	}
	return $result
}

# ---------------------------------------------------------------------------- #
# sendPhoto: Sends a photo to a chat group in Telegram                         #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendPhoto {chat_id msg_id photo caption} {
	global tg_bot_id tg_bot_token

	if { [ catch {
		set result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$tg_bot_id:$tg_bot_token/sendPhoto -d chat_id=$chat_id -d reply_to_message_id=$msg_id -d photo=$photo -d caption=$caption]
	} ] } {
		putlog "Telegram-API: cannot connect to api.telegram.com using sendPhoto method: $result"
		return -1
	}
	return $result
}

# ---------------------------------------------------------------------------- #
# sendAudio: Sends a audio file to a chat group in Telegram                    #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendAudio {chat_id msg_id audio caption} {
	global tg_bot_id tg_bot_token

	if { [ catch {
		set result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$tg_bot_id:$tg_bot_token/sendAudio -d chat_id=$chat_id -d reply_to_message_id=$msg_id -d audio=$audio -d caption=$caption]
	} ] } {
		putlog "Telegram-API: cannot connect to api.telegram.com using sendAudio method: $result"
		return -1
	}
	return $result
}

# ---------------------------------------------------------------------------- #
# sendDocument: Sends a document to a chat group in Telegram                   #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendDocument {chat_id msg_id document caption} {
	global tg_bot_id tg_bot_token

	if { [ catch {
		set result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$tg_bot_id:$tg_bot_token/sendDocument -d chat_id=$chat_id -d reply_to_message_id=$msg_id -d document=$document -d caption=$caption]
	} ] } {
		putlog "Telegram-API: cannot connect to api.telegram.com using sendDocument method: $result"
		return -1
	}
	return $result
}

# ---------------------------------------------------------------------------- #
# sendVideo: Sends a video to a chat group in Telegram                         #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendVideo {chat_id msg_id video caption} {
	global tg_bot_id tg_bot_token

	if { [ catch {
		set result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$tg_bot_id:$tg_bot_token/sendVideo -d chat_id=$chat_id -d reply_to_message_id=$msg_id -d video=$video -d caption=$caption]
	} ] } {
		putlog "Telegram-API: cannot connect to api.telegram.com using sendVideo method: $result"
		return -1
	}
	return $result
}

# ---------------------------------------------------------------------------- #
# sendVoice: Sends a playable voice message to a chat group in Telegram        #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendVoice {chat_id msg_id voice caption} {
	global tg_bot_id tg_bot_token

	if { [ catch {
		set result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$tg_bot_id:$tg_bot_token/sendVoice -d chat_id=$chat_id -d reply_to_message_id=$msg_id -d voice=$voice -d caption=$caption]
	} ] } {
		putlog "Telegram-API: cannot connect to api.telegram.com using sendVoice method: $result"
		return -1
	}
	return $result
}

# ---------------------------------------------------------------------------- #
# sendVideoNote: Sends a video note to a chat group in Telegram                #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendVideoNote {chat_id msg_id video_note} {
	global tg_bot_id tg_bot_token

	if { [ catch {
		set result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$tg_bot_id:$tg_bot_token/sendVideoNote -d chat_id=$chat_id -d reply_to_message_id=$msg_id -d video_note=$video_note]
	} ] } {
		putlog "Telegram-API: cannot connect to api.telegram.com using sendVideoNote method: $result"
		return -1
	}
	return $result
}

# ---------------------------------------------------------------------------- #
# sendLocation: Sends a location to a chat group in Telegram                   #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendLocation {chat_id msg_id latitude longitude} {
	global tg_bot_id tg_bot_token

	if { [ catch {
		set result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$tg_bot_id:$tg_bot_token/sendLocation -d chat_id=$chat_id -d reply_to_message_id=$msg_id -d latitude=$latitude -d longitude=$longitude]
	} ] } {
		putlog "Telegram-API: cannot connect to api.telegram.com using sendLocation method: $result"
		return -1
	}
	return $result
}

# ---------------------------------------------------------------------------- #
# sendVenue: Sends a venue to a chat group in Telegram                         #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendVenue {chat_id msg_id latitude longitude title address} {
	global tg_bot_id tg_bot_token

	if { [ catch {
		set result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$tg_bot_id:$tg_bot_token/sendVenue -d chat_id=$chat_id -d reply_to_message_id=$msg_id -d latitude=$latitude -d longitude=$longitude -d title=$title -d address=$address]
	} ] } {
		putlog "Telegram-API: cannot connect to api.telegram.com using sendVenue method: $result"
		return -1
	}
	return $result
}

# ---------------------------------------------------------------------------- #
# sendContact: Sends a contact to a chat group in Telegram                     #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendContact {chat_id msg_id phone_number first_name last_name} {
	global tg_bot_id tg_bot_token

	if { [ catch {
		set result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$tg_bot_id:$tg_bot_token/sendContact -d chat_id=$chat_id -d reply_to_message_id=$msg_id -d phone_number=$phone_number -d first_name=$first_name -d last_name=$last_name]
	} ] } {
		putlog "Telegram-API: cannot connect to api.telegram.com using sendContact method: $result"
		return -1
	}
	return $result
}

# ---------------------------------------------------------------------------- #
# kickChatMember: Kicks an user from a chat group in Telegram                  #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::kickChatMember {chat_id user_id} {
	global tg_bot_id tg_bot_token

	if { [ catch {
		set result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$tg_bot_id:$tg_bot_token/kickChatMember -d chat_id=$chat_id -d user_id=$user_id]
	} ] } {
		putlog "Telegram-API: cannot connect to api.telegram.com using kickChatMember method: $result"
		return -1
	}
	return $result
}

# ---------------------------------------------------------------------------- #
# setChatPhoto: Sets the channel's profile photo of a chat group in Telegram   #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::setChatPhoto {chat_id photo} {
	global tg_bot_id tg_bot_token

	if { [ catch {
		set result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$tg_bot_id:$tg_bot_token/setChatPhoto -d chat_id=$chat_id -d photo=$photo]
	} ] } {
		putlog "Telegram-API: cannot connect to api.telegram.com using setChatPhoto method: $result"
		return -1
	}

	if {[jsonGetValue $result "" "ok"] eq "false"} {
		putlog "Telegram-API: bad result from setChatPhoto method: [jsonGetValue $result "" "description"]"
	}

	return $result
}

# ---------------------------------------------------------------------------- #
# setChatTitle: Sets the channel's profile title of a chat group in Telegram   #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::setChatTitle {chat_id title} {
	global tg_bot_id tg_bot_token

	if { [ catch {
		set result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$tg_bot_id:$tg_bot_token/setChatTitle -d chat_id=$chat_id -d title=$title]
	} ] } {
		putlog "Telegram-API: cannot connect to api.telegram.com using setChatTitle method: $result"
		return -1
	}

	if {[jsonGetValue $result "" "ok"] eq "false"} {
		putlog "Telegram-API: bad result from setChatTitle method: [jsonGetValue $result "" "description"]"
	}

	return $result
}

# ---------------------------------------------------------------------------- #
# tg_getChat: Get up to date information about the chat group in Telegram      #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::getChat {chat_id} {
	global tg_bot_id tg_bot_token

	if { [ catch {
		set result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$tg_bot_id:$tg_bot_token/getChat -d chat_id=$chat_id]
	} ] } {
		putlog "Telegram-API: cannot connect to api.telegram.com using getChat method: $result"
		return -1
	}
	return $result
}

# ---------------------------------------------------------------------------- #
# Get a list of administrators in a chat group in Telegram                     #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::getChatAdministrators {chat_id} {
	global tg_bot_id tg_bot_token

	if { [ catch {
		set result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$tg_bot_id:$tg_bot_token/getChatAdministrators -d chat_id=$chat_id]
	} ] } {
		putlog "Telegram-API: cannot connect to api.telegram.com using getChatAdministrators method: $result"
		return -1
	}
	return $result
}

# ---------------------------------------------------------------------------- #
# Get the number of members in a chat group in Telegram                        #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::getChatMembersCount {chat_id} {
	global tg_bot_id tg_bot_token

	if { [ catch {
		set result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$tg_bot_id:$tg_bot_token/getChatMembersCount -d chat_id=$chat_id]
	} ] } {
		putlog "Telegram-API: cannot connect to api.telegram.com using getChatMembersCount method: $result"
		return -1
	}
	return $result
}

# ---------------------------------------------------------------------------- #
# Get information about a member of a chat group in Telegram                   #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::getChatMember {chat_id user_id} {
	global tg_bot_id tg_bot_token

	if { [ catch {
		set result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$tg_bot_id:$tg_bot_token/getChatMember -d chat_id=$chat_id -d user_id=$user_id]
	} ] } {
		putlog "Telegram-API: cannot connect to api.telegram.com using getChatMember method: $result"
		return -1
	}
	return $result
}

}
