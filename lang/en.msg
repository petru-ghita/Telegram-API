# ---------------------------------------------------------------------------- #
# Telegram-API module for Eggdrop - English language file v20180303            #
#                                                                              #
# written by Eelco Huininga 2016-2018                                          #
# ---------------------------------------------------------------------------- #

# Messages from IRC to Telegram
::msgcat::mcset en MSG_IRC_MSGSENT		"<i>%1\$s@IRC:</i> %2\$s"
::msgcat::mcset en MSG_IRC_NICKJOINED		"<i>%1\$s@IRC</i> has entered <a href=\"%2\$s\">%3\$s</a>."
::msgcat::mcset en MSG_IRC_NICKLEFT		"<i>%1\$s@IRC</i> has left <a href=\"%2\$s\">%3\$s</a> (%4\$s)."
::msgcat::mcset en MSG_IRC_NICKACTION		"<i>%1\$s@IRC:</i> %2\$s %3\$s"
::msgcat::mcset en MSG_IRC_NICKCHANGE		"<i>%1\$s@IRC</i> is now known as <i>%2\$s</i>"
::msgcat::mcset en MSG_IRC_TOPICCHANGE		"<i>%1\$s@IRC</i> has changed the topic on <a href=\"%2\$s\">%3\$s</a> to <i>%4\$s</i>"
::msgcat::mcset en MSG_IRC_KICK		"<i>%1\$s@IRC</i> has kicked <i>%2\$s</i> from <i>%3\$s</i>: <b>%4\$s</b>"
::msgcat::mcset en MSG_IRC_MODECHANGE		"<i>%1\$s@IRC</i> sets mode %2\$s on %3\$s"

# IRC service messages
::msgcat::mcset en MSG_IRC_INVITELINK "Join the Telegram %1\$s %2\$s here %3\$s"
::msgcat::mcset en MSG_IRC_DCCSENDFAILED  "Could not send file. Please ask the admin to take a look at the log file."
::msgcat::mcset en MSG_IRC_DCCSENDFILE  "Starting DCC transfer for %1\$s."
::msgcat::mcset en MSG_IRC_DCCSENDFULL  "Can't send %1\$s (too many connections). Please try again later."
::msgcat::mcset en MSG_IRC_DCCSOCKET  "Can't open a socket for the transfer of %1\$s."
::msgcat::mcset en MSG_IRC_DCCNOTFOUND  "File %1\$s not found."
::msgcat::mcset en MSG_IRC_DCCQUEUED  "File %1\$s is queued for transfer."

