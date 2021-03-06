# ---------------------------------------------------------------------------- #
# Telegram API library for Tcl - v20180216                                     #
# This library has functions for interacting with the Telegram servers         #
#                                                                              #
# written by Eelco Huininga 2016-2018                                          #
# ---------------------------------------------------------------------------- #

namespace eval libtelegram {
	variable	::libtelegram::bot_id
	variable	::libtelegram::bot_token
	variable	::libtelegram::result
	variable	::libtelegram::errorMessage
	variable	::libtelegram::errorNumber
	set		::libtelegram::max_file_size	20480000
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::getUpdates                                                    #
# ---------------------------------------------------------------------------- #
# Receive incoming updates from the Telegram servers                           #
# https://core.telegram.org/bots/api#getUpdates                                #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::getUpdates {offset} {
	if { [catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/getUpdates -d offset=$offset]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::getUpdates: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::getUpdates: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errorNumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::setWebHook                                                    #
# ---------------------------------------------------------------------------- #
# Specify a url and receive incoming updates via an outgoing webhook           #
# https://core.telegram.org/bots/api#setwebhook                                #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::setWebHook {url certificate max_connections allowed_updates} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/setWebHook -d url=$url -d certificate=$certificate -d max_connections=$max_connections -d allowed_updates=$allowed_updates]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::setWebHook: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::setWebHook: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errorNumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::deleteWebHook                                                 #
# ---------------------------------------------------------------------------- #
# Removes a webhook                                                            #
# https://core.telegram.org/bots/api#deletewebhook                             #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::deleteWebHook {} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/deleteWebHook]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::deleteWebHook: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::deleteWebHook: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errorNumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::getWebHookInfo                                                #
# ---------------------------------------------------------------------------- #
# Returns info on the current webhook                                          #
# https://core.telegram.org/bots/api#getwebhookinfo                            #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::getWebHookInfo {} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/getWebHookInfo]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::getWebHookInfo: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::getWebHookInfo: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errorNumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::getMe                                                         #
# ---------------------------------------------------------------------------- #
# Get some basic information about the bot                                     #
# https://core.telegram.org/bots/api#getMe                                     #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::getMe {} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/getMe]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::getMe: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::getMe: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::sendMessage                                                   #
# ---------------------------------------------------------------------------- #
# Sends a message to a chat group in Telegram                                  #
# https://core.telegram.org/bots/api#sendmessage                               #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendMessage {chat_id msg_id parse_mode message} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/sendMessage -d disable_web_page_preview=$::telegram::tg_web_page_preview -d chat_id=$chat_id -d parse_mode=$parse_mode -d reply_to_message_id=$msg_id -d text=$message]
	} ] } {
		putlog "[set ::libtelegram::errorMessage "libtelegram::sendMessage: cannot connect to api.telegram.com."]"
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			putlog "[set ::libtelegram::errorMessage "libtelegram::sendMessage: $::libtelegram::errorNumber - $::libtelegram::errorMessage"]"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::forwardMessage                                                #
# ---------------------------------------------------------------------------- #
# Forwards a message to a user or a chat group in Telegram                     #
# https://core.telegram.org/bots/api#forwardmessage                            #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::forwardMessage {chat_id from_chat_id disable_notification message_id} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/forwardMessage -d chat_id=$chat_id -d from_chat_id=$from_chat_id -d disable_notification=$disable_notification -d message_id=$message_id]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::forwardMessage: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::forwardMessage: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::sendPhoto                                                     #
# ---------------------------------------------------------------------------- #
# sendPhoto: Sends a photo to a chat group in Telegram                         #
# https://core.telegram.org/bots/api#sendphoto                                 #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendPhoto {chat_id msg_id photo parse_mode caption} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/sendPhoto -d chat_id=$chat_id -d reply_to_message_id=$msg_id -d photo=$photo -d parse_mode=$parse_mode -d caption=$caption]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::sendPhoto: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::sendPhoto: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::sendAudio                                                     #
# ---------------------------------------------------------------------------- #
# sendAudio: Sends a audio file to a chat group in Telegram                    #
# https://core.telegram.org/bots/api#sendaudio                                 #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendAudio {chat_id msg_id audio parse_mode caption} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/sendAudio -d chat_id=$chat_id -d reply_to_message_id=$msg_id -d audio=$audio -d parse_mode=$parse_mode -d caption=$caption]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::sendAudio: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::sendAudio: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::sendDocument                                                  #
# ---------------------------------------------------------------------------- #
# sendDocument: Sends a document to a chat group in Telegram                   #
# https://core.telegram.org/bots/api#senddocument                              #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendDocument {chat_id msg_id document parse_mode caption} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/sendDocument -d chat_id=$chat_id -d reply_to_message_id=$msg_id -d document=$document -d parse_mode=$parse_mode -d caption=$caption]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::sendDocument: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::sendDocument: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::sendVideo                                                     #
# ---------------------------------------------------------------------------- #
# sendVideo: Sends a video to a chat group in Telegram                         #
# https://core.telegram.org/bots/api#sendvideo                                 #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendVideo {chat_id msg_id video parse_mode caption} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/sendVideo -d chat_id=$chat_id -d reply_to_message_id=$msg_id -d video=$video -d parse_mode=$parse_mode -d caption=$caption]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::sendVideo: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::sendVideo: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::sendVoice                                                     #
# ---------------------------------------------------------------------------- #
# sendVoice: Sends a playable voice message to a chat group in Telegram        #
# https://core.telegram.org/bots/api#sendvoice                                 #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendVoice {chat_id msg_id voice parse_mode caption} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/sendVoice -d chat_id=$chat_id -d reply_to_message_id=$msg_id -d voice=$voice -d parse_mode=$parse_mode -d caption=$caption]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::sendVoice: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::sendVoice: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::sendVideoNote                                                 #
# ---------------------------------------------------------------------------- #
# sendVideoNote: Sends a video note to a chat group in Telegram                #
# https://core.telegram.org/bots/api#sendvideonote                             #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendVideoNote {chat_id msg_id video_note} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/sendVideoNote -d chat_id=$chat_id -d reply_to_message_id=$msg_id -d video_note=$video_note]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::sendVideoNote: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::sendVideoNote: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::sendMediaGroup                                                #
# ---------------------------------------------------------------------------- #
# sendMediaGroup: Sends a group of photos or videos as an album                #
# https://core.telegram.org/bots/api#sendmediagroup                            #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendMediaGroup {chat_id media disable_notification reply_to_msg_id} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/sendMediaGroup -d chat_id=$chat_id -d disable_notification=$disable_notification -d reply_to_message_id=$reply_to_msg_id]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::sendMediaGroup: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::sendMediaGroup: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::sendLocation                                                  #
# ---------------------------------------------------------------------------- #
# sendLocation: Sends a location to a chat group in Telegram                   #
# https://core.telegram.org/bots/api#sendlocation                              #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendLocation {chat_id msg_id latitude longitude} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/sendLocation -d chat_id=$chat_id -d reply_to_message_id=$msg_id -d latitude=$latitude -d longitude=$longitude]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::sendLocation: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::sendLocation: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::sendVenue                                                     #
# ---------------------------------------------------------------------------- #
# Sends a venue to a chat group in Telegram                                    #
# https://core.telegram.org/bots/api#sendvenue                                 #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendVenue {chat_id msg_id latitude longitude title address} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/sendVenue -d chat_id=$chat_id -d reply_to_message_id=$msg_id -d latitude=$latitude -d longitude=$longitude -d title=$title -d address=$address]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::sendVenue: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::sendVenue: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::sendContact                                                   #
# ---------------------------------------------------------------------------- #
# Sends a contact to a chat group in Telegram                                  #
# https://core.telegram.org/bots/api#sendcontact                               #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendContact {chat_id msg_id phone_number first_name last_name} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/sendContact -d chat_id=$chat_id -d reply_to_message_id=$msg_id -d phone_number=$phone_number -d first_name=$first_name -d last_name=$last_name]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::sendContact: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::sendContact: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::sendChatAction                                                #
# ---------------------------------------------------------------------------- #
# Changes the bot's status in Telegram                                         #
# https://core.telegram.org/bots/api#sendChatAction                            #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::sendChatAction {chat_id action} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/sendChatAction -d chat_id=$chat_id -d action=$action]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::sendChatAction: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::sendChatAction: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::getUserProfilePhotos                                          #
# ---------------------------------------------------------------------------- #
# Changes the bot's status in Telegram                                         #
# https://core.telegram.org/bots/api#getuserprofilephotos                      #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::getUserProfilePhotos {user_id offset limit} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/getUserProfilePhotos -d user_id=$user_id -d offset=$offset -d limit=$limit]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::getUserProfilePhotos: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::getUserProfilePhotos: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::getFile                                                       #
# ---------------------------------------------------------------------------- #
# Changes the bot's status in Telegram                                         #
# https://core.telegram.org/bots/api#getfile                                   #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::getFile {file_id} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/getFile -d file_id=$file_id]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::getFile: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::getFile: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::kickChatMember                                                #
# ---------------------------------------------------------------------------- #
# Kicks an user from a chat group or channel in Telegram                       #
# https://core.telegram.org/bots/api#kickchatmember                            #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::kickChatMember {chat_id user_id until_date} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/kickChatMember -d chat_id=$chat_id -d user_id=$user_id -d until_date=$until_date]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::kickChatMember: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::kickChatMember: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::unbanChatMember                                               #
# ---------------------------------------------------------------------------- #
# Unbans a previously kicked user from a chat group or channel in Telegram     #
# https://core.telegram.org/bots/api#unbanchatmember                           #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::unbanChatMember {chat_id user_id} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/unbanChatMember -d chat_id=$chat_id -d user_id=$user_id]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::unbanChatMember: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::unbanChatMember: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::restrictChatMember                                            #
# ---------------------------------------------------------------------------- #
# Restrict a user in a chat group or channel in Telegram                       #
# https://core.telegram.org/bots/api#restrictchatmember                        #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::restrictChatMember {chat_id user_id until_date can_send_messages can_send_media_messages can_send_other_messages can_add_web_page_previews} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/restrictChatMember -d chat_id=$chat_id -d user_id=$user_id -d until_date=$until_date -d can_send_messages=$can_send_messages -d can_send_media_messages=$can_send_media_messages -d can_send_other_messages=$can_send_other_messages -d can_add_web_page_previews=$can_add_web_page_previews]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::restrictChatMember: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::restrictChatMember: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::promoteChatMember                                             #
# ---------------------------------------------------------------------------- #
# Promote or demote a user in a chat group or channel in Telegram              #
# https://core.telegram.org/bots/api#promotechatmember                         #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::promoteChatMember {chat_id user_id can_change_info can_post_messages can_edit_messages can_delete_messages can_invite_users can_restrict_members can_pin_messages can_promote_members} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/promoteChatMember -d chat_id=$chat_id -d user_id=$user_id -d can_change_info=$can_change_info -d can_post_messages=$can_post_messages -d can_edit_messages=$can_edit_messages -d can_delete_messages=$can_delete_messages -d can_invite_users=$can_invite_users -d can_restrict_members=$can_restrict_members -d can_pin_messages=$can_pin_messages -d can_promote_members=$can_promote_members]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::promoteChatMember: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::promoteChatMember: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::exportChatInviteLink                                          #
# ---------------------------------------------------------------------------- #
# Promote or demote a user in a chat group or channel in Telegram              #
# https://core.telegram.org/bots/api#exportchatinvitelink                      #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::exportChatInviteLink {chat_id} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/exportChatInviteLink -d chat_id=$chat_id]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::exportChatInviteLink: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::exportChatInviteLink: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::setChatPhoto                                                  #
# ---------------------------------------------------------------------------- #
# Sets the channel's profile photo of a chat group or channel in Telegram      #
# https://core.telegram.org/bots/api#setchatphoto                              #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::setChatPhoto {chat_id photo} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/setChatPhoto -d chat_id=$chat_id -d photo=$photo]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::setChatPhoto: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::setChatPhoto: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::deleteChatPhoto                                               #
# ---------------------------------------------------------------------------- #
# Delete the channel's profile photo of a chat group or channel in Telegram    #
# https://core.telegram.org/bots/api#deletechatphoto                           #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::deleteChatPhoto {chat_id} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/deleteChatPhoto -d chat_id=$chat_id]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::deleteChatPhoto: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::deleteChatPhoto: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::setChatTitle                                                  #
# ---------------------------------------------------------------------------- #
# Sets the channel's title of a chat group or channel in Telegram              #
# https://core.telegram.org/bots/api#setchattitle                              #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::setChatTitle {chat_id title} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/setChatTitle -d chat_id=$chat_id -d title=$title]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::setChatTitle: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::setChatTitle: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::setChatDescription                                            #
# ---------------------------------------------------------------------------- #
# Sets the channel's description of a chat group or channel in Telegram        #
# https://core.telegram.org/bots/api#setchatdescription                        #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::setChatDescription {chat_id description} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/setChatDescription -d chat_id=$chat_id -d description=$description]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::setChatDescription: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::setChatDescription: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::pinChatMessage                                                #
# ---------------------------------------------------------------------------- #
# Pin a message in a supergroup or a channel in Telegram                       #
# https://core.telegram.org/bots/api#pinchatmessage                            #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::pinChatMessage {chat_id message_id disable_notification} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/pinChatMessage -d chat_id=$chat_id -d message_id=$message_id -d disable_notification=$disable_notification]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::pinChatMessage: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::pinChatMessage: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::unpinChatMessage                                              #
# ---------------------------------------------------------------------------- #
# Unpin a message in a supergroup or a channel in Telegram                     #
# https://core.telegram.org/bots/api#unpinchatmessage                          #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::unpinChatMessage {chat_id} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/unpinChatMessage -d chat_id=$chat_id]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::unpinChatMessage: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::unpinChatMessage: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::leaveChat                                                     #
# ---------------------------------------------------------------------------- #
# Use this method for your bot to leave a group, supergroup or channel         #
# https://core.telegram.org/bots/api#leavechat                                 #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::leaveChat {chat_id} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/leaveChat -d chat_id=$chat_id]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::leaveChat: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::leaveChat: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::getChat                                                       #
# ---------------------------------------------------------------------------- #
# Get up to date information about the chat group in Telegram                  #
# https://core.telegram.org/bots/api#getchat                                   #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::getChat {chat_id} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/getChat -d chat_id=$chat_id]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::getChat: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::getChat: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::getChatAdministrators                                         #
# ---------------------------------------------------------------------------- #
# Get a list of administrators in a chat group in Telegram                     #
# https://core.telegram.org/bots/api#getchatadministrators                     #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::getChatAdministrators {chat_id} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/getChatAdministrators -d chat_id=$chat_id]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::getChatAdministrators: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::getChatAdministrators: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::getChatMembersCount                                           #
# ---------------------------------------------------------------------------- #
# Get the number of members in a chat group in Telegram                        #
# https://core.telegram.org/bots/api#getchatmemberscount                       #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::getChatMembersCount {chat_id} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/getChatMembersCount -d chat_id=$chat_id]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::getChatMembersCount: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::getChatMembersCount: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::getChatMember                                                 #
# ---------------------------------------------------------------------------- #
# Get information about a member of a chat group in Telegram                   #
# https://core.telegram.org/bots/api#getchatmember                             #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::getChatMember {chat_id user_id} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/getChatMember -d chat_id=$chat_id -d user_id=$user_id]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::getChatMember: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::getChatMember: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::setChatStickerSet                                             #
# ---------------------------------------------------------------------------- #
# Set a new group sticker set for a supergroup in Telegram                     #
# https://core.telegram.org/bots/api#setchatstickerset                         #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::setChatStickerSet {chat_id sticker_set_name} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/setChatStickerSet -d chat_id=$chat_id -d sticker_set_name=$sticker_set_name]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::setChatStickerSet: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::setChatStickerSet: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::deleteChatStickerSet                                          #
# ---------------------------------------------------------------------------- #
# Delete a group sticker set from a supergroup in Telegram                     #
# https://core.telegram.org/bots/api#deletechatstickerset                      #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::deleteChatStickerSet {chat_id sticker_set_name} {
	if { [ catch {
		set ::libtelegram::result [exec curl --tlsv1.2 -s -X POST https://api.telegram.org/bot$::libtelegram::bot_id:$::libtelegram::bot_token/deleteChatStickerSet -d chat_id=$chat_id -d sticker_set_name=$sticker_set_name]
	} ] } {
		set ::libtelegram::errorMessage "libtelegram::deleteChatStickerSet: cannot connect to api.telegram.com."
		return [set ::libtelegram::errorNumber -1]
	} else {
		if {![::libtelegram::checkValidResult]} {
			set ::libtelegram::errorMessage "libtelegram::deleteChatStickerSet: $::libtelegram::errorNumber - $::libtelegram::errorMessage"
			return $::libtelegram::errorNumber
		}
	}

	return [set ::libtelegram::errornumber 0]
}

# ---------------------------------------------------------------------------- #
# ::libtelegram::downloadFile                                                  #
# ---------------------------------------------------------------------------- #
# Download a Telegram attachment                                               #
# https://core.telegram.org/bots/api#getfile                                   #
# ---------------------------------------------------------------------------- #
proc ::libtelegram::downloadFile {file_path filename} {
	# Check if we can open a temp file
	if { [catch {open $filename w} fo] } {
		# Probably no need to close and delete the file, but we'll do it anyways just to be sure
		close $fo
		file delete -force $filename
		putlog "::libtelegram::downloadFile: cannot create temp file $filename"
		return -1
	} else {
		fconfigure $fo -translation binary
		if { [ catch {
			puts -nonewline $fo [exec curl --tlsv1.2 --max-filesize $::libtelegram::max_file_size --range 0-$::libtelegram::max_file_size --silent --request GET https://api.telegram.org/file/bot$::libtelegram::bot_id:$::libtelegram::bot_token/$file_path]
		} ] } {
			close $fo
			file delete -force $filename
			putlog "Telegram-API: cannot connect to api.telegram.com for downloading $file_path"
			return -2
		}
	}
	close $fo
	return 0
}

proc ::libtelegram::checkValidResult {} {
	if {[::libjson::getValue $::libtelegram::result ".ok"] eq "false"} {
		# Set error number and message to the values received from the API servers
		set ::libtelegram::errorNumber [::libjson::getValue $::libtelegram::result ".error_code"]
		set ::libtelegram::errorMessage [::libjson::getValue $::libtelegram::result ".description"]
		return false
	} else {
		if {[::libjson::getValue $::libtelegram::result ".ok"] ne "true"} {
			# Probably got a HTML response, like 502 Bad Gateway
			if {[set titlestart [string first "<title" $::libtelegram::result]] eq -1} {
				set ::libtelegram::errorNumber -1
				set ::libtelegram::errorMessage "Unknown response received"
				return false
			} else {
				# Set the error number and message to the HTML title (most likely 502 Bad Gateway)
				set titlestart [string first ">" $::libtelegram::result $titlestart]
				set titleend [string first "</title>" $::libtelegram::result $titlestart]
				set ::libtelegram::errorNumber -1
				set ::libtelegram::errorMessage [string range $::libtelegram::result $titlestart+1 $titleend-1]
				return false
			}
		} else {
			return true
		}
	}
}
