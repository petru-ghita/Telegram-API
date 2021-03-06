# ---------------------------------------------------------------------------- #
# IRC helper module for Eggdrop with the Telegram-API module v20180212         #
#                                                                              #
# written by Eelco Huininga 2016-2018                                          #
# ---------------------------------------------------------------------------- #

# ---------------------------------------------------------------------------- #
# Shows the topic of an IRC channel                                            #
# ---------------------------------------------------------------------------- #
proc ::telegram::irctopic {from_id chat_id msgid channel message parameter_start} {
	global serveraddress

	set response "[::msgcat::mc MSG_BOT_IRCTOPIC "$serveraddress/$channel" "$channel" "[topic $channel]"]"
	::libtelegram::sendMessage $chat_id $msgid "html" "$response"
	putchan $channel "[strip_html $response]"

	# Return success
	return 0
}

# ---------------------------------------------------------------------------- #
# Shows detailed information about an user on IRC                              #
# ---------------------------------------------------------------------------- #
proc ::telegram::ircuser {from_id chat_id msgid channel message parameter_start} {
	global serveraddress

	set handle [string trim [string range $message $parameter_start end]]

	if {$handle != ""} {
  		if {[onchan $handle $channel]} {
			set online_since [clock format [getchanjoin $handle $channel] -format $::telegram::timeformat]
			set response "[::msgcat::mc MSG_BOT_IRCUSER "$handle" "$online_since" "$serveraddress/$channel" "$channel" "[getchanhost $handle $channel]"]"
		} else {
			set response "[::msgcat::mc MSG_BOT_IRCUSERUNKNOWN "$handle" "$serveraddress/$channel" "$channel"]"
		}
		::libtelegram::sendMessage $chat_id $msgid "html" "$response"
		putchan $channel "[strip_html $response]"

		# Return success
		return 0
	} else {
		# Return an error, so the help message will be shown
		return -1
	}
}

# ---------------------------------------------------------------------------- #
# Shows all users on an IRC channel                                            #
# ---------------------------------------------------------------------------- #
proc ::telegram::ircusers {from_id chat_id msgid channel message parameter_start} {
	global serveraddress

	set response "[::msgcat::mc MSG_BOT_IRCUSERS "$serveraddress/$channel" "$channel" "[string map {" " "\n"} [chanlist $channel]]"]"
	::libtelegram::sendMessage $chat_id $msgid "html" "$response"
	putchan $channel "[strip_html $response]"

	# Return success
	return 0
}

# ---------------------------------------------------------------------------- #
# Kicks an user on an IRC channel                                              #
# ---------------------------------------------------------------------------- #
proc ::telegram::ircKick {from_id chat_id msgid channel message parameter_start} {
	global serveraddress

	set handle [string trim [string range $message $parameter_start end]]

	# Check if the Telegram user requesting the unban is logged in
	if {[set irchandle [::telegram::getIRCNickFromTelegramID $from_id]] != -1} {
		# Check if the user is on the IRC channel
  		if {[onchan $handle $channel]} {
			# Check if the bot has enough privileges to perform the kick
			if {[botisop $channel] || [botishalfop $channel]} {
				foreach {tg_chat_id tg_channel} [array get ::telegram::tg_channels] {
					if {$chat_id eq $tg_chat_id} {
						putkick $tg_channel $handle [::msgcat::mc MSG_IRCKICKUSER]
					}
				}
				# Return success
				return 0
			} else {
				set response "[::msgcat::mc MSG_BOT_GOTNOPRIVS $::telegram::irc_bot_nickname]"
			}
		} else {
			set response "[::msgcat::mc MSG_BOT_IRCUSERUNKNOWN "$handle" "$serveraddress/$channel" "$channel"]"
		}
	} else {
		set response "[::msgcat::mc MSG_BOT_NOTLOGGEDIN]"
	}
	::libtelegram::sendMessage $chat_id $msgid "html" "$response"
	putchan $channel "[strip_html $response]"

	return 0
}