# Messages from Telegram to IRC
::msgcat::mcset en MSG_TG_MSGSENT			"%1\$s@Telegram: %2\$s"
::msgcat::mcset en MSG_TG_MSGREPLYTOSENT "%1\$s (in reply to %2\$s@Telegram: %3\$s)"
::msgcat::mcset en MSG_TG_MSGFORWARDED "%1\$s (forwarded from %2\$s)"
::msgcat::mcset en MSG_TG_PINNEDMESSAGE "%1\$s@Telegram: %2\$s (pinned on %3\$s)"
::msgcat::mcset en MSG_TG_AUDIOSENT		"%1\$s@Telegram has sent an audiofile: %2\$s - %3\$s (%4\$s s). Use !tgfile %5\$s to download the file."
::msgcat::mcset en MSG_TG_DOCSENT			"%1\$s@Telegram has sent a document%2\$s: %3\$s (%4\$s bytes).  Use !tgfile %5\$s to download the file."
::msgcat::mcset en MSG_TG_PHOTOSENT		"%1\$s@Telegram has sent a photo%2\$s (%3\$s bytes). Use !tgfile %4\$s to download the file."
::msgcat::mcset en MSG_TG_STICKERSENT		"%1\$s@Telegram has sent a sticker from the %2\$s set (%3\$s)."
::msgcat::mcset en MSG_TG_VIDEOSENT		"%1\$s@Telegram has sent a video%2\$s (%3\$s s). Use !tgfile %4\$s to download the file."
::msgcat::mcset en MSG_TG_VOICESENT		"%1\$s@Telegram has sent a voice file: %2\$s (%3\$s bytes). Use !tgfile %4\$s to download the file."
::msgcat::mcset en MSG_TG_CONTACTSENT		"%1\$s@Telegram has sent a contact: %2\$s (%3\$s %4\$s)."
::msgcat::mcset en MSG_TG_LOCATIONSENT		"%1\$s@Telegram has sent a location: https://www.openstreetmap.org/#map=19/%3\$s/%2\$s"
::msgcat::mcset en MSG_TG_VENUESENT		"%1\$s@Telegram has sent a venue: location=%2\$s title=%3\$s address=%4\$s foursquare_id=%5\$s."
::msgcat::mcset en MSG_TG_WELCOME "Welcome to %1\$s! I am %2\$s, the bartender in this Telegram group. I'm connected to the IRC channel <a href=\"%3\$s\">%4\$s</a>, so you can chat with the users on that channel as well."
::msgcat::mcset en MSG_TG_USERJOINED			"%1\$s@Telegram has joined the Telegram group."
::msgcat::mcset en MSG_TG_USERADD			"%1\$s@Telegram has added %2\$s to the Telegram group."
::msgcat::mcset en MSG_TG_USERLEFT			"%1\$s@Telegram has left the Telegram group."
::msgcat::mcset en MSG_TG_USERREMOVED		"%1\$s@Telegram has removed %2\$s from the Telegram group."
::msgcat::mcset en MSG_TG_TITLECHANGE		"%1\$s@Telegram has changed the topic of the Telegram group to %2\$s."
::msgcat::mcset en MSG_TG_PICCHANGE		"%1\$s@Telegram has changed the Telegram group picture. Use !tgfile %2\$s to download the file."
::msgcat::mcset en MSG_TG_PICDELETE		"%1\$s@Telegram has removed the Telegram group picture."
::msgcat::mcset en MSG_TG_GROUPMIGRATED  "%1$\s@Telegram has migrated the Telegram group to a supergroup."
::msgcat::mcset en MSG_TG_CHATTITLE "%1\$s is a %2\$s and is titled %3\$s"
::msgcat::mcset en MSG_TG_CHATDESC "%1\$s has a description: %2\$s"
::msgcat::mcset en MSG_TG_CHATMEMBERCOUNT "%1\$s has %2\$s members"
::msgcat::mcset en MSG_TG_CHATPHOTO "%1\$s has a chat photo: !tgfile %2\$s"
::msgcat::mcset en MSG_TG_UNKNOWNSTICKER	"Unknown sticker."
::msgcat::mcset en MSG_TG_UNIMPL			"Unknown Telegram message received: %1\$s"
::msgcat::mcset en MSG_WEBPREVIEW_UNAVAILABLE "Website preview available."
::msgcat::mcset en MSG_WEBPREVIEW_NOTITLE "No title available."