# ---------------------------------------------------------------------------- #
# Bans an user on an IRC channel                                               #
# ---------------------------------------------------------------------------- #
proc ::telegram::ircBan {from_id chat_id msgid channel message parameter_start} {
	global serveraddress

	set handle [string trim [string range $message $parameter_start end]]

	# Check if the Telegram user requesting the unban is logged in
	if {[set irchandle [::telegram::getIRCNickFromTelegramID $from_id]] != -1} {
		# Check if the user is on the IRC channel
  		if {[onchan $handle $channel]} {
			# Check if the bot has enough privileges to perform the ban
			if {[botisop $channel] || [botishalfop $channel]} {
				foreach {tg_chat_id tg_channel} [array get ::telegram::tg_channels] {
					if {$chat_id eq $tg_chat_id} {
						newchanban $tg_channel "$handle![getchanhost $handle $channel]" $::telegram::irc_bot_nickname [::msgcat::mc MSG_IRCBANUSER]
					}
				}
				# Return success
				return 0
			} else {
				set response "[::msgcat::mc MSG_BOT_GOTNOPRIVS $::telegram::irc_bot_nickname]"
			}
		} else {
			set response "[::msgcat::mc MSG_BOT_IRCUSERUNKNOWN "$handle" "$serveraddress/$channel" "$channel"]"
		}
	} else {
		set response "[::msgcat::mc MSG_BOT_NOTLOGGEDIN]"
	}
	::libtelegram::sendMessage $chat_id $msgid "html" "$response"
	putchan $channel "[strip_html $response]"

	return 0
}

# ---------------------------------------------------------------------------- #
# Unbans an user on an IRC channel                                             #
# ---------------------------------------------------------------------------- #
proc ::telegram::ircUnban {from_id chat_id msgid channel message parameter_start} {
	set result 0
	set handle [string trim [string range $message $parameter_start end]]

	# Check if the Telegram user requesting the unban is logged in
	if {[set irchandle [::telegram::getIRCNickFromTelegramID $from_id]] != -1} {
		# Check if the bot has enough privileges to perform the unban
		if {[botisop $channel] || [botishalfop $channel]} {
			foreach {tg_chat_id tg_channel} [array get ::telegram::tg_channels] {
				if {$chat_id eq $tg_chat_id} {
					if {[killchanban $tg_channel $handle] eq 0} {
						set result -1
					}
				}
			}
			# Return success
			return $result
		} else {
			set response "[::msgcat::mc MSG_BOT_GOTNOPRIVS $::telegram::irc_bot_nickname]"
			::libtelegram::sendMessage $chat_id $msgid "html" "$response"
			putchan $channel "[strip_html $response]"

			return 0
		}
	} else {
		set response "[::msgcat::mc MSG_BOT_NOTLOGGEDIN]"
		::libtelegram::sendMessage $chat_id $msgid "html" "$response"
		putchan $channel "[strip_html $response]"

		return 0
	}
}

::telegram::addPublicCommand irctopic ::telegram::irctopic "[::msgcat::mc MSG_BOT_IRCTOPIC_HELP]"
::telegram::addPublicCommand ircuser ::telegram::ircuser "[::msgcat::mc MSG_BOT_IRCUSER_HELP]"
::telegram::addPublicCommand ircusers ::telegram::ircusers "[::msgcat::mc MSG_BOT_IRCUSERS_HELP]"
::telegram::addPublicCommand irckick ::telegram::ircKick "[::msgcat::mc MSG_BOT_IRCKICK_HELP]"
::telegram::addPublicCommand ircban ::telegram::ircBan "[::msgcat::mc MSG_BOT_IRCBAN_HELP]"
::telegram::addPublicCommand ircunban ::telegram::ircUnban "[::msgcat::mc MSG_BOT_IRCUNBAN_HELP]"