# Messages for user commands for your bot
::msgcat::mcset en MSG_BOT_PUBHELP			"I'm <i>%1\$s</i>, your personal bartender. Available commands are:\n"
::msgcat::mcset en MSG_BOT_PRVHELP			"I'm <i>%1\$s</i>, your personal bartender. Available commands are:\n"
::msgcat::mcset en MSG_BOT_IRCTOPIC		"The topic on <a href=\"%1\$s\">%2\$s</a> is: <i>%3\$s</i>"
::msgcat::mcset en MSG_BOT_IRCTOPIC_HELP		": Show the topic for the IRC channel(s) linked to this Telegram group."
::msgcat::mcset en MSG_BOT_IRCUSERS		"The following users are known on <a href=\"%1\$s\">%2\$s\</a>:\n\n%3\$s"
::msgcat::mcset en MSG_BOT_IRCUSER_HELP		": Show all users on the IRC channel(s) linked to this Telegram group."
::msgcat::mcset en MSG_BOT_IRCUSER			"<i>%1\$s@IRC</i> is since %2\$s on <a href=\"%3\$s\">%4\$s</a> known as <i>%5\$s</i>"
::msgcat::mcset en MSG_BOT_IRCUSERUNKNOWN	"<i>%1\$s@IRC</i> is not known on <a href=\"%2\$s\">%3\$s</a>"
::msgcat::mcset en MSG_BOT_IRCUSER_HELP " <nickname>: Show detailed information about an user on IRC."
::msgcat::mcset en MSG_IRCKICKUSER "You've been kicked from this channel by a Telegram user."
::msgcat::mcset en MSG_IRCBANUSER "You've been banned from this channel by a Telegram user."
::msgcat::mcset en MSG_BOT_IRCKICK_HELP " <nickname>: Kick an IRC user from the IRC channel."
::msgcat::mcset en MSG_BOT_IRCBAN_HELP " <nickname>: Ban an IRC user from the IRC channel."
::msgcat::mcset en MSG_BOT_IRCUNBAN_HELP " <nickname>: Unban an IRC user from the IRC channel."
::msgcat::mcset nl MSG_BOT_TGWHOISNAME "Telegram ID %1\$s is %2\$s and is known as %3\$s%4\$s."
::msgcat::mcset nl MSG_BOT_TGWHOISSTATUS "Telegram ID %1\$s has status %2\$s."
::msgcat::mcset nl MSG_BOT_TGWHOISLANG "Telegram ID %1\$s has language code %2\$s."
::msgcat::mcset nl MSG_BOT_TGWHOISPHOTO "Telegram ID %1\$s has an user profile photo set: !tgfile %2\$s"
::msgcat::mcset nl MSG_BOT_TGUSERNOTVALID  "No information available about Telegram ID %1\$s on this channel."
::msgcat::mcset nl MSG_BOT_TGUSER "an user"
::msgcat::mcset nl MSG_BOT_TGBOT "a bot"
::msgcat::mcset en MSG_BOT_TGUSERNOTVALID  "Can't get information on Telegram ID %1\$s on this channel."
::msgcat::mcset en MSG_BOT_GOTNOPRIVS "%1\$s isn't authorized to do that."

# Messages for admins controlling your bot
::msgcat::mcset en MSG_BOT_PASSWORDSET	"Welcome to %1\$s! Your password has been set."
::msgcat::mcset en MSG_BOT_USERLOGIN		"Welcome to %1\$s! You're now logged in as %2\$s."
::msgcat::mcset en MSG_BOT_USERLOGOUT		"You are now logged out as %1\$s."
::msgcat::mcset en MSG_BOT_FIRSTLOGIN	"This is your first Telegram-login to %1\$s."
::msgcat::mcset en MSG_BOT_LASTLOGIN	"The last time you logged in to %1\$s was at %2\$s."
::msgcat::mcset en MSG_BOT_USERPASSWRONG	"That username and password combination is unknown to me."
::msgcat::mcset en MSG_BOT_USERLOGGEDINAS		"You are logged in as %1\$s."
::msgcat::mcset en MSG_BOT_USERINFO	"Your username is %1\$s\nYour Telegram-ID is %2\$s\nYour last Telegram-login was at %3\$s\nYour last Telegram-logout was at %4\$s\nYour last Telegram-login ID was %5\$s\nYour Telegram-account was created on %6\$s\nYour IRC-account was created at %7\$s\nYour last IRC-login was at %8\$s\nYour IRC-hostnames are %9\$s\nYour IRC info is %10\$s"
::msgcat::mcset en MSG_BOT_NOTLOGGEDIN	"You're not logged in."
::msgcat::mcset en MSG_BOT_UNAUTHORIZED	"You're not authorized to do that."
