#         #   #   ##   #####        #           @@@       @@
#    #### #   #  #       #          #          @         @  @
#    #  # #       #      #  ### ### #    ###   @@@@        @
#    #  # #        #     #  # # # # #     #    @   @      @
#### #### ####  ###      #  ### ### #### ###    @@@   @  @@@@

# [LoL's TooLz 6.2]
#
# Eggdrop TCL Script: [LoL's TooLz] Copyright (C) 1998 LL Productions.
# This software is free software under the terms of GNU GPL 2.
# Type .gpl-lol in party-line for more informations.
#
# WARNING !!!: THIS SCRIPT IS ONLY FOR EGGDROPS 1.3.X OR MORE !!!
#
# THANKS FOR BUGS REPORT AND ENGLISH ERRORS (NOT MY MOTHER LANGUAGE ;)
# SPECIAL THANKS: EGGDROP MAILING-LIST & Cpt_Bib FOR TESTING AND SHELL
#
#                                               LoL
#
# HomePage: http://www.chez.com/lolstoolz
# E-MAIL: lol@mail.dotcom.fr  IRCNET(EFFNET): RB_____   ICQ: 22245831

# LEVELS USED IN LOL'S TOOLZ:
#
#            +M +N (Masters, Owners) [+B & +0 (Bots with +O) in passive mode]
#               +O (Operators)
#               +V (Voice)
#               - (User without flags)
#               *  (Nothing = Not a bot user)
#
# ALL THE COMMAND THAT NEED A PRIORITY, CHECK IF THE SOURCE OF THE COMMAND
# IS ALLOWED TO PERFORM A NEGATIVE ACTION ON AN USER WITH AN HIGHTER
# LEVEL. BOTS ARE IN THE HIGHTEST LEVEL TO PREVENT ANY BOTWAR (THE BOT
# ALWAYS RESPECT THE COMMANDS OF THE OTHER BOTS.).

#
# 2022-06-28 version 6.2: Changes done by Johnny A. Solbu
# https://github.com/solbu/eggdrop-scripts :
#
# I don't like the bot to have publicly available commands,
# unless they are really needed. So i tend to remove or disable them.
#
# So in this copy All public commands are disabled, 
# by removing the "bind pub foo" lines.
#
# I don't remember when I changed this script,
# but I am releasing it on june 28, 2022 as version 6.2 by request.
# - Solbu

#########
# SETUP #
#########

# IF YOU HAVE AN EGG OLDER THAN 1.3.18 OR IF YOU RECEIVE AN ERROR LIKE:
# Called see_new_pass with too many arguments
# REPLACE THE NEXT LINE BY: bind mode - * see_new_pass
bind mode - "* +k" see_new_pass2

# ENABLE (1) OR DISABLE (0) CHAN-KEY AUTO-UPDATE AND CHAN_KEY MEMORISATION.
#
# ***** WARNING !!!! *****
# IF YOU USE GETOPS.TCL YOU NEED TO SET 0 HERE.
set lol(chankey) 0

# THESE FLAGS ARE ONLY DEFAULT FLAGS, YOU CAN STILL CHANGE THEM WHEN
# THE BOT IS ONLINE.

# YOU CAN SET THE COMMAND  CHARACTER THAT WILL BE USED FOR PUBLIC QUERRIES
# EXAMPLE: "#" => #seen, #op .... DEFAULT: "!"
set lol(cmdchar) "!"

# ENABLE (1) OR DISABLE (0) SECURITY WARNING WHEN NEWBIES MASTERS
# JOIN PARTY-LINE.
# WITH THE NEW IDENT SYSTEM THERE IS NO MORE BIG SECURITY RISK.
set lol(security) 0

# ENABLE (1) OR DISABLE (0) PASSWORD CHECKER WHEN AN USER JOIN THE CHAN.
# IF SET TO 1, THE BOT REMEMBER AN USER WITHOUT PASSWORD TO SET ONE.
set lol(nopass) 1

# ENABLE (1) OR DISABLE (0) IDENTIFICATION SYSTEM.
# WARNING !!! IF THIS IS DISABLED, THE SECURITY IS NO MORE GUARANTED.
# THE BOT ONLY USER USERMASK TO IDENTIFY EVERYBODY.
# USE THIS AT YOUR OWN RISK. DEFAULT: 1
set lol(ident) 1

# ENABLE (1) OR DISABLE (0) IDENTIFICATION CONFIRMATION.
set lol(id_confirm) 1

# ENABLE (1) OR DISABLE (0) WARN AN USER IF HE WANTS TO USE CHAN COMMANDS
# WITHOUT TO BE IDENTIFIED. 1 = DON'T WARN.
# NOW, WITH THE NEW SILENT, UNSILENT COMMANDS, YOU SHOULD KEEP
# 0 HERE, BECAUSE EACH USERS CAN CHOICE HIS OWN MODE.
# IF YOU SET 1 HERE, THE CHOICE OF USERS IS OVERRIDEN AND ALL ARE IN SILENT
# MODE.
set lol(silent) 0

# ACCEPT THAT ONLY ONE IDENT, IDENTIFY ALL THE CLONES OF YOU THAT MATCH YOUR
# MASK AND HAVE THE SAME IP. IF SET TO 0, ONLY THE LAST NICK THAT HAVE MAKE
# THE IDENT IS IDENTIFIED. IF YOU ARE ON A SHELL WITH MULTIPLE ACCOUNTS, MAYBE
# YOU WANT TO PUT 0 HERE.
set lol(clone) 1

# ENABLE (1) OR DISABLE (0) JOKES
set lol(jokes) 1

# ENABLE (1) OR DISABLE (0) COLOR IN SOME CHAN MESSAGES (JOKES FOR EXAMPLE).
# COLORS ARE NOT IN THE OFFICIAL IRC PROTOCOL, SOME UNIX CLIENT DON'T
# UNDERSTAND THEM.
set lol(color) 1

# !HELP AND !TROUBLES ARE 2 PUBLIC COMMANDS THAT USE BANDWITH.
# THERE CAN BE WARBOTS THAT FLOOD THE CHAN SAYING !HELP OR
# !TROUBLES MULTIPLES TIMES. IT CAN BE A GOOD IDEA TO DISABLE
# THEM (FOR THE PUBLIC ONLY).

# ENABLE (1) OR DISABLE (0) !HELP COMMAND FOR THE NON USERS OF THE BOT.
set lol(help) 0

# ENABLE (1) OR DISABLE (0) !TROUBLES COMMAND FOR THE NON USERS OF THE BOT.
set lol(troubles) 0

# ENABLE (1) OR DISABLE (0) !SEEN COMMAND FOR THE NON USERS OF THE BOT.
set lol(seen) 1

# ENABLE (1) OR DISABLE (0) !TIME COMMAND FOR THE NON USERS OF THE BOT.
set lol(time) 0

# ADJUST THESES DEFAULT CHAN LINES (USED BY !JOIN, .JOIN...)
#(flood accepted:number of seconds)
set lol(chan_flood) "8:20"
set lol(join_flood) "5:30"
set lol(deop_flood) "3:10"
set lol(ctcp_flood) "3:30"
set lol(kick_flood) "3:10"
set lol(chan_parameters) "-clearbans -enforcebans +dynamicbans +userbans -autoop -bitch -greet -protectops -statuslog +stopnethack -revenge +autovoice -secret +shared +cycle -seen"
set lol(chanmode) "+nt"

# DEFAULT SERVER FLAGS
# CHANGE THIS ONLY IF YOU KNOW THE SERVER FLAGS...
set lol(server_flags) "+iw-s"

# ENABLE (1) OR DISABLE (0) BOT PROTECTION AGAIN A BAN THAT MATCH YOUR USERS.
# IF THE BAN IS SET BY A CHAN MASTER, ONLY A WARNING IS DISPLAYED. IF NOT
# THE FLAGS OF THE USER AND OF THE VICTIM(S) ARE COMPARED. IF THE
# VICTIM HAS THE HIGHTEST FLAG, THE BAN IS REMOVED BY THE BOT.
# THE BOT REMOVE TOO A BAN THAT MATCH HIMSELF.
set lol(ban_protect) 1

# AWAY MESSAGE, IF YOU WANT TO SET AN AWAY MESSAGE FOR THE BOT...
set lol(away) ""

# ENABLE (1) OR DISABLE (0) WELCOME MESSAGE FOR THE NON USERS OF THE BOT.
# (WELCOME CAN USE A LOT OF BANDWIDTH IF YOU HAVE BIG CHANS)
set lol(welcome) 0

# IF YOU WANT A SPECIAL WELCOME MESSAGE ON YOUR CHANS, SET IT HERE. IF NOT,
# KEEP IT EMPTY ! (EMPTY = DEFAULT MESSAGE)
set lol(welmsg) ""

# ENABLE (1) OR DISABLE (0) PROTECTION AGAIN IDLE USERS.
# ALL THE IDLE SETTINGS BELOW APPLY ONLY IF IDLE PROTECT IS ENABLED.	
set lol(idle_protect) 0

# AFTER HOW MANY TIME AN USER RECEIVE AN IDLE WARNING BY MSG. IF THIS
# VALUE IS GREATER OR EQUAL THAN max_idle_time, THERE IS NO WARNING.
# VALUE IS IN MINUTES.
set lol(warn_idle_time) 55

# HOW MANY TIME AN USER CAN BE IDLE ON A CHAN BEFORE TO BE BANNED.
# VALUE IS IN MINUTES.
set lol(max_idle_time) 60

# AFTER HOW MINUTES AN IDLE USER IS KICKED FROM THE CHAN. IF THIS VALUE IS LOWER
# THAN max_idle_time, THE USER IS KICKED AND NEVER BANNED. TO DISABLE IDLE KICK
# AND KEEP ONLY IDLE BAN, SET A VALUE GREATER THAN max_idle_time HERE.
# VALUE IS IN MINUTES.
set lol(kick_idle_time) 100

# HOW MANY TIME AN IDLE USER IS BANNED.  VALUE IS IN MINUTES.
set lol(idle_ban_time) 1

# SET THE FLAGS FOR THE USERS THAT YOU WANT NOT TO BE KICKED IN THE CASE OF
# A !KICK <MASK>, !QUICK <MASK>, CLIENT KICK (!MIRC, !IRCII...). THE OPED
# OR VOICED USERS AT THE MOMENT OF THE KICK ARE NOT KICKED, THIS SETTING ONLY
# APPLY FOR THE OTHER USERS OF THE CHAN. FOR EXAMPLE IF YOU WANT TO PROTECT
# +N, +M, +O, +V: set no_kick_flags "nmov"
set lol(no_kick_flags) "nmof"

# SAME AS ABOVE BUT FOR !BAN <MASK>
set lol(no_ban_flags) "nmof"

# SAME AS ABOVE BUT FOR THE IDLE USERS (IF YOU SET "" HERE, ALL THE NOT OPED,
# NOT VOICED USERS *EVEN IF THE BOT DETECT THEM LIKE +N OR +O* CAN BE KICKED
# OR BANNED IF THEY ARE IDLE.
set lol(no_idle_flags) "nmof"

#########
# BINDS #
#########

# CHANGE THE FLAGS AT YOUR OWN RISK !!! FOR EXAMPLE m|m => o|o
# IT CAN CREATE SECURITY HOLES AND SCRIPT PROBLEMS.
# YOU CAN DISABLE ANY COMMANDS PLACING A "#" BEFORE THEM.

#bind pub -|- [string trim $lol(cmdchar)]seen pub_lol_seen

# DCC
bind dcc n param dcc_lol_param
bind dcc n enable dcc_lol_enable
bind dcc n disable dcc_lol_disable
bind dcc n join dcc_lol_join
bind dcc n j dcc_lol_join
bind dcc m partyban dcc_lol_partyban
bind dcc m botnick dcc_lol_botnick
bind dcc m|m part dcc_lol_part
bind dcc m|m p dcc_lol_part
bind dcc m|m security dcc_lol_security
bind dcc m|m addop dcc_lol_addop
bind dcc m|m delop dcc_lol_delop
bind dcc o userlist dcc_lol_userlist
bind dcc n chanlist dcc_lol_chanlist
bind dcc o online dcc_lol_online
bind dcc ot|o whois dcc_lol_whois
bind dcc o|o channel dcc_lol_channel
bind dcc o|o mode dcc_lol_mode
#bind dcc - seen dcc_lol_seen
bind dcc - silent dcc_lol_silent
bind dcc - unsilent dcc_lol_unsilent
bind dcc - unident dcc_lol_unident
bind dcc - unpermident dcc_lol_unpermident
bind dcc - permident dcc_lol_permident
bind dcc - uid dcc_lol_unident
bind dcc - upid dcc_lol_unpermident
bind dcc - pid dcc_lol_permident
bind dcc - help-lol dcc_lol_help-lol
bind dcc - gpl-lol dcc_lol_gpl-lol
bind dcc - chanhelp dcc_lol_chanhelp
bind dcc - identhelp dcc_lol_identhelp

# MSG
bind msg o|o ban msg_lol_ban
bind msg o|o unban msg_lol_unban
bind msg o|o mode msg_lol_chan
bind msg o|o invite msg_lol_invite
bind msg o|o online msg_lol_online
#bind msg -|- seen msg_lol_seen
bind msg -|- silent msg_lol_silent
bind msg -|- unsilent msg_lol_unsilent
bind msg -|- identify msg_lol_ident
bind msg -|- permident msg_lol_permident
bind msg -|- unpermident msg_lol_unpermident
bind msg -|- unident msg_lol_unident
bind msg -|- id msg_lol_ident
bind msg -|- pid msg_lol_permident
bind msg -|- upid msg_lol_unpermident
bind msg -|- uid msg_lol_unident
bind msg o|o help-lol msg_lol_help

################
# END OF SETUP #
################

  ###############################################################
 ##                                                             ##
##  USUALLY YOU DON'T HAVE TO CHANGE ANY OF THE FOLLOWING LINES  ##
 ##                                                             ##
  ###############################################################

################# MISC #################
set lol(version_number) "6.2"
set lol(version) "\002\[LoL's TooLz $lol(version_number)]\002"

bind dcc - help dcc_lol_help
bind chon - * chon_security
bind join - * join_welcome
bind mode - * lol_watch_mode
unbind dcc - su *dcc:su
unbind msg - ident *msg:ident
bind dcc n su *dcc:su
#unbind pub -|- seen *pub:seen
unbind msg - invite *msg:invite
bind ctcr * VERSION lol_ctcp_version
bind nick - * chidentnick
bind sign - * deident
bind join - * joinident
bind kick - * kickident
bind rejn - * rejnident
bind raw * 311 lol_whois_reply
bind raw * 318 lol_whois_unknow
bind raw * 401 lol_whois_nofound
set init-server {initserv}

################# START OF JOIN PROCEDURES #################

proc chon_security {hand idx} {
	global lol
	if {$lol(security) == 0} {return 0}
	set find 0
	foreach chan [channels] {
		if {[matchattr $hand -|m $chan]} {
			set find 1
			break
		}
	}
	if {[matchattr $hand m]} {set find 1}
	if {[matchattr $hand n]} {set find 0}
	if {$find == 0} {return 0}
	putdcc $idx "\002*** WARNING !!!! ***\r"
	putdcc $idx "\002For security reasons the masters must DON'T SET THE +a FLAG (auto-op) !!!\r"
	putdcc $idx "Type \002.security\002 for more informations...\r"
	putdcc $idx "!!! Type \002.help-lol\002 to see the special commands of $lol(version) !!!\r"
}

proc join_welcome {nick host hand chan} {
	global lol botnick
	if {![validuser $hand]} {
		if {$lol(welcome) == 1 && $nick != $botnick} {
			if {$lol(welmsg) != ""} {
				puthelp "NOTICE $nick :$lol(welmsg)"
			} {
				if {$lol(help) == 1} {
					puthelp "NOTICE $nick :\037Welcome in $chan $nick !!! Type \002[string trim $lol(cmdchar)]help\002 for more..."
				} {
					puthelp "NOTICE $nick :\037Welcome in $chan $nick !!!"
				}
			}
		}
	}
	if {[passwdok $hand ""] && ![matchattr $hand b]} {
		if {$lol(nopass) == 1} {
			puthelp "NOTICE $nick :\002You haven't still a password set !!! YOU MUST SET YOUR PASSWORD !!!"
			puthelp "NOTICE $nick :\002To set your password type: /msg $botnick pass <your_new_password>"
		}
	}
}

################# END OF JOIN PROCEDURES #################

################# START OF CHAN COMMANDS #################

### !INFO <INFO LINE>

proc pub_lol_info {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] < 1} {
		puthelp "NOTICE $nick :\002Usage:\002 [string trim $lol(cmdchar)]info <info line>"
		return 0
	}
	if {[string length $arg] > 80} {
		puthelp "NOTICE $nick :Your infoline is too much long and has not been stored. (MAX: 80 Chars)"
		return 0
	}
	setchaninfo $hand $chan $arg
	puthelp "NOTICE $nick :\002$arg\002 stored in your info line for $chan."
	return 0
}

### !SILENT

proc pub_lol_silent {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $mynick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	setuser $hand xtra silent 1
}

### !UNSILENT

proc pub_lol_unsilent {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $mynick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	setuser $hand xtra silent 0
	puthelp "NOTICE $nick :You are no more in silent mode.\r"
}

### !UNPERMIDENT

proc pub_lol_unpermident {nick host hand chan arg} {
	setuser $hand xtra permident ""
	if {[getuser $hand xtra auth] != "DEAD"} {
		setuser $hand xtra auth 0
	}
	chattr $hand -3
	puthelp "NOTICE $nick :You have no more a permident mask."
}

### !UNIDENT

proc pub_lol_unident {nick host hand chan arg} {
	if {![check $hand $nick $host]} {
		return 0
	}
	if {[getuser $hand xtra auth] != "DEAD"} {
		setuser $hand xtra auth 0
	}
	chattr $hand -3
}

### !BOTNICK <nick>

proc pub_lol_botnick {mynick host hand chan arg} {
	set arg [charfilter $arg]
	global lol botnick nick
	if {![check $hand $mynick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $mynick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] != 1} {
		puthelp "NOTICE $mynick :\002Usage:\002 [string trim $lol(cmdchar)]botnick <nick>"
		return 0
	}
	set nick [lindex $arg 0]
}

### !JUMP [server] [port]

proc pub_lol_jump {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	set server [lindex $arg 0]
	set port [lindex $arg 1]
	if {![number $port]} {set port ""}
	if {$server == ""} {
		jump
		return 0
	}
	if {[number $port]} {
		jump $server $port
	} {
		jump $server
	}
	return 0
}

### !ADDHOST <nick|hand> [host]

proc pub_lol_addhost {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] < 1} {
		puthelp "NOTICE $nick :\002Usage:\002 [string trim $lol(cmdchar)]addhost <nick|hand> \[host\]"
		return 0
	}
	set who [lindex $arg 0]
	set host [lindex $arg 1]
	if {$host == ""} {
		set ipmask [lindex [split [maskhost $who![getchanhost $who $chan]] "@"] 1]
		set userm [lindex [split [getchanhost $who $chan] "@"] 0]
		set host *!*$userm@$ipmask
		if {[nick2hand $who $chan] == "*"} {
			if {[validuser $who]} {
				setuser $who hosts $host
				puthelp "NOTICE $nick :$host added for $who."
				return 0
			}
			puthelp "NOTICE $nick :$who is not an user of the bot."
			return 0
		}
		puthelp "NOTICE $nick :$who is already recognized by the bot with this hand: [nick2hand $who $chan]."
		return 0
	}
	if {![onchan $who $chan]} {
		if {[validuser $who]} {
			setuser $who hosts $host
			puthelp "NOTICE $nick :$host added for $who."
			return 0
		} {
			puthelp "NOTICE $nick :$who is not in $chan, and there is no user with this hand."
			return 0
		}
	} {
		set whohand [nick2hand $who $chan]
		if {$whohand == "*"} {
			if {![validuser $who]} {
				puthelp "NOTICE $nick :$who is not a registered user and no user in the bot has the hand $who."
				return 0
			} {
				setuser $who hosts $host
				puthelp "NOTICE $nick :$host added for $who."
				return 0
			}
		} {
			setuser $whohand hosts $host
			puthelp "NOTICE $nick :$host added for $who ($whohand)."
			return 0
		}
	}
	return 0
}

### !DELHOST <nick|hand> <host>

proc pub_lol_delhost {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] != 2} {
		puthelp "NOTICE $nick :\002Usage:\002 [string trim $lol(cmdchar)]delhost <nick|hand> <host>"
		return 0
	}
	set who [lindex $arg 0]
	set host [lindex $arg 1]
	if {![onchan $who $chan]} {
		set whohand $who
		if {[validuser $whohand]} {
			if {[delhost $whohand $host]} {
				puthelp "NOTICE $nick :$host removed for $who."
				return 0
			} {
				puthelp "NOTICE $nick :I can't remove $host of $who."
				return 0
			}
		} {
			puthelp "NOTICE $nick :$who is not in $chan, and there is no user with this hand."
			return 0
		}
	}
	set whohand [nick2hand $who $chan]
	if {$whohand == "*"} {
		puthelp "NOTICE $nick :$who is not a registered user."
		return 0
	}
	if {[delhost $whohand $host]} {
		puthelp "NOTICE $nick :$host removed for $who."
		return 0
	} {
		puthelp "NOTICE $nick :I can't remove $host of $who."
		return 0
	}
	return 0
}

### !CHATTR <nick> <flags>

proc pub_lol_chattr {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] != 2} {
		puthelp "NOTICE $nick :\002Usage:\002 [string trim $lol(cmdchar)]chattr <nick> <flags>"
		return 0
	}
	set who [lindex $arg 0]
	set flags [lindex $arg 1]
	if {![onchan $who $chan]} {
		puthelp "NOTICE $nick :Sorry, but i don't find $who in $chan."
		return 0
	}
	set whohand [nick2hand $who $chan]
	if {$whohand == "*"} {
		puthelp "NOTICE $nick :$who is not a registered user."
		return 0
	}
	if {[matchattr $hand n|n $chan]} {
		set change [chattr $whohand -|$flags $chan]
		if {$change != ""} {
			set change [lindex [split $change "|"] 1]
			puthelp "NOTICE $nick :$who has now theses flags in $chan: $change"
			return 0
		}
		puthelp "NOTICE $nick :The flags for $who have not changed."
		return 0
	}
	set flags [string trim $flags n]
	set flags [string trim $flags m]
	if {[matchattr $hand m|m $chan]} {
		set change [chattr $whohand -|$flags $chan]
		if {$change != ""} {
			set change [lindex [split $change "|"] 1]
			puthelp "NOTICE $nick :$who has now theses flags in $chan: $change"
			return 0
		}
		puthelp "NOTICE $nick :The flags for $who have not changed."
		return 0
	}
	set flags [string trim $flags o]
	if {[matchattr $hand o|o $chan]} {
		set change [chattr $whohand -|$flags $chan]
		if {$change != ""} {
			set change [lindex [split $change "|"] 1]
			puthelp "NOTICE $nick :$who has now theses flags in $chan: $change"
			return 0
		}
		puthelp "NOTICE $nick :The flags for $who have not changed."
		return 0
	}
	puthelp "NOTICE $nick :You have not enought rights to use this function."
	return 0
}

### !JOIN <chan> [chan pass]

proc pub_lol_join {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] < 1} {
		puthelp "NOTICE $nick :\002Usage:\002 [string trim $lol(cmdchar)]join <chan> \[chan pass\]"
		return 0
	}
	set chan [lindex $arg 0]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	set pass [lindex $arg 1]
	if {[validchan $chan]} {
		puthelp "NOTICE $nick :I'm already monitoring $chan. "
		if {$pass != ""} {
			if {$lol(chankey) == 1} {
				puthelp "NOTICE $nick :New pass set for $chan: $pass."
				channel set $chan need-key "chankey $chan $pass"
			} {
				puthelp "NOTICE $nick :I can't memorize password to keep compatibility with getops.tcl"
			}
		}
		if {![onchan [strlwr $botnick] $chan]} {
			puthelp "NOTICE $nick :I'll now try to join $chan."
			putserv "JOIN $chan $pass"
			return 0
		}
		puthelp "NOTICE $nick :I'm already in $chan."
		return 0
	}
	puthelp "NOTICE $nick :New chan monitoring: $chan."
	channel add $chan
	channel set $chan chanmode $lol(chanmode)
	channel set $chan flood-chan $lol(chan_flood)
	channel set $chan flood-deop $lol(deop_flood)
	channel set $chan flood-kick $lol(kick_flood)
	channel set $chan flood-join $lol(join_flood)
	channel set $chan flood-ctcp $lol(ctcp_flood)
	foreach param $lol(chan_parameters) {
		channel set $chan $param
	}
	if {$pass != ""} {
		if {$lol(chankey) == 1} {
			puthelp "NOTICE $nick :New pass set for $chan: $pass. "
			channel set $chan need-key "chankey $chan $pass"
		} {
			puthelp "NOTICE $nick :I can't memorize password to keep compatibility with getops.tcl"
		}
	}
	puthelp "NOTICE $nick :$chan is now configured."
	puthelp "NOTICE $nick :I'll now try to join $chan."
	puthelp "NOTICE $nick :Use \002.-chan\002 to remove a chan (chan userlist will be deleted)."
	putserv "JOIN $chan $pass"
}

### !REMOVE [chan]

proc pub_lol_remove {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	set ch [lindex $arg 0]
	if {$ch != ""} {set ch [chanaddapt $ch]}
	if {$ch == ""} {set ch $chan}
	if {![validchan $ch]} {
		puthelp "NOTICE $nick :I'm not on $ch "
		return 0
	}
	channel remove $ch
	puthelp "NOTICE $nick :$ch has been removed."
}

### !PARAM <parameter> <value>

proc pub_lol_param {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] < 2} {
		puthelp "NOTICE $nick :\037\002Usage:\002 [string trim $lol(cmdchar)]param <parameter> <value>\037"
		set param_display ""
		append param_display "\002cmdchar:\002 $lol(cmdchar)"
		append param_display "   "
		append param_display "\002security:\002 $lol(security)"
		append param_display "   "
		append param_display "\002nopass:\002 $lol(nopass)"
		append param_display "   "
		append param_display "\002chankey:\002 $lol(chankey)"
		append param_display "   "
		append param_display "\002silent:\002 $lol(silent)"
		append param_display "   "
		append param_display "\002ident:\002 $lol(ident)"
		append param_display "   "
		append param_display "\002id_confirm:\002 $lol(id_confirm)"
		append param_display "   "
		append param_display "\002clone:\002 $lol(clone)"
		append param_display "   "
		append param_display "\002jokes:\002 $lol(jokes)"
		append param_display "   "
		append param_display "\002color:\002 $lol(color)"
		append param_display "   "
		append param_display "\002help:\002 $lol(help)"
		append param_display "   "
		append param_display "\002troubles:\002 $lol(troubles)"
		append param_display "   "
		append param_display "\002seen:\002 $lol(seen)"
		append param_display "   "
		append param_display "\002time:\002 $lol(time)"
		append param_display "   "
		append param_display "\002chan_flood:\002 $lol(chan_flood)"
		append param_display "   "
		append param_display "\002join_flood:\002 $lol(join_flood)"
		append param_display "   "
		append param_display "\002deop_flood:\002 $lol(deop_flood)"
		append param_display "   "
		append param_display "\002ctcp_flood:\002 $lol(ctcp_flood)"
		append param_display "   "
		append param_display "\002kick_flood:\002 $lol(kick_flood)"
		append param_display "   "
		append param_display "\002chan_parameters:\002 $lol(chan_parameters)"
		puthelp "NOTICE $nick :$param_display"
		set param_display ""
		append param_display "\002ban_protect:\002 $lol(ban_protect)"
		append param_display "   "
		append param_display "\002chanmode:\002 $lol(chanmode)"
		append param_display "   "
		append param_display "\002server_flags:\002 $lol(server_flags)"
		append param_display "   "
		append param_display "\002welcome:\002 $lol(welcome)"
		append param_display "   "
		append param_display "\002idle_protect:\002 $lol(idle_protect)"
		append param_display "   "
		append param_display "\002warn_idle_time:\002 $lol(warn_idle_time)"
		append param_display "   "
		append param_display "\002max_idle_time:\002 $lol(max_idle_time)"
		append param_display "   "
		append param_display "\002kick_idle_time:\002 $lol(kick_idle_time)"
		append param_display "   "
		append param_display "\002idle_ban_time:\002 $lol(idle_ban_time)"
		append param_display "   "
		append param_display "\002no_kick_flags:\002 $lol(no_kick_flags)"
		append param_display "   "
		append param_display "\002no_ban_flags:\002 $lol(no_ban_flags)"
		append param_display "   "
		append param_display "\002no_idle_flags:\002 $lol(no_idle_flags)"
		puthelp "NOTICE $nick :$param_display"
		set param_display ""
		append param_display "\002welmsg:\002 $lol(welmsg)"
		puthelp "NOTICE $nick :$param_display"
		set param_display ""
		append param_display "\002away:\002 $lol(away)"
		puthelp "NOTICE $nick :$param_display"
		return 0
	}
	set lol([strlwr [lindex $arg 0]]) [lrange $arg 1 end]
	puthelp "NOTICE $nick :The new value of [strlwr [lindex $arg 0]] is [lrange $arg 1 end]."
	return 0
}

### !ENABLE <nick>

proc pub_lol_enable {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] != 1} {
		puthelp "NOTICE $nick :\002Usage:\002 [string trim $lol(cmdchar)]enable <nick>"
		return 0
	}
	set who [lindex $arg 0]
	set whohand [nick2hand $who $chan]
	if {![onchan $who $chan]} {
		puthelp "NOTICE $nick :Sorry, but i don't find $who in $chan."
		return 0
	}
	if {[strlwr $who] == [strlwr $botnick]} {
		puthelp "NOTICE $nick :I don't need to be enabled, my name is activator :)"
		return 0
	}
	if {$whohand == "*"} {
		puthelp "NOTICE $nick :I don't recognize $who as an user."
		return 0
	}
	if {[getuser $whohand xtra auth] != "DEAD"} {
		puthelp "NOTICE $nick :$who is already enabled."
		return 0
	}
	setuser $whohand xtra auth 0
	puthelp "NOTICE $nick :$who is now enabled."
	return 0
}

### !DISABLE <nick>

proc pub_lol_disable {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] != 1} {
		puthelp "NOTICE $nick :\002Usage:\002 [string trim $lol(cmdchar)]disable <nick>"
		return 0
	}
	set who [lindex $arg 0]
	set whohand [nick2hand $who $chan]
	if {![onchan $who $chan]} {
		puthelp "NOTICE $nick :Sorry, but i don't find $who in $chan."
		return 0
	}
	if {[strlwr $who] == [strlwr $botnick]} {
		puthelp "NOTICE $nick :I can't be disabled, my name is activator :)"
		return 0
	}
	if {$whohand == "*"} {
		puthelp "NOTICE $nick :I don't recognize $who as an user."
		return 0
	}
	if {[getuser $whohand xtra auth] == "DEAD"} {
		puthelp "NOTICE $nick :$who is already disabled."
		return 0
	}
	setuser $whohand xtra auth DEAD
	chattr $whohand -3
	puthelp "NOTICE $nick :$who is now disabled."
	return 0
}

### !ONLINE

proc pub_lol_online {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol server {server-online} uptime botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	set ip [lindex [split $server ":"] 0]
	set port [lindex [split [lindex [split $server ":"] 1] "-"] 0]
	set timeon [time_diff ${server-online}]
	set numbots 0
	foreach bot [bots] {
		incr numbots
	}
	set numchans 0
	foreach ch [channels] {
		incr numchans
	}
	set msg ""
	append msg "\037*** ONLINE INFOS !!! ***\037 "
	append msg "I have not crashed since [time_diff $uptime] ;) "
	append msg "\002I'm on $ip since $timeon.\002 "
	append msg "I'm on $numchans chans. "
	if {$numbots != 0} {
		append msg "\002I'm linked with $numbots bots.\002 "
	} {
		append msg "\002I'm not linked with bots.\002 "
	}
	puthelp "PRIVMSG $chan :$msg"
}

### !BROADCAST <text>

proc pub_lol_broadcast {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] < 1} {
		puthelp "NOTICE $nick :\002Usage:\002 [string trim $lol(cmdchar)]broadcast <text>"
		return 0
	}
	foreach c [channels] {
		if {[matchattr $hand o|o $c] && [strlwr $c] != [strlwr $chan]} {
			if {$lol(color) == 1} {
				puthelp "PRIVMSG $c :\00314\[\003\002$nick\002\00314\]\003 $arg"
			} {
				puthelp "PRIVMSG $c :\[\002$nick\002\] $arg"
			}
		}
	}
}

### !STATS

proc pub_lol_stats {nick host han chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $han $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $han]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	set op 0
	set voice 0
	set reco 0
	set normal 0
	set total 0
	foreach vnick [chanlist $chan] {
		if {[nick2hand $vnick $chan] != "*"} {
			incr reco
		}
		if {[isop $vnick $chan]} {
			incr op
		}
		if {[isvoice $vnick $chan] && ![isop $vnick $chan]} {
			incr voice
		}
		if {![isvoice $vnick $chan] && ![isop $vnick $chan] && [nick2hand $vnick $chan] == "*" && [strlwr $vnick] != [strlwr $botnick]} {
			incr normal
		}
		incr total
	}
	set reco_pc [expr (100 / $total) * $reco]
	set op_pc [expr (100 / $total) * $op]
	set voice_pc [expr (100 / $total) * $voice]
	set normal_pc [expr (100 / $total) * $normal]
	puthelp "PRIVMSG $chan :\037*** $chan STATS !!! ***\037 \002Oped:\002 $op ($op_pc%) \002Voiced:\002 $voice ($voice_pc%) \002Bot users:\002 $reco ($reco_pc%) \002Other:\002 $normal ($normal_pc%) \002Total:\002 $total"
}

### !SEEN <nick|hand>

proc pub_lol_seen {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol
	if {![validuser $hand] && $lol(seen) == 0} {return 0}
	if {[llength $arg] != 1} {
		puthelp "NOTICE $nick :\002Usage\002: !seen <nick|hand>"
		return 0
	}
	set who [lindex $arg 0]
	if {$lol(color) == 1} {
		set prefix "\00314\[\003\002$nick\002\00314\]\003 "
	} {
		set prefix "\[\002$nick\002\] "
	}
	append msg $prefix [lol_seen $nick $hand $who $chan]
	puthelp "PRIVMSG $chan :$msg"
	return 0
}

### !BANLIST

proc pub_lol_banlist {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	set num 1
	puthelp "NOTICE $nick :\037*** $chan BANS INFOS !!! ***"
	foreach bans [banlist $chan] {
		set victim [lindex $bans 0]
		set why [lindex $bans 1]
		set expire [lindex $bans 2]
		set who [lindex $bans 5]
		set remain [expr $expire - [unixtime]]
		if {$remain > 0} {
			set remain "expire in [time_diff2 $expire]."
		} {
			set remain "PermBan"
		}
		puthelp "NOTICE $nick :\002BAN $num:\002 $victim, $remain"
		puthelp "NOTICE $nick :$who: $why"
		incr num
	}
	if {$num == 1} {puthelp "NOTICE $nick :There is no bans in $chan."}
	return 0
}

### !BANMASK <mask> [time] [reason]

proc pub_lol_banmask {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] < 1} {
		puthelp "NOTICE $nick :\002Usage\002: !banmask <mask> \[time\] \[reason\]"
		return 0
	}
	set mask [lindex $arg 0]
	if {[string first "!" $mask] == -1 && [string first "@" $mask] == -1} {set mask $mask!*@*}
#	if {[string first "!" $mask] == -1} {set mask *!*$mask}
	if {[string first "@" $mask] == -1} {set mask $mask*@*}
	set ti [lindex $arg 1]
	if {[number $ti]} {
		set reason [lrange $arg 2 end]
	} {
		set ti ""
		set reason [lrange $arg 1 end]
	}
	if {$reason == ""} {
		set reason "requested"
	}
	if {[botisop $chan]} {pushmode $chan +b $mask}
	switch $ti {
		""
		{
			newchanban $chan $mask $nick $reason
			puthelp "NOTICE $nick :New mask added: $mask"
		}
		0
		{
			newchanban $chan $mask $nick $reason $ti
			puthelp "NOTICE $nick :New mask added permanently: $mask"
		}
		default
		{
			newchanban $chan $mask $nick $reason $ti
			puthelp "NOTICE $nick :New mask added for $ti minutes: $mask"
		}
	}
	return 0
}

### !BAN <nick|mask> [time] [reason]

proc pub_lol_ban {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] < 1} {
		puthelp "NOTICE $nick :\002Usage:\002 [string trim $lol(cmdchar)]ban <nick|mask> \[time\] \[reason\]"
		return 0
	}
	set who [lindex $arg 0]
	set ti [lindex $arg 1]
	if {[number $ti]} {
		set reason [lrange $arg 2 end]
	} {
		set ti ""
		set reason [lrange $arg 1 end]
	}
	if {$reason == ""} {set reason "requested"}
	if {[string first "*" $who] != -1 || [string first "?" $who] != -1} {
		if {$reason == "requested"} {set reason "MaskBan: $who"}
		set who [strlwr $who]
		set bancount 0
		set flags "-$lol(no_ban_flags)&-$lol(no_ban_flags)"
		if {$lol(no_ban_flags) == ""} {
			set list [strlwr [chanlist $chan]]
		} {
			set list [strlwr [chanlist $chan $flags]]
		}
		foreach chanuser $list {
			set banmask ""
			if {[string match [strlwr $who] [strlwr $chanuser]] && $chanuser != [strlwr $botnick] && $chanuser != [strlwr $nick] && ![isop $chanuser $chan] && ![isvoice $chanuser $chan]} {
				incr bancount
				set ipmask [lindex [split [maskhost $chanuser![getchanhost $chanuser $chan]] "@"] 1]
				set userm [lindex [split [getchanhost $chanuser $chan] "@"] 0]
				set banmask *!*$userm@$ipmask
				newchanban $chan $banmask $nick $reason
				if {[botisop $chan]} {
					putserv "MODE $chan +b $banmask"
					putserv "KICK $chan $chanuser :$nick: $reason"
				}
			}
		}
		if {$bancount == 0} {
			puthelp "NOTICE $nick :Sorry but nobody match this mask."
		}
	} {
		if {![onchan $who $chan]} {
			puthelp "NOTICE $nick :Sorry, but i don't find $who in $chan."
			return 0
		}
		if {[strlwr $who] == [strlwr $botnick]} {
			puthelp "NOTICE $nick :Yeah right, like I'm going to let you ban ME!"
			return 0
		}
		if {[nick2hand $who $chan] != "*"} {
			if {$hand != [nick2hand $who $chan]} {
				if {[matchattr [nick2hand $who $chan] o|o $chan] && ![matchattr $hand o|o $chan]} {
					puthelp "NOTICE $nick :Sorry, you must to be an operator to ban an operator."
					return 0
				}
				if {([matchattr [nick2hand $who $chan] m|m $chan] || [matchattr [nick2hand $who $chan] b]) && ![matchattr $hand m|m $chan]} {
					puthelp "NOTICE $nick :Sorry, you must to be a master to ban a master or a bot."
					return 0
				}
			}
		}
		set ipmask [lindex [split [maskhost $who![getchanhost $who $chan]] "@"] 1]
		set userm [lindex [split [getchanhost $who $chan] "@"] 0]
		set banmask *!*$userm@$ipmask
		if {[botisop $chan]} {
			if {[isop $who $chan]} {pushmode $chan -o $who}
			putserv "MODE $chan +b $banmask"
			putserv "KICK $chan $who :$reason"
		}
		switch $ti {
			""
			{
				newchanban $chan $banmask $nick $reason
				puthelp "NOTICE $nick :New mask added: $mask"
			}
			0
			{
				newchanban $chan $banmask $nick $reason $ti
				puthelp "NOTICE $nick :New mask added permanently: $mask"
			}
			default
			{
				newchanban $chan $banmask $nick $reason $ti
				puthelp "NOTICE $nick :New mask added for $ti minutes: $mask"
			}
		}
	}
	return 0
}

### !UNBAN <mask|number>

proc pub_lol_unban {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] != 1} {
		puthelp "NOTICE $nick :\002Usage:\002 [string trim $lol(cmdchar)]unban <mask|number>"
		return 0
	}
	set numban 0
	set banmask ""
	set mask [lindex $arg 0]
	if {[botisop $chan]} {pushmode $chan -b $mask}
	if {[number $mask]} {
		set find 0
		set victim ""
		foreach bans [banlist $chan] {
			incr find
			if {$find == $mask} {
				set victim [lindex $bans 0]
			}
		}
		if {$victim == ""} {
			puthelp "NOTICE $nick :There is no ban number $mask in this chan, type !banlist."
			return 0
		}
		if {[killchanban $chan $victim]} {
			if {[botisop $chan]} {
				pushmode $chan -b $victim
				if {[lindex [split $victim "@"] 1] == "*"} {
					pushmode $chan -b [lindex [split $victim "@"] 0]
				}
			}
			puthelp "NOTICE $nick :Ban sucefully removed: $victim"
			return 0
		}
	}
	if {[string first "!" $mask] == -1 && [string first "@" $mask] == -1} {set mask $mask!*@*}
#	if {[string first "!" $mask] == -1} {set mask *!*$mask}
	if {[string first "@" $mask] == -1} {set mask $mask*@*}
	set find 0
	foreach bans [banlist $chan] {
		set victim [lindex $bans 0]
		if {[strlwr $victim] == [strlwr $mask]} {set find 1}
	}
	if {$find == 0} {
		puthelp "NOTICE $nick :Your mask don't match exactly a ban, use !banlist to see the bans."
		return 0
	}
	if {[killchanban $chan $mask]} {
		puthelp "NOTICE $nick :Ban sucefully removed."
	} {
		puthelp "NOTICE $nick :No such ban."
	}
	return 0
}

### !MODE <chanmode>

proc pub_lol_chan {nick host hand chan mode} {
	if {![botisop $chan]} {return 0}
	set arg [charfilter $mode]
	global lol botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] != 1} {
		puthelp "NOTICE $nick :\002Usage:\002 [string trim $lol(cmdchar)]mode <chanmode>"
		return 0
	}
	if {$lol(chankey) == 1} {
		if {[string first k [lindex $mode 0]] != -1} {
			set posmode [string first k [lindex $mode 0]]
			if {[string first l [lindex $mode 0]] != -1} {
				set poslim [string first l [lindex $mode 0]]
				if {$posmode < $poslim} {
					channel set $chan need-key "chankey $chan [lindex $mode 1]"
				} {
					channel set $chan need-key "chankey $chan [lindex $mode 2]"
				}
			} {
				channel set $chan need-key "chankey $chan [lindex $mode 1]"
			}
		}
	}
	pushmode $chan $mode
	return 0
}

### !ADDUSER <nick> [hand]

proc pub_lol_adduser {me b c chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $c $me $b]} {
		if {$lol(silent) == 1 || [checksilent $c]} {return 0}
		puthelp "NOTICE $me :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] < 1} {
		puthelp "NOTICE $me :\002Usage:\002 [string trim $lol(cmdchar)]adduser <nick> \[hand\]"
		return 0
	}
	set nick [lindex $arg 0]
	set alternate [lindex $arg 1]
	set bot [strlwr $botnick]
	set hostmask "$nick![getchanhost $nick $chan]"
	set hand [nick2hand $nick $chan]
	if {![onchan $nick $chan]} {
		puthelp "NOTICE $me :Sorry, but i don't find $nick in $chan."
		return 0
	}
	if {[strlwr $nick] == $bot} {
		puthelp "NOTICE $me :Sorry, but i can't adduser myself."
		return 0
	}
	if {[getting-users]} {
		puthelp "NOTICE $me :Sorry, but i'm transferring userfile, try later."
		return 0
	}
	if {[validuser $hand]} {
		puthelp "NOTICE $me :$nick is already recognized with this hand: $hand"
	} {
		if {[validuser $nick] && $alternate == ""} {
			puthelp "NOTICE $me :The hand $nick already exist. \002Usage:\002 !adduser <nick> <hand> "
			return 0
		}
		if {$alternate != ""} {
			if {[validuser $alternate]} {
				puthelp "NOTICE $me :The hand $alternate already exist. Choose an other. \002Usage:\002 !adduser <nick> <hand>"
				return 0
			}
			adduser $alternate [maskhost $hostmask]
			puthelp "NOTICE $me :New user: $alternate ([maskhost $hostmask])"
			puthelp "NOTICE $nick :You have been added in $botnick userlist by $me with the hand: $alternate."
			puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick pass <your_password>\002"
			return 0
		}
		adduser $nick [maskhost $hostmask]
		puthelp "NOTICE $me :New user: $nick ([maskhost $hostmask])"
		puthelp "NOTICE $nick :You have been added in $botnick userlist by $me with the hand: $nick."
		puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick pass <your_password>\002"
		return 0
	}
	if {$alternate != ""} {
		if {[validuser $alternate]} {
			puthelp "NOTICE $me :The hand $alternate already exist. \002Usage:\002 !adduser <nick> <hand>"
			return 0
		}
		adduser $alternate [maskhost $hostmask]
		puthelp "NOTICE $me :New user: $alternate ([maskhost $hostmask])"
		puthelp "NOTICE $nick :You have been added in $botnick userlist by $me with the hand: $alternate."
		puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick PASS <your_password>\002"
		return 0
	}
	return 0
}

### !DELUSER <nick>

proc pub_lol_deluser {me b c chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $c $me $b]} {
		if {$lol(silent) == 1 || [checksilent $c]} {return 0}
		puthelp "NOTICE $me :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] != 1} {
		puthelp "NOTICE $me :\002Usage:\002 [string trim $lol(cmdchar)]deluser <nick>"
		return 0
	}
	set nick [lindex $arg 0]
	set bot [strlwr $botnick]
	set hand [nick2hand $nick $chan]
	if {![onchan $nick $chan]} {
		puthelp "NOTICE $me :Sorry, but i don't find $nick in $chan."
		return 0
	}
	if {[strlwr $nick] == $bot} {
		puthelp "NOTICE $me :Yeah right, like I'm going to let you del ME!"
		return 0
	}
	if {[getting-users]} {
		puthelp "NOTICE $me :Sorry, but i'm transferring userfile, try later."
		return 0
	}
	if {![validuser $hand]} {
		puthelp "NOTICE $me :$nick is not a registered user."
		return 0
	}
	if {[matchattr $hand n]} {
		puthelp "NOTICE $me :You can't delete a bot owner."
		return 0
	}
	deluser $hand
	boot $hand "You have been deleted"
	puthelp "NOTICE $me :$nick has been removed from userlist."
	puthelp "NOTICE $nick :You have been removed of userlist by $me."
	if {[botisop $chan]} {pushmode $chan -o $nick}
	return 0
}

### !ADDMASTER <nick> [hand] [f]

proc pub_lol_addmaster {me b c chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $c $me $b]} {
		if {$lol(silent) == 1 || [checksilent $c]} {return 0}
		puthelp "NOTICE $me :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] < 1} {
		puthelp "NOTICE $me :\002Usage:\002 [string trim $lol(cmdchar)]addmaster <nick> \[hand\] \[f\]"
		return 0
	}
	set nick [lindex $arg 0]
	set alternate [lindex $arg 1]
	set f [strlwr [lindex $arg 2]]
	set bot [strlwr $botnick]
	set hostmask "$nick![getchanhost $nick $chan]"
	set hand [nick2hand $nick $chan]
	if {![onchan $nick $chan]} {
		puthelp "NOTICE $me :Sorry, but i don't find $nick in $chan."
		return 0
	}
	if {[strlwr $nick] == $bot} {
		puthelp "NOTICE $me :Sorry, but i can't addmaster myself."
		return 0
	}
	if {[getting-users]} {
		puthelp "NOTICE $me :Sorry, but i'm transferring userfile, try later."
		return 0
	}
	if {$f == "f"} {
		if {![validuser $alternate]} {
			adduser $alternate [maskhost $hostmask]
			chattr $alternate +p|+m $chan
			puthelp "NOTICE $me :New user: $alternate ([maskhost $hostmask])"
			puthelp "NOTICE $me :$nick added in $chan masterlist and party-line with the hand: $alternate."
			puthelp "NOTICE $nick :You have been added in $chan masterlist and party-line by $me with the hand: $alternate."
			puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick PASS <your_password>\002"
			if {[botisop $chan] && ![isop $nick $chan]} {
				pushmode $chan +o $nick
			}
			return 0
		}
		setuser $alternate HOSTS [maskhost $hostmask]
		chattr $alternate -|+m $chan
		puthelp "NOTICE $me :Added hostmask for $alternate: [maskhost $hostmask]"
		puthelp "NOTICE $me :$nick added in $chan masterlist with the hand: $alternate."
		puthelp "NOTICE $nick :You have been added in $chan masterlist by $me with the hand: $alternate."
		if {[botisop $chan] && ![isop $nick $chan]} {
			pushmode $chan +o $nick
		}
		return 0
	}
	if {![validuser $hand]} {
		if {[validuser $nick]&& $alternate == ""} {
			puthelp "NOTICE $me :The hand $nick already exist. \002Usage:\002 !addmaster <nick> <hand> \[f\]"
			return 0
		}
		if {$alternate != ""} {
			if {[validuser $alternate]} {
				puthelp "NOTICE $me :The hand $alternate already exist. Choose an other. \002Usage:\002 !addmaster <nick> <hand> \[f\]"
				return 0
			}
			adduser $alternate [maskhost $hostmask]
			chattr $alternate +p|+m $chan
			puthelp "NOTICE $me :New user: $alternate ([maskhost $hostmask])"
			puthelp "NOTICE $me :$nick added in $chan masterlist and party-line with the hand: $alternate."
			puthelp "NOTICE $nick :You have been added in $chan masterlist and party-line by $me with the hand: $alternate."
			puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick pass <your_password>\002"
			if {[botisop $chan] && ![isop $nick $chan]} {
				pushmode $chan +o $nick
			}
			return 0
		}
		adduser $nick [maskhost $hostmask]
		chattr $nick +p|+m $chan
		puthelp "NOTICE $me :New user: $nick ([maskhost $hostmask])"
		puthelp "NOTICE $me :$nick added in $chan masterlist and party-line with the hand: $nick."
		puthelp "NOTICE $nick :You have been added in $chan masterlist and party-line by $me with the hand: $nick."
		puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick pass <your_password>\002"
		if {[botisop $chan] && ![isop $nick $chan]} {
			pushmode $chan +o $nick
		}
		return 0
	}
	if {$alternate != ""} {
		if {[validuser $alternate]} {
			puthelp "NOTICE $me :The hand $alternate already exist. \002Usage:\002 !addmaster <nick> <hand> \[f\]"
			return 0
		}
		adduser $alternate [maskhost $hostmask]
		chattr $alternate +p|+o $chan
		puthelp "NOTICE $me :New user: $alternate ([maskhost $hostmask])"
		puthelp "NOTICE $me :$nick added in $chan masterlist and party-line with the hand: $alternate."
		puthelp "NOTICE $nick :You have been added in $chan masterlist and party-line by $me with the hand: $alternate."
		puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick PASS <your_password>\002"
		if {[botisop $chan] && ![isop $nick $chan]} {
			pushmode $chan +o $nick
		}
		return 0
	}
	if {[matchattr $hand -|+m $chan]} {
		puthelp "NOTICE $me :$nick is already master in $chan with this hand: $hand"
	} {
		chattr $hand -|+m $chan
		puthelp "NOTICE $me :$nick added in $chan masterlist with this hand: $hand."
		puthelp "NOTICE $nick :You have been added in $chan masterlist by $me."
	}
	if {[botisop $chan] && ![isop $nick $chan]} {
		pushmode $chan +o $nick
		return 0
	}
	return 0
}

### !DELMASTER <nick>

proc pub_lol_delmaster {me b c chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $c $me $b]} {
		if {$lol(silent) == 1 || [checksilent $c]} {return 0}
		puthelp "NOTICE $me :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] != 1} {
		puthelp "NOTICE $me :\002Usage:\002 [string trim $lol(cmdchar)]delmaster <nick>"
		return 0
	}
	set nick [lindex $arg 0]
	set bot [strlwr $botnick]
	set hand [nick2hand $nick $chan]
	if {![onchan $nick $chan]} {
		puthelp "NOTICE $me :Sorry, but i don't find $nick in $chan."
		return 0
	}
	if {[strlwr $nick] == $bot} {
		puthelp "NOTICE $me :Yeah right, like I'm going to let you delmaster ME!"
		return 0
	}
	if {![validuser $hand]} {
		puthelp "NOTICE $me :$nick is not a registered user."
		if {[botisop $chan] && [isop $nick $chan]} {
			pushmode $chan -o $nick
		}
		return 0
	}
	if {[getting-users]} {
		puthelp "NOTICE $me :Sorry, but i'm transferring userfile, try later."
		return 0
	}
	if {![matchattr $hand -|+m $chan]} {
		puthelp "NOTICE $me :$nick is not master in $chan"
	} {
		chattr $hand -|-m $chan
		puthelp "NOTICE $me :$nick has been removed of $chan masterlist."
		puthelp "NOTICE $nick :You have been removed of $chan masterlist by $me."
	}
	return 0
}

### !ADDOP <nick> [hand] [f]

proc pub_lol_addop {me b c chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $c $me $b]} {
		if {$lol(silent) == 1 || [checksilent $c]} {return 0}
		puthelp "NOTICE $me :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] < 1} {
		puthelp "NOTICE $me :\002Usage:\002 [string trim $lol(cmdchar)]addop <nick> \[hand\] \[f\]"
		return 0
	}
	set nick [lindex $arg 0]
	set alternate [lindex $arg 1]
	set f [strlwr [lindex $arg 2]]
	set bot [strlwr $botnick]
	set hostmask "$nick![getchanhost $nick $chan]"
	set hand [nick2hand $nick $chan]
	if {![onchan $nick $chan]} {
		puthelp "NOTICE $me :Sorry, but i don't find $nick in $chan."
		return 0
	}
	if {[strlwr $nick] == $bot} {
		puthelp "NOTICE $me :Sorry, but i can't addop myself."
		return 0
	}
	if {[getting-users]} {
		puthelp "NOTICE $me :Sorry, but i'm transferring userfile, try later."
		return 0
	}
	if {$f == "f"} {
		if {![validuser $alternate]} {
			adduser $alternate [maskhost $hostmask]
			chattr $alternate +p|+o $chan
			puthelp "NOTICE $me :New user: $alternate ([maskhost $hostmask])"
			puthelp "NOTICE $me :$nick added in $chan oplist and party-line with the hand: $alternate."
			puthelp "NOTICE $nick :You have been added in $chan oplist and party-line by $me with the hand: $alternate."
			puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick PASS <your_password>\002"
			if {[botisop $chan] && ![isop $nick $chan]} {
				pushmode $chan +o $nick
			}
			return 0
		}
		setuser $alternate HOSTS [maskhost $hostmask]
		chattr $alternate -|+o $chan
		puthelp "NOTICE $me :Added hostmask for $alternate: [maskhost $hostmask]"
		puthelp "NOTICE $me :$nick added in $chan oplist with the hand: $alternate."
		puthelp "NOTICE $nick :You have been added in $chan oplist by $me with the hand: $alternate."
		if {[botisop $chan] && ![isop $nick $chan]} {
			pushmode $chan +o $nick
		}
		return 0
	}
	if {![validuser $hand]} {
		if {[validuser $nick] && $alternate == ""} {
			puthelp "NOTICE $me :The hand $nick already exist. \002Usage:\002 !addop <nick> <hand> \[f\]"
			return 0
		}
		if {$alternate != ""} {
			if {[validuser $alternate]} {
				puthelp "NOTICE $me :The hand $alternate already exist. Choose an other. \002Usage:\002 !addop <nick> <hand> \[f\]"
				return 0
			}
			adduser $alternate [maskhost $hostmask]
			chattr $alternate +p|+o $chan
			puthelp "NOTICE $me :New user: $alternate ([maskhost $hostmask])"
			puthelp "NOTICE $me :$nick added in $chan oplist and party-line with the hand: $alternate."
			puthelp "NOTICE $nick :You have been added in $chan oplist and party-line by $me with the hand: $alternate."
			puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick pass <your_password>\002"
			if {[botisop $chan] && ![isop $nick $chan]} {
				pushmode $chan +o $nick
			}
			return 0
		}
		adduser $nick [maskhost $hostmask]
		chattr $nick +p|+o $chan
		puthelp "NOTICE $me :New user: $nick ([maskhost $hostmask])"
		puthelp "NOTICE $me :$nick added in $chan oplist and party-line with the hand: $nick."
		puthelp "NOTICE $nick :You have been added in $chan oplist and party-line by $me with the hand: $nick."
		puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick pass <your_password>\002"
		if {[botisop $chan] && ![isop $nick $chan]} {
			pushmode $chan +o $nick
		}
		return 0
	}
	if {$alternate != ""} {
		if {[validuser $alternate]} {
			puthelp "NOTICE $me :The hand $alternate already exist. \002Usage:\002 !addop <nick> <hand> \[f\]"
			return 0
		}
		adduser $alternate [maskhost $hostmask]
		chattr $alternate +p|+o $chan
		puthelp "NOTICE $me :New user: $alternate ([maskhost $hostmask])"
		puthelp "NOTICE $me :$nick added in $chan oplist and party-line with the hand: $alternate."
		puthelp "NOTICE $nick :You have been added in $chan oplist and party-line by $me with the hand: $alternate."
		puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick PASS <your_password>\002"
		if {[botisop $chan] && ![isop $nick $chan]} {
			pushmode $chan +o $nick
		}
		return 0
	}
	if {[matchattr $hand -|+o $chan]} {
		puthelp "NOTICE $me :$nick is already op in $chan with this hand: $hand"
	} {
		chattr $hand -|+o $chan
		puthelp "NOTICE $me :$nick added in $chan oplist with this hand: $hand."
		puthelp "NOTICE $nick :You have been added in $chan oplist by $me."
	}
	if {[botisop $chan] && ![isop $nick $chan]} {
		pushmode $chan +o $nick
		return 0
	}
	return 0
}

### !DELOP <nick>

proc pub_lol_delop {me b c chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $c $me $b]} {
		if {$lol(silent) == 1 || [checksilent $c]} {return 0}
		puthelp "NOTICE $me :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] != 1} {
		puthelp "NOTICE $me :\002Usage:\002 [string trim $lol(cmdchar)]delop <nick>"
		return 0
	}
	set nick [lindex $arg 0]
	set bot [strlwr $botnick]
	set hand [nick2hand $nick $chan]
	if {![onchan $nick $chan]} {
		puthelp "NOTICE $me :Sorry, but i don't find $nick in $chan."
		return 0
	}
	if {[strlwr $nick] == $bot} {
		puthelp "NOTICE $me :Yeah right, like I'm going to let you delop ME!"
		return 0
	}
	if {![validuser $hand]} {
		puthelp "NOTICE $me :$nick is not a registered user."
		if {[botisop $chan] && [isop $nick $chan]} {
			pushmode $chan -o $nick
		}
		return 0
	}
	if {[getting-users]} {
		puthelp "NOTICE $me :Sorry, but i'm transferring userfile, try later."
		return 0
	}
	if {![matchattr $hand -|+o $chan]} {
		puthelp "NOTICE $me :$nick is not op in $chan"
	} {
		chattr $hand -|-o $chan
		puthelp "NOTICE $me :$nick has been removed of $chan oplist."
		puthelp "NOTICE $nick :You have been removed of $chan oplist by $me."
	}
	if {[botisop $chan]} {
		if {[botisop $chan] && [isop $nick $chan]} {
			pushmode $chan -o $nick
		}
		return 0
	}
	return 0
}

### !OP [nick]

proc pub_lol_op {a b c chan arg} {
	if {![botisop $chan]} {return 0}
	set arg [charfilter $arg]
	global lol botnick
	if {![check $c $a $b]} {
		if {$lol(silent) == 1 || [checksilent $c]} {return 0}
		puthelp "NOTICE $a :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	set nick [lindex $arg 0]
	set hostmask "$nick![getchanhost $nick $chan]"
	set hand [nick2hand $nick $chan]
	if {$nick == ""} {
		if {![isop $a $chan]} {
			pushmode $chan +o $a
		}
		return 0
	}

	if {![onchan $nick $chan]} {
		puthelp "NOTICE $a :Sorry, but i don't find $nick in $chan."
		return 0
	}
	if {[strlwr $nick] == [strlwr $botnick]} {
		return 0
	}
	if {![isop $nick $chan]} {
		pushmode $chan +o $nick
		return 0
	}
	return 0
}

### !DEOP [nick]

proc pub_lol_deop {a b c chan arg} {
	if {![botisop $chan]} {return 0}
	set arg [charfilter $arg]
	global lol botnick
	if {![check $c $a $b]} {
		if {$lol(silent) == 1 || [checksilent $c]} {return 0}
		puthelp "NOTICE $a :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	set nick [lindex $arg 0]
	set bot [strlwr $botnick]
	set hand [nick2hand $nick $chan]
	if {$nick == ""} {
		if {[isop $a $chan]} {
			pushmode $chan -o $a
		}
		return 0
	}
	if {![onchan $nick $chan]} {
		puthelp "NOTICE $a :Sorry, but i don't find $nick in $chan."
		return 0
	}
	if {[strlwr $nick] == $bot} {
		puthelp "NOTICE $a :Yeah right, like I'm going to let you deop ME!"
		return 0
	}
	if {$hand != "*"} {
		if {$c != $hand} {
			if {[matchattr $hand o|o $chan] && ![matchattr $c o|o $chan]} {
				puthelp "NOTICE $a :Sorry, you must to be an operator to deop an operator."
				return 0
			}
			if {([matchattr $hand m|m $chan] || [matchattr $hand b]) && ![matchattr $c m|m $chan]} {
				puthelp "NOTICE $a :Sorry, you must to be a master to deop a master or a bot."
				return 0
			}
		}
	}
	if {[isop $nick $chan]} {pushmode $chan -o $nick}
	return 0
}

### !ADDVOICE <nick> [hand] [f]

proc pub_lol_addvoice {me b c chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $c $me $b]} {
		if {$lol(silent) == 1 || [checksilent $c]} {return 0}
		puthelp "NOTICE $me :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] < 1} {
		puthelp "NOTICE $me :\002Usage:\002 [string trim $lol(cmdchar)]addvoice <nick> \[hand\] \[f\]"
		return 0
	}
	set nick [lindex $arg 0]
	set alternate [lindex $arg 1]
	set f [strlwr [lindex $arg 2]]
	set bot [strlwr $botnick]
	set hostmask "$nick![getchanhost $nick $chan]"
	set hand [nick2hand $nick $chan]
	if {![onchan $nick $chan]} {
		puthelp "NOTICE $me :Sorry, but i don't find $nick in $chan."
		return 0
	}
	if {[strlwr $nick] == $bot} {
		puthelp "NOTICE $me :Sorry, but i can't addvoice myself."
		return 0
	}
	if {[getting-users]} {
		puthelp "NOTICE $me :Sorry, but i'm transferring userfile, try later."
		return 0
	}
	if {$f == "f"} {
		if {![validuser $alternate]} {
			adduser $alternate [maskhost $hostmask]
			chattr $alternate +p|+v $chan
			puthelp "NOTICE $me :New user: $alternate ([maskhost $hostmask])"
			puthelp "NOTICE $me :$nick added in $chan voicelist and party-line with the hand: $alternate."
			puthelp "NOTICE $nick :You have been added in $chan voicelist and party-line by $me with the hand: $alternate."
			puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick PASS <your_password>\002"
			if {[botisop $chan] && ![isop $nick $chan] && ![isvoice $nick $chan]} {
				pushmode $chan +v $nick
			}
			return 0
		}
		setuser $alternate HOSTS [maskhost $hostmask]
		chattr $alternate -|+v $chan
		puthelp "NOTICE $me :Added hostmask for $alternate: [maskhost $hostmask]"
		puthelp "NOTICE $me :$nick added in $chan voicelist with the hand: $alternate."
		puthelp "NOTICE $nick :You have been added in $chan voicelist by $me with the hand: $alternate."
		if {[botisop $chan] && ![isop $nick $chan] && ![isvoice $nick $chan]} {
			pushmode $chan +v $nick
		}
		return 0
	}
	if {![validuser $hand]} {
		if {[validuser $nick] && $alternate == ""} {
			puthelp "NOTICE $me :The hand $nick already exist. \002Usage:\002 !addvoice <nick> <hand> \[f\]"
			return 0
		}
		if {$alternate != ""} {
			if {[validuser $alternate]} {
				puthelp "NOTICE $me :The hand $alternate already exist. Choose an other. \002Usage:\002 !addvoice <nick> <hand> \[f\]"
				return 0
			}
			adduser $alternate [maskhost $hostmask]
			chattr $alternate +p|+v $chan
			puthelp "NOTICE $me :New user: $alternate ([maskhost $hostmask])"
			puthelp "NOTICE $me :$nick added in $chan voicelist and party-line with the hand: $alternate."
			puthelp "NOTICE $nick :You have been added in $chan voicelist and party-line by $me with the hand: $alternate."
			puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick pass <your_password>\002"
			if {[botisop $chan] && ![isop $nick $chan] && ![isvoice $nick $chan]} {
				pushmode $chan +v $nick
			}
			return 0
		}
		adduser $nick [maskhost $hostmask]
		chattr $nick +p|+v $chan
		puthelp "NOTICE $me :New user: $nick ([maskhost $hostmask])"
		puthelp "NOTICE $me :$nick added in $chan voicelist and party-line with the hand: $nick."
		puthelp "NOTICE $nick :You have been added in $chan voicelist and party-line by $me with the hand: $nick."
		puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick pass <your_password>\002"
		if {[botisop $chan] && ![isop $nick $chan] && ![isvoice $nick $chan]} {
			pushmode $chan +v $nick
		}
		return 0
	}
	if {$alternate != ""} {
		if {[validuser $alternate]} {
			puthelp "NOTICE $me :The hand $alternate already exist. \002Usage:\002 !addvoice <nick> <hand> \[f\]"
			return 0
		}
		adduser $alternate [maskhost $hostmask]
		chattr $alternate +p|+v $chan
		puthelp "NOTICE $me :New user: $alternate ([maskhost $hostmask])"
		puthelp "NOTICE $me :$nick added in $chan voicelist and party-line with the hand: $alternate."
		puthelp "NOTICE $nick :You have been added in $chan voicelist and party-line by $me with the hand: $alternate."
		puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick PASS <your_password>\002"
		if {[botisop $chan] && ![isop $nick $chan] && ![isvoice $nick $chan]} {
			pushmode $chan +v $nick
		}
		return 0
	}
	if {[matchattr $hand -|+v $chan]} {
		puthelp "NOTICE $me :$nick is already voice in $chan with this hand: $hand"
	} {
		chattr $hand -|+v $chan
		puthelp "NOTICE $me :$nick added in $chan voicelist with this hand: $hand."
		puthelp "NOTICE $nick :You have been added in $chan voicelist by $me."
	}
	if {[botisop $chan] && ![isop $nick $chan] && ![isvoice $nick $chan]} {
		pushmode $chan +v $nick
		return 0
	}
	return 0
}

### !DELVOICE <nick>

proc pub_lol_delvoice {me b c chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $c $me $b]} {
		if {$lol(silent) == 1 || [checksilent $c]} {return 0}
		puthelp "NOTICE $me :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] != 1} {
		puthelp "NOTICE $me :\002Usage:\002 [string trim $lol(cmdchar)]delvoice <nick>"
		return 0
	}
	set nick [lindex $arg 0]
	set bot [strlwr $botnick]
	set hand [nick2hand $nick $chan]
	if {![onchan $nick $chan]} {
		puthelp "NOTICE $me :Sorry, but i don't find $nick in $chan."
		return 0
	}
	if {[strlwr $nick] == $bot} {
		puthelp "NOTICE $me :Yeah right, like I'm going to let you delvoice ME!"
		return 0
	}
	if {![validuser $hand]} {
		puthelp "NOTICE $me :$nick is not a registered user."
		if {[botisop $chan] && [isvoice $nick $chan]} {
			pushmode $chan -v $nick
		}
		return 0
	}
	if {[getting-users]} {
		puthelp "NOTICE $me :Sorry, but i'm transferring userfile, try later."
		return 0
	}
	if {![matchattr $hand -|+v $chan]} {
		puthelp "NOTICE $me :$nick is not voice in $chan"
	} {
		chattr $hand -|-v $chan
		puthelp "NOTICE $me :$nick has been removed of $chan voicelist."
		puthelp "NOTICE $nick :You have been removed of $chan voicelist by $me."
	}
	if {[botisop $chan] && [isvoice $nick $chan]} {
		pushmode $chan -v $nick
		return 0
	}
	return 0
}

### !VOICE [nick]

proc pub_lol_voice {a b c chan arg} {
	if {![botisop $chan]} {return 0}
	set arg [charfilter $arg]
	global lol botnick
	if {![check $c $a $b]} {
		if {$lol(silent) == 1 || [checksilent $c]} {return 0}
		puthelp "NOTICE $a :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	set nick [lindex $arg 0]
	set bot [strlwr $botnick]
	set hand [nick2hand $nick $chan]
	if {$nick == ""} {
		if {[isop $a $chan]} {
			pushmode $chan -o $a
			pushmode $chan +v $a
			return 0
		}
		if {![isop $a $chan] && ![isvoice $a $chan]} {
			pushmode $chan +v $a
		}
		return 0
	}
	if {![onchan $nick $chan]} {
		puthelp "NOTICE $a :Sorry, but i don't find $nick in $chan."
		return 0
	}
	if {[strlwr $nick] == $bot} {
		puthelp "NOTICE $a :Sorry, but i don't want voice myself."
		return 0
	}
	if {[isop $nick $chan]} {
		if {$hand != "*"} {
			if {$c != $hand} {
				if {[matchattr $hand o|o $chan] && ![matchattr $c o|o $chan]} {
					puthelp "NOTICE $a :Sorry, you must to be an operator to voice an operator."
					return 0
				}
				if {([matchattr $hand m|m $chan] || [matchattr $hand b]) && ![matchattr $c m|m $chan]} {
					puthelp "NOTICE $a :Sorry, you must to be a master to voice a master or a bot."
					return 0
				}
			}
		}
		pushmode $chan -o $nick
		pushmode $chan +v $nick
		return 0
	}
	if {![isop $nick $chan] && ![isvoice $nick $chan]} {
		pushmode $chan +v $nick
	}
	return 0
}

### !DEVOICE [nick]

proc pub_lol_devoice {a b c chan arg} {
	if {![botisop $chan]} {return 0}
	set arg [charfilter $arg]
	global lol botnick
	if {![check $c $a $b]} {
		if {$lol(silent) == 1 || [checksilent $c]} {return 0}
		puthelp "NOTICE $a :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	set nick [lindex $arg 0]
	set bot [strlwr $botnick]
	set hand [nick2hand $nick $chan]
	if {$nick == ""} {
		if {[isvoice $a $chan]} {
			pushmode $chan -v $a
		}
		return 0
	}
	if {![onchan $nick $chan]} {
		puthelp "NOTICE $a :Sorry, but i don't find $nick in $chan."
		return 0
	}
	if {[strlwr $nick] == $bot} {
		return 0
	}
	if {[isvoice $nick $chan]} {
		pushmode $chan -v $nick
	}
	return 0
}

### !ADDBOT <nick> [port] [hand]

proc pub_lol_addbot {me b c chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $c $me $b]} {
		if {$lol(silent) == 1 || [checksilent $c]} {return 0}
		puthelp "NOTICE $me :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] < 1} {
		puthelp "NOTICE $me :\002Usage:\002 [string trim $lol(cmdchar)]addbot <nick> \[port\] \[hand\]"
		return 0
	}
	set nick [lindex $arg 0]
	set port [lindex $arg 1]
	if {[number $port]} {
		set alternate [lindex $arg 2]
	} {
		set port 3333
		set alternate [lindex $arg 1]
	}
	set host [lindex [split [getchanhost $nick $chan] "@"] 1]
	set hostmask "*!*[getchanhost $nick $chan]"
	set hand [nick2hand $nick $chan]
	if {![onchan $nick $chan]} {
		puthelp "NOTICE $me :Sorry, but i don't find $nick in $chan."
		return 0
	}
	if {[strlwr $nick] == [strlwr $botnick]} {
		puthelp "NOTICE $me :Sorry, but i can't addbot myself."
		return 0
	}
	if {[getting-users]} {
		puthelp "NOTICE $me :Sorry, but i'm transferring userfile, try later."
		return 0
	}
	if {[validuser $hand]} {
		puthelp "NOTICE $me :$nick is already recognized with this hand: $hand"
		return 0
	} {
		if {[validuser $nick] && $alternate == ""} {
			puthelp "NOTICE $me :The hand $nick already exist. \002Usage:\002 !addbot <nick> <port> <hand>"
			return 0
		}
		if {$alternate != ""} {
			if {[validuser $alternate]} {
				puthelp "NOTICE $me :The hand $alternate already exist. Choose an other. \002Usage:\002 !addbot <nick> <port> <hand>"
				return 0
			}
			addbot $alternate $host:$port
			setuser $alternate hosts $hostmask
			puthelp "NOTICE $me :New bot: $alternate ($hostmask)"
			return 0
		}
		addbot $nick $host:$port
		setuser $nick hosts $hostmask
		puthelp "NOTICE $me :New bot: $nick ($hostmask)"
		return 0
	}
	if {$alternate != ""} {
		if {[validuser $alternate]} {
			puthelp "NOTICE $me :The hand $alternate already exist. \002Usage:\002 !addbot <nick> <port> <hand>"
			return 0
		}
		addbot $alternate $host:$port
		setuser $alternate hosts $hostmask
		puthelp "NOTICE $me :New bot: $alternate ($hostmask)"
		return 0
	}
	return 0
}

### !KICK <nick|mask> [reason]

proc pub_lol_kick {nick host hand chan arg} {
	if {![botisop $chan]} {return 0}
	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] < 1} {
		puthelp "NOTICE $nick :\002Usage:\002 [string trim $lol(cmdchar)]kick <nick|mask> \[reason\]"
		return 0
	}
	set who [lindex $arg 0]
	set reason [lrange $arg 1 end]
	if {$reason == ""} {set reason "requested"}
	if {[string first "*" $who] != -1 || [string first "?" $who] != -1} {
		if {$reason == "requested"} {set reason "MaskKick: $who"}
		if {![matchattr $hand o|o $chan]} {
			puthelp "NOTICE $nick :You need to be an op to use mask kick."
			return 0
		}
		set who [strlwr $who]
		set kickcount 0
		set flags "-$lol(no_kick_flags)&-$lol(no_kick_flags)"
		if {$lol(no_kick_flags) == ""} {
			set list [strlwr [chanlist $chan]]
		} {
			set list [strlwr [chanlist $chan $flags]]
		}
		foreach chanuser $list {
			if {[string match [strlwr $who] [strlwr $chanuser]] && $chanuser != [strlwr $botnick] && $chanuser != [strlwr $nick] && ![isop $chanuser $chan] && ![isvoice $chanuser $chan]} {
				incr kickcount
				putserv "KICK $chan $chanuser :$nick: $reason"
			}
		}
		if {$kickcount == 0} {
			puthelp "NOTICE $nick :Sorry but nobody match this mask."
		}
	} {
		if {![onchan $who $chan]} {
			puthelp "NOTICE $nick :Sorry, but i don't find $who in $chan."
			return 0
		}
		if {[strlwr $who] == [strlwr $botnick]} {
			puthelp "NOTICE $nick :Yeah right, like I'm going to let you kick ME!"
			return 0
		}
		if {[nick2hand $who $chan] != "*"} {
			if {$hand != [nick2hand $who $chan]} {
				if {[matchattr [nick2hand $who $chan] o|o $chan] && ![matchattr $hand o|o $chan]} {
					puthelp "NOTICE $nick :Sorry, you must to be an operator to kick an operator."
					return 0
				}
				if {([matchattr [nick2hand $who $chan] m|m $chan] || [matchattr [nick2hand $who $chan] b]) && ![matchattr $hand m|m $chan]} {
					puthelp "NOTICE $nick :Sorry, you must to be a master to kick a master or a bot."
					return 0
				}
			}
		}
		putserv "KICK $chan $who :$nick: $reason"
	}
	return 0
}

### !QUICK <nick|mask> [reason]

proc pub_lol_quick {nick host hand chan arg} {
	if {![botisop $chan]} {return 0}
	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] < 1} {
		puthelp "NOTICE $nick :\002Usage:\002 [string trim $lol(cmdchar)]quick <nick|mask> \[reason\]"
		return 0
	}
	set who [lindex $arg 0]
	set reason [lrange $arg 1 end]
	if {$reason == ""} {set reason "requested"}
	if {[string first "*" $who] != -1 || [string first "?" $who] != -1} {
		if {$reason == "requested"} {set reason "MaskQuick: $who"}
		set who [strlwr $who]
		set kickcount 0
		set flags "-$lol(no_kick_flags)&-$lol(no_kick_flags)"
		if {$lol(no_kick_flags) == ""} {
			set list [strlwr [chanlist $chan]]
		} {
			set list [strlwr [chanlist $chan $flags]]
		}
		foreach chanuser $list {
			if {[string match [strlwr $who] [strlwr $chanuser]] && $chanuser != [strlwr $botnick] && $chanuser != [strlwr $nick] && ![isop $chanuser $chan] && ![isvoice $chanuser $chan]} {
				incr kickcount
				set hostmask "*!*[getchanhost $chanuser $chan]"
				putserv "MODE $chan +b $hostmask"
				putserv "KICK $chan $chanuser :$nick: $reason"
				utimer 7 "deban $chan $hostmask"
			}
		}
		if {$kickcount == 0} {
			puthelp "NOTICE $nick :Sorry but nobody match this mask."
		}
	} {
		if {![onchan $who $chan]} {
			puthelp "NOTICE $nick :Sorry, but i don't find $who in $chan."
			return 0
		}
		if {[strlwr $who] == [strlwr $botnick]} {
			puthelp "NOTICE $nick :Yeah right, like I'm going to let you kick ME!"
			return 0
		}
		if {[nick2hand $who $chan] != "*"} {
			if {$hand != [nick2hand $who $chan]} {
				if {[matchattr [nick2hand $who $chan] o|o $chan] && ![matchattr $hand o|o $chan]} {
					puthelp "NOTICE $nick :Sorry, you must to be an operator to kick an operator."
					return 0
				}
				if {([matchattr [nick2hand $who $chan] m|m $chan] || [matchattr [nick2hand $who $chan] b]) && ![matchattr $hand m|m $chan]} {
					puthelp "NOTICE $nick :Sorry, you must to be a master to kick a master or a bot."
					return 0
				}
			}
		}
		set hostmask "*!*[getchanhost $who $chan]"
		if {[isop $who $chan]} {pushmode $chan -o $who}
		putserv "MODE $chan +b $hostmask"
		putserv "KICK $chan $who :$nick: $reason"
		utimer 7 "deban $chan $hostmask"
	}
	return 0
}

proc deban {chan hostmask} {
	if{[botisop $chan]} {pushmode $chan -b $hostmask}
}

### CLIENT KICK

proc pub_lol_mirc {nick host hand chan arg} {
	if {![botisop $chan]} {return 0}
	set arg [charfilter $arg]
	global lol botnick lol_mirc_kick remove_kickmirc_timer
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	set flags "-$lol(no_kick_flags)&-$lol(no_kick_flags)"
	if {$lol(no_kick_flags) == ""} {
		set list [strlwr [chanlist $chan]]
	} {
		set list [strlwr [chanlist $chan $flags]]
	}
	foreach chanuser $list {
		if {[strlwr $chanuser] != [strlwr $botnick] && [strlwr $chanuser] != [strlwr $nick] && ![isop $chanuser $chan] && ![isvoice $chanuser $chan]} {
			puthelp "PRIVMSG $chanuser :\001VERSION\001"
		}
	}
	if {$remove_kickmirc_timer != ""} {
		killutimer $remove_kickmirc_timer
	}
	set lol_mirc_kick $chan
	set remove_kickmirc_timer [utimer 60 {
		set lol_mirc_kick ""
		set remove_kickmirc_timer ""
	}]
	kick_chan_check $chan mirc
	return 0
}

proc pub_lol_bitchx {nick host hand chan arg} {
	if {![botisop $chan]} {return 0}
	set arg [charfilter $arg]
	global lol botnick lol_bitchx_kick remove_kickbitchx_timer
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	set flags "-$lol(no_kick_flags)&-$lol(no_kick_flags)"
	if {$lol(no_kick_flags) == ""} {
		set list [strlwr [chanlist $chan]]
	} {
		set list [strlwr [chanlist $chan $flags]]
	}
	foreach chanuser $list {
		if {[strlwr $chanuser] != [strlwr $botnick] && [strlwr $chanuser] != [strlwr $nick] && ![isop $chanuser $chan] && ![isvoice $chanuser $chan]} {
			puthelp "PRIVMSG $chanuser :\001VERSION\001"
		}
	}
	if {$remove_kickbitchx_timer != ""} {
		killutimer $remove_kickbitchx_timer
	}
	set lol_bitchx_kick $chan
	set remove_kickbitchx_timer [utimer 60 {
		set lol_bitchx_kick ""
		set remove_kickbitchx_timer ""
	}]
	kick_chan_check $chan bitchx
	return 0
}

proc pub_lol_ircii {nick host hand chan arg} {
	if {![botisop $chan]} {return 0}
	set arg [charfilter $arg]
	global lol botnick lol_ircii_kick remove_kickircii_timer
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	set flags "-$lol(no_kick_flags)&-$lol(no_kick_flags)"
	if {$lol(no_kick_flags) == ""} {
		set list [strlwr [chanlist $chan]]
	} {
		set list [strlwr [chanlist $chan $flags]]
	}
	foreach chanuser $list {
		if {[strlwr $chanuser] != [strlwr $botnick] && [strlwr $chanuser] != [strlwr $nick] && ![isop $chanuser $chan] && ![isvoice $chanuser $chan]} {
			puthelp "PRIVMSG $chanuser :\001VERSION\001"
		}
	}
	if {$remove_kickircii_timer != ""} {
		killutimer $remove_kickircii_timer
	}
	set lol_ircii_kick $chan
	set remove_kickircii_timer [utimer 60 {
		set lol_ircii_kick ""
		set remove_kickircii_timer ""
	}]
	kick_chan_check $chan ircii
	return 0
}

proc pub_lol_eggdrop {nick host hand chan arg} {
	if {![botisop $chan]} {return 0}
	set arg [charfilter $arg]
	global lol botnick lol_eggdrop_kick remove_kickeggdrop_timer
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	set flags "-$lol(no_kick_flags)&-$lol(no_kick_flags)"
	if {$lol(no_kick_flags) == ""} {
		set list [strlwr [chanlist $chan]]
	} {
		set list [strlwr [chanlist $chan $flags]]
	}
	foreach chanuser $list {
		if {[strlwr $chanuser] != [strlwr $botnick] && [strlwr $chanuser] != [strlwr $nick] && ![isop $chanuser $chan] && ![isvoice $chanuser $chan]} {
			puthelp "PRIVMSG $chanuser :\001VERSION\001"
		}
	}
	if {$remove_kickeggdrop_timer != ""} {
		killutimer $remove_kickeggdrop_timer
	}
	set lol_eggdrop_kick $chan
	set remove_kickeggdrop_timer [utimer 60 {
		set lol_eggdrop_kick ""
		set remove_kickeggdrop_timer ""
	}]
	kick_chan_check $chan eggdrop
	return 0
}

proc kick_chan_check {chan client} {
	global lol_mirc_kick lol_bitchx_kick lol_ircii_kick lol_eggdrop_kick
	if {$client == "mirc"} {
		if {$lol_bitchx_kick == $chan} {
			set lol_bitchx_kick ""
		}
		if {$lol_ircii_kick == $chan} {
			set lol_ircii_kick ""
		}
		if {$lol_eggdrop_kick == $chan} {
			set lol_eggdrop_kick ""
		}
	}
	if {$client == "bitchx"} {
		if {$lol_mirc_kick == $chan} {
			set lol_mirc_kick ""
		}
		if {$lol_ircii_kick == $chan} {
			set lol_ircii_kick ""
		}
		if {$lol_eggdrop_kick == $chan} {
			set lol_eggdrop_kick ""
		}
	}
	if {$client == "ircii"} {
		if {$lol_bitchx_kick == $chan} {
			set lol_bitchx_kick ""
		}
		if {$lol_mirc_kick == $chan} {
			set lol_mirc_kick ""
		}
		if {$lol_eggdrop_kick == $chan} {
			set lol_eggdrop_kick ""
		}
	}
	if {$client == "eggdrop"} {
		if {$lol_bitchx_kick == $chan} {
			set lol_bitchx_kick ""
		}
		if {$lol_ircii_kick == $chan} {
			set lol_ircii_kick ""
		}
		if {$lol_mirc_kick == $chan} {
			set lol_mirc_kick ""
		}
	}
	return 0
}

### CTCP VERSION CLIENT KICK

proc lol_ctcp_version {nick host hand dest key arg} {
	global lol lol_mirc_kick lol_bitchx_kick lol_ircii_kick lol_eggdrop_kick
	if {[string first "mirc" [strlwr $arg]] != -1} {set version "mirc"}
	if {[string first "ircii" [strlwr $arg]] != -1} {set version "ircii"}
	if {[string first "bitchx" [strlwr $arg]] != -1} {set version "bitchx"}
	if {[string first "eggsrop" [strlwr $arg]] != -1} {set version "eggdrop"}
	set flags "-$lol(no_kick_flags)&-$lol(no_kick_flags)"
	set chan [lindex $lol_mirc_kick 0]
	if {$version == "mirc" && [validchan $chan]} {
		if {[botisop $chan] && ![isop $nick $chan] && ![isvoice $nick $chan]} {
			if {$hand != "*" && $lol(no_kick_flags) != ""} {
				if {[matchattr $hand $flags $chan]} {
					return 0
				}
			}
			putserv "KICK $chan $nick :Mirc kick !"
		}
		return 0
	}
	set chan [lindex $lol_bitchx_kick 0]
	if {$version == "bitchx" && [validchan $chan]} {
		if {[botisop $chan] && ![isop $nick $chan] && ![isvoice $nick $chan]} {
			if {$hand != "*" && $lol(no_kick_flags) != ""} {
				if {[matchattr $hand $flags $chan]} {
					return 0
				}
			}
			putserv "KICK $chan $nick :BitchX kick !"
		}
		return 0
	}
	set chan [lindex $lol_ircii_kick 0]
	if {$version == "ircii" && [validchan $chan]} {
		if {[botisop $chan] && ![isop $nick $chan] && ![isvoice $nick $chan]} {
			if {$hand != "*" && $lol(no_kick_flags) != ""} {
				if {[matchattr $hand $flags $chan]} {
					return 0
				}
			}
			putserv "KICK $chan $nick :IrcII kick !"
		}
		return 0
	}
	set chan [lindex $lol_eggdrop_kick 0]
	if {$version == "eggdrop" && [validchan $chan]} {
		if {[botisop $chan] && ![isop $nick $chan] && ![isvoice $nick $chan]} {
			if {$hand != "*" && $lol(no_kick_flags) != ""} {
				if {[matchattr $hand $flags $chan]} {
					return 0
				}
			}
			putserv "KICK $chan $nick :Eggdrop kick !"
		}
		return 0
	}
	return 0
}

### !FINDIP <mask>

proc pub_lol_findip {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] != 1} {
		puthelp "NOTICE $nick :\002Usage:\002 [string trim $lol(cmdchar)]findip <mask>"
		return 0
	}
	set mask [lindex $arg 0]
	set msg "These users have been found: "
	set find 0
	foreach chans [channels] {
		foreach chanuser [strlwr [chanlist $chans]] {
			if {$chanuser == [strlwr $nick] || $chanuser == [strlwr $botnick]} {continue}
			set ipmask [strlwr [lindex [split [maskhost $chanuser![getchanhost $chanuser $chan]] "@"] 1]]
			set ip [lindex [split [getchanhost $chanuser $chans] @] 1]
			if {[string match [strlwr $mask] [strlwr $ip]]} {
				append msg "* \002\037$chanuser\037:$ip\002 on $chans "
				incr find
			}
			if {[string length $msg] > 200} {
				puthelp "NOTICE $nick :$msg"
				set msg ""
			}	
		}
	}
	if {$find != 0} {
		if {$msg != ""} {puthelp "NOTICE $nick :$msg"}
	} {
		puthelp "NOTICE $nick :No IP that match $mask were found on my chans."
	}
	return 0
}

### !TOPIC <topic>

proc pub_lol_topic {nick host hand chan arg} {
	if {![botisop $chan]} {return 0}
#	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] < 1} {
		puthelp "NOTICE $nick :\002Usage\002: [string trim $lol(cmdchar)]topic <topic>"
		return 0
	}
	puthelp "TOPIC $chan :$arg"
	return 0
}

### !WHOIS <nick>

proc pub_lol_whois {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {[llength $arg] != 1} {
		puthelp "NOTICE $nick :\002Usage:\002 [string trim $lol(cmdchar)]whois <nick>"
		return 0
	}
	set who [lindex $arg 0]
	set handle [nick2hand $who $chan]
	set host2 [getchanhost $who $chan]
	puthelp "NOTICE $nick :[lol_whois $who $host2 $handle $chan]"
	return 0
}

### BOT JOKES ;)

proc pub_lol_cigarette {nick host hand chan arg} {
	set arg [charfilter $arg]
	set arg [lindex $arg 0]
	global lol botnick
	if {$lol(jokes) == 0} {return 0}
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {$arg != ""} {
		puthelp "PRIVMSG $chan :$nick offers this \002(\037)¯¯¯¯)¯¯¯¯¯¯¯¯¯¯¯\037)~~~\002 at $arg !!!"
		return 0
	}
	puthelp "PRIVMSG $chan :I offer this \002(\037)¯¯¯¯)¯¯¯¯¯¯¯¯¯¯¯\037)~~~\002 at $nick !!!"
	return 0
}

proc pub_lol_rose {nick host hand chan arg} {
	set arg [charfilter $arg]
	set arg [lindex $arg 0]
	global lol botnick
	if {$lol(jokes) == 0} {return 0}
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {$arg != ""} {
		if {$lol(color) == 1} {
			puthelp "PRIVMSG $chan :$nick offers this superb rose \0034@\003\0033\} >-`--,--`---\003 at $arg !!!"
		} {
			puthelp "PRIVMSG $chan :$nick offers this superb rose @\} >-`--,--`--- at $arg !!!"
		}
		return 0
	}
	if {$lol(color) == 1} {
		puthelp "PRIVMSG $chan :I offer this superb rose \0034@\003\0033\} >-`--,--`---\003 at $nick !!!"
	} {
		puthelp "PRIVMSG $chan :I offer this superb rose @\} >-`--,--`--- at $nick !!!"
	}
	return 0
}

proc pub_lol_pastis {nick host hand chan arg} {
	set arg [charfilter $arg]
	set arg [lindex $arg 0]
	global lol botnick
	if {$lol(jokes) == 0} {return 0}
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {$arg != ""} {
		puthelp "PRIVMSG $chan :$nick offers a glass full of pastaga at $arg, enjoy !!!"
		return 0
	}
	puthelp "PRIVMSG $chan :I offer a glass full of pastaga at $nick, enjoy !!!"
	return 0
}

proc pub_lol_coke {nick host hand chan arg} {
	set arg [charfilter $arg]
	set arg [lindex $arg 0]
	global lol botnick
	if {$lol(jokes) == 0} {return 0}
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {$arg != ""} {
		puthelp "PRIVMSG $chan :$nick offers a fresh bottle of Coca-Cola at $arg, enjoy !!!"
		return 0
	}
	puthelp "PRIVMSG $chan :I offer a fresh bottle of Coca-Cola at $nick, enjoy !!!"
	return 0
}

proc pub_lol_beer {nick host hand chan arg} {
	set arg [charfilter $arg]
	set arg [lindex $arg 0]
	global lol botnick
	if {$lol(jokes) == 0} {return 0}
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	if {$arg != ""} {
		puthelp "PRIVMSG $chan :$nick offers a fresh bottle of Beer at $arg, enjoy !!!"
		return 0
	}
	puthelp "PRIVMSG $chan :I offer a fresh bottle of Beer at $nick, enjoy !!!"
	return 0
}

proc pub_lol_penalty {nick host hand chan arg} {
	set arg [charfilter $arg]
	set joueur [lindex $arg 0]
	set balle [lindex $arg 1]
	if {$balle == ""} {
		set text "S'ELANCE SUR LA BALLE ET IL SHOOOT !!!!!!!"
	} {
		set text "S'ELANCE SUR [string toupper $balle] ET LE FRAPPE DE TOUTE SES FORCES !!!!!"
	}
	global lol botnick
	if {$lol(jokes) == 0} {return 0}
	if {![check $hand $nick $host]} {
		if {$lol(silent) == 1 || [checksilent $hand]} {return 0}
		puthelp "NOTICE $nick :You need to be identified to use this function. Type .identhelp in partyline for more infos. : \002/msg $botnick id <password>\002 or \002/msg $botnick silent <password>\002 to no more receive this warning."
		return 0
	}
	set results {
		{!!! GGGOOOOOOOOOAAAAAAAAAAAAAAAAAAALLLLLLLLLLLLL !!!!!!!!! dans la lucarne gauche :))))}
		{EVIVAAAAAAAAAAAAAAAA dans la lucarne droite :))))}
		{!!! GGGOOOOOOOOOAAAAAAAAAAAAAAAAAAALLLLLLLLLLLLL !!!!!!!!! en plein centre :))))}
		{!!! GGGOOOOOOOOOAAAAAAAAAAAAAAAAAAALLLLLLLLLLLLL !!!!!!!!! en force a gauche, le gardien a frolé le ballon :))))}
		{IL L'A FAIT !!!!!!!!!! YEAHHHHHHH en force a droite, le gardien a frolé le ballon :))))}
		{EVIVAAAAAAAAAAAAAAAA !!!!!!!!! en finnesse a gauche, le gardien pris a contre-pied :))))}
		{Sans problèmes en finnesse a droite, le gardien pris a contre-pied :))))}
		{!!! GOAL GOAL GOOOOOOOOOOOOOOAAAAAAAAAAL \/\/ Tout en puissance sous la transversale.}
		{AHHHHHHRGGGGG :(( Par dessus la transversale !!!!}
		{OOOOOOOHHUUUUUU :(((( Plein poteau :(}
		{NOOOOOOOOON :((((( pleine transversale :(((((((}
		{PUUTTTTTAAAIIINNNN !!! Il a tiré a coté :-/}
		{Salopard de gardien !!! :((( Il a plongé du bon coté :((}
		{En plein centre mais le gardien n'avait hélas pas anticipé :(}
		{ARRGGGHHHH Tir central, mais le gardien devie la balle du pied :/}
	}
	if {$arg != ""} {
		puthelp "PRIVMSG $chan :$joueur doit a tout prix marquer le penalty pour sauver son équipe..."
		puthelp "PRIVMSG $chan :[string toupper $joueur] $text"
		puthelp "PRIVMSG $chan :[lindex $results [rand [llength $results]]]"
		return 0
	}
	puthelp "PRIVMSG $chan :$nick doit a tout prix marquer le penalty pour sauver son équipe..."
	puthelp "PRIVMSG $chan :[string toupper $nick] S'ELANCE SUR LA BALLE ET IL SHOOOT !!!!!!!"
	puthelp "PRIVMSG $chan :[lindex $results [rand [llength $results]]]"
	return 0
}

### !TIME

proc pub_lol_time {a b c d e} {
	global lol
	if {![validuser $c] && $lol(time) == 0} {return 0}
	puthelp "NOTICE $a :We are the [date], and it's [time] !"
	return 0
}

### !HELP

proc pub_lol_help {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol
	if {![validuser $hand] && $lol(help) == 0} {return 0}
	puthelp "NOTICE $nick :\037*** $lol(version) CHAN HELP ***"
	set help ""
	if {[matchattr $hand n]} {
		append help "\002[string trim $lol(cmdchar)]param\002 <parameter> <value>  \002[string trim $lol(cmdchar)]enable\002 <nick>  \002[string trim $lol(cmdchar)]disable\002 <nick>  \002[string trim $lol(cmdchar)]deluser\002 <nick>"
		append help "  "
		append help "\002[string trim $lol(cmdchar)]join\002 <chan> \[chanpass\]  \002[string trim $lol(cmdchar)]remove\002 \[chan\]"
		append help "  "
		append help "\002[string trim $lol(cmdchar)]addhost\002 <nick|hand> \[host\]  \002[string trim $lol(cmdchar)]delhost\002 <nick|hand> <host>"
		append help "  "
	}
	if {[matchattr $hand n|n $chan]} {
		append help "\002[string trim $lol(cmdchar)]addmaster\002 <nick> \[hand\] \[f\]  \002[string trim $lol(cmdchar)]delmaster\002 <nick>"
		append help "  "
	}
	if {[matchattr $hand m]} {
		append help "\002[string trim $lol(cmdchar)]jump\002 <server> \[port\]"
		append help "  "
		append help "\002[string trim $lol(cmdchar)]botnick\002 <nick>"
		append help "  "
	}
	if {[matchattr $hand m|m $chan]} {
		append help "  "
		append help "\002[string trim $lol(cmdchar)]adduser\002 <nick> \[hand\]  \002[string trim $lol(cmdchar)]addbot\002 <nick> \[port\] \[hand\]"
		append help "  "
		append help "\002[string trim $lol(cmdchar)]addop\002 <nick> \[hand\] \[f\]  \002[string trim $lol(cmdchar)]delop\002 <nick>  \002[string trim $lol(cmdchar)]banmask\002 <mask> \[time\] \[reason\]  \002[string trim $lol(cmdchar)]findip\002 <mask>"
	}
	puthelp "NOTICE  $nick :$help"
	set help ""
	if {[matchattr $hand o|o $chan]} {
		append help "\002[string trim $lol(cmdchar)]banlist\002  \002[string trim $lol(cmdchar)]ban\002 <nick|mask> \[time\] \[reason\]  \002[string trim $lol(cmdchar)]unban\002 <mask|number>  \002[string trim $lol(cmdchar)]chattr\002 <nick> <flags>"
		append help "  "
		append help "\002[string trim $lol(cmdchar)]mode\002 <chanmode>  \002[string trim $lol(cmdchar)]op\002 \[nick\]  \002[string trim $lol(cmdchar)]deop\002 \[nick\]  \002[string trim $lol(cmdchar)]broadcast\002 <text>"
		append help "  "
		append help "\002[string trim $lol(cmdchar)]addvoice\002 <nick> \[hand\] \[f\]  \002[string trim $lol(cmdchar)]delvoice\002 <nick>"
		append help "  "
		append help "\002[string trim $lol(cmdchar)]topic\002 <topic>  \002[string trim $lol(cmdchar)]whois\002 <nick>  \002[string trim $lol(cmdchar)]online\002"
		append help "  "
		append help "\002[string trim $lol(cmdchar)]quick\002 <nick|mask> \[reason\]  \002[string trim $lol(cmdchar)]mirc\002  \002[string trim $lol(cmdchar)]ircii\002  \002[string trim $lol(cmdchar)]bitchx\002  \002[string trim $lol(cmdchar)]eggdrop\002"
		append help " "
	}
	puthelp "NOTICE  $nick :$help"
	set help ""
	if {[matchattr $hand ov|ov $chan]} {
		append help "\002[string trim $lol(cmdchar)]kick\002 <nick|mask> \[reason\]  \002[string trim $lol(cmdchar)]stats\002  \002[string trim $lol(cmdchar)]voice\002 \[nick\]  \002[string trim $lol(cmdchar)]devoice\002 \[nick\]"
		append help "  "
		if {$lol(jokes) == 1} {
			append help "\002[string trim $lol(cmdchar)]cigarette\002 \[nick\]  \002[string trim $lol(cmdchar)]rose\002 \[nick\]"
			append help "  "
			append help "\002[string trim $lol(cmdchar)]pastaga ([string trim $lol(cmdchar)]pastis, [string trim $lol(cmdchar)]51)\002 \[nick\]  \002[string trim $lol(cmdchar)]beer\002 \[nick\]"
			append help "  "
			append help "\002[string trim $lol(cmdchar)]coca-cola ([string trim $lol(cmdchar)]coke)\002 \[nick\]  \002[string trim $lol(cmdchar)]penalty\002 \[player\] \[ball\]"
			append help "  "
		}
	}
	if {$lol(time) == 1} {append help "  \002[string trim $lol(cmdchar)]time\002"}
	if {$lol(seen) == 1} {append help "  \002[string trim $lol(cmdchar)]seen\002"}
	if {$lol(troubles) == 1} {append help "  \002[string trim $lol(cmdchar)]troubles\002"}
	append help "  \002[string trim $lol(cmdchar)]help\002"
	puthelp "NOTICE  $nick :$help"
	if {[validuser $hand]} {
		puthelp "NOTICE  $nick :For a complete description, use dcc chat: \002.chanhelp\002"
	}
}

### !TROUBLES

proc pub_lol_troubles {nick host hand chan arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {![validuser $hand] && $lol(troubles) == 0} {return 0}
	puthelp "NOTICE $nick :\037*** $lol(version) TROUBLES ***"
	append help "\037*** 1_You are a registered user but the bot don't recognize you: ***\037"
	append help "  "
	append help "You have probably changed your user@hostmask...Try:"
	append help "  "
	append help "\002/msg $botnick id <password> <nick>\002"
	append help "  "
	append help "Use the <nick> that you had, when you register in the bot. Please, don't change no more your addresse !"
	puthelp "NOTICE $nick :$help"
	set help ""
	append help "\037*** 2_The bot don't auto-op you: ***\037"
	append help "  "
	append help "The bot probably hasn't auto-op enabled, to get op type:"
	append help "  "
	append help "\002/MSG $botnick OP \[#chan\]\002"
	puthelp "NOTICE $nick :$help"
	set help ""
	append help "\037*** 3_The bot recognize you, but don't answer at the DCC CHAT: ***\037"
	append help "  "
	append help "You haven't DCC CHAT rights / You are using Mirc and it don't always use standard DCC CHAT, try:"
	append help "  "
	append help "\002/CTCP $botnick CHAT\002"
	append help "  "
	append help "If that don't work change your DCC CHAT config or change your script."
	puthelp "NOTICE $nick :$help"
	set help ""
	if {![check $hand $nick $host]} {
		append help "\037*** 4_Chan commands don't work: ***\037"
		append help "  "
		append help "You are not identified, type:"
		append help "  "
		append help "\002/msg $botnick id <password>\002"
		puthelp "NOTICE $nick :$help"
	}
	return 0
}

################# END OF CHAN COMMANDS #################

################# START OF DCC COMMANDS #################

### .whois

proc dcc_lol_whois {hand idx arg} {
	global lol
	*dcc:whois $hand $idx $arg
	set arg [charfilter $arg]
	set whohand [lindex $arg 0]
	if {[strlwr $hand] == [strlwr $whohand] || ([validuser $whohand] && [matchattr $hand m|m])} {
		putdcc $idx "\037$lol(version) Specific informations.\037\r"
		putdcc $idx "\r"
		putdcc $idx "Ident Statut: [getuser $whohand xtra auth]   Last Ident Nick: [getuser $whohand xtra authnick]\r"
		putdcc $idx "Silent: [getuser $whohand xtra silent]         Permident Mask: [getuser $whohand xtra permident]\r"
	}
	return 0
}

### .unident

proc dcc_lol_unident {hand idx arg} {
	if {[getuser $hand xtra auth] != 1} {
		putdcc $idx "You are already not identified.\r"
		return 0
	}
	if {[getuser $hand xtra auth] != "DEAD"} {
		setuser $hand xtra auth 0
	}
	chattr $hand -3
	putdcc $idx "You are no more identified.\r"
}

### .permident <nick!user@host>

proc dcc_lol_permident {hand idx arg} {
	set arg [charfilter $arg]
	if {[llength $arg] != 1} {
		putdcc $idx "\002Usage:\002 .permident <nick!user@host>\r"
		return 0
	}
	set host [lindex $arg 0]
	setuser $hand xtra permident $host
	putdcc $idx "You are now permidentified with this mask: $host. Use \002unpermident\002 to remove it.\r"
}

### .unpermident

proc dcc_lol_unpermident {hand idx arg} {
	setuser $hand xtra permident ""
	if {[getuser $hand xtra auth] != "DEAD"} {
		setuser $hand xtra auth 0
	}
	chattr $hand -3
	putdcc $idx "You have no more a permident mask.\r"
}

### .silent

proc dcc_lol_silent {hand idx arg} {
	set arg [charfilter $arg]
	setuser $hand xtra silent 1
	putdcc $idx "You are now in silent mode.\r"
	putdcc $idx "You won't be notified if you try a command without to be identified.\r"
	putdcc $idx "Use \002.unsilent\002 or message \002unsilent <password>\002 to remove the silent mode.\r"
}

### .unsilent

proc dcc_lol_unsilent {hand idx arg} {
	set arg [charfilter $arg]
	setuser $hand xtra silent 0
	putdcc $idx "You are no more in silent mode.\r"
	putdcc $idx "You will be notified if you try a command without to be identified.\r"
	putdcc $idx "Use \002.silent\002 or message \002silent <password>\002 to return in the silent mode.\r"
}

### .botnick <nick>

proc dcc_lol_botnick {hand idx arg} {
	set arg [charfilter $arg]
	global botnick nick
	if {[llength $arg] != 1} {
		putdcc $idx "\002Usage:\002 .botnick <nick>\r"
		return 0
	}
	set nick [lindex $arg 0]
}

### .param <parameter> <value>

proc dcc_lol_param {hand idx arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {[llength $arg] != 2} {
		putdcc $idx "\037\002Usage:\002 .param <parameter> <value>\037"
		putdcc $idx "\002cmdchar:\002 $lol(cmdchar)"
		putdcc $idx "\002security:\002 $lol(security)"
		putdcc $idx "\002nopass:\002 $lol(nopass)"
		putdcc $idx "\002chankey:\002 $lol(chankey)"
		putdcc $idx "\002silent:\002 $lol(silent)"
		putdcc $idx "\002ident:\002 $lol(ident)"
		putdcc $idx "\002id_confirm:\002 $lol(id_confirm)"
		putdcc $idx "\002clone:\002 $lol(clone)"
		putdcc $idx "\002jokes:\002 $lol(jokes)"
		putdcc $idx "\002color:\002 $lol(color)"
		putdcc $idx "\002help:\002 $lol(help)"
		putdcc $idx "\002troubles:\002 $lol(troubles)"
		putdcc $idx "\002seen:\002 $lol(seen)"
		putdcc $idx "\002time:\002 $lol(time)"
		putdcc $idx "\002chan_flood:\002 $lol(chan_flood)"
		putdcc $idx "\002join_flood:\002 $lol(join_flood)"
		putdcc $idx "\002deop_flood:\002 $lol(deop_flood)"
		putdcc $idx "\002ctcp_flood:\002 $lol(ctcp_flood)"
		putdcc $idx "\002kick_flood:\002 $lol(kick_flood)"
		putdcc $idx "\002ban_protect:\002 $lol(ban_protect)"
		putdcc $idx "\002chan_parameters:\002 $lol(chan_parameters)"
		putdcc $idx "\002chanmode:\002 $lol(chanmode)"
		putdcc $idx "\002server_flags:\002 $lol(server_flags)"
		putdcc $idx "\002away:\002 $lol(away)"
		putdcc $idx "\002welcome:\002 $lol(welcome)"
		putdcc $idx "\002welmsg:\002 $lol(welmsg)"
		putdcc $idx "\002idle_protect:\002 $lol(idle_protect)"
		putdcc $idx "\002warn_idle_time:\002 $lol(warn_idle_time)"
		putdcc $idx "\002max_idle_time:\002 $lol(max_idle_time)"
		putdcc $idx "\002kick_idle_time:\002 $lol(kick_idle_time)"
		putdcc $idx "\002idle_ban_time:\002 $lol(idle_ban_time)"
		putdcc $idx "\002no_kick_flags:\002 $lol(no_kick_flags)"
		putdcc $idx "\002no_ban_flags:\002 $lol(no_ban_flags)"
		putdcc $idx "\002no_idle_flags:\002 $lol(no_idle_flags)"
		return 0
	}
	set lol([strlwr [lindex $arg 0]]) [lrange $arg 1 end]
	putdcc $idx "The new value of [strlwr [lindex $arg 0]] is [lrange $arg 1 end]."
	return 0
}

### .partyban <user> [reason]

proc dcc_lol_partyban {hand idx arg} {
	set arg [charfilter $arg]
	global botnick
	if {[llength $arg] < 1} {
		putdcc $idx "\002Usage:\002 .partyban <user> \[reason\]\r"
		return 0
	}
	set user [lindex $arg 0]
	set reason [lrange $arg 1 end]
	if {[matchattr $user o] && ![matchattr $hand o]} {
		putdcc $idx "You can't partyban an op, without to be an op.\r"
		return 0
	}
	if {[matchattr $user m] && ![matchattr $hand m]} {
		putdcc $idx "You can't partyban a master, without to be a master.\r"
		return 0
	}
	if {[matchattr $user n] && ![matchattr $hand n]} {
		putdcc $idx "You can't partyban an owner, without be an owner.\r"
		return 0
	}
	boot $user $reason
	chattr $user -p
	putdcc $idx "$user has been partybaned.\r"
}

### .chanlist

proc dcc_lol_chanlist {hand idx arg} {
	set arg [charfilter $arg]
	if {[channels] == ""} {
		putdcc $idx "\037I'm not on chans:\r"
		return 0
	}
	putdcc $idx "\037I'm on theses chans:\r"
	foreach chan [channels] {
		putdcc $idx "$chan\r"
	}
}

### .seen <nick|hand>

proc dcc_lol_seen {hand idx arg} {
	set arg [charfilter $arg]
	if {[llength $arg] != 1} {
		putdcc $idx "\002Usage\002: seen <nick|hand>\r"
		return 0
	}
	set who [lindex $arg 0]
	putdcc $idx "[lol_seen $hand $hand $who ""]\r"
}

### .enable <hand>

proc dcc_lol_enable {hand idx arg} {
	set arg [charfilter $arg]
	if {[llength $arg] != 1} {
		putdcc $idx "\002Usage:\002 .enable <hand>\r"
		return 0
	}
	set who [lindex $arg 0]
	if {![validuser $who]} {
		putdcc $idx "I don't find $who in my user database.\r"
		return 0
	}
	if {[getuser $who xtra auth] != "DEAD"} {
		putdcc $idx "$who is already enabled.\r"
		return 0
	}
	setuser $who xtra auth 0
	putdcc $idx "$who is now enabled.\r"
	return 0
}

### .disable <hand>

proc dcc_lol_disable {hand idx arg} {
	set arg [charfilter $arg]
	if {[llength $arg] != 1} {
		putdcc $idx "\002Usage:\002 .disable <hand>\r"
		return 0
	}
	set who [lindex $arg 0]
	if {![validuser $who]} {
		putdcc $idx "I don't find $who in my user database.\r"
		return 0
	}
	if {[getuser $who xtra auth] == "DEAD"} {
		putdcc $idx "$who is already disabled.\r"
		return 0
	}
	setuser $who xtra auth DEAD
	chattr $who -3
	putdcc $idx "$who is now disabled.\r"
	return 0
}

### .online

proc dcc_lol_online {hand idx arg} {
	set arg [charfilter $arg]
	global server {server-online} uptime
	set ip [lindex [split $server ":"] 0]
	set port [lindex [split [lindex [split $server ":"] 1] "-"] 0]
	set timeon [time_diff ${server-online}]
	set numbots 0
	foreach bot [bots] {
		incr numbots
	}
	set numchans 0
	foreach ch [channels] {
		incr numchans
	}
	putdcc $idx "\037*** ONLINE INFOS !!! ***\r"
	putdcc $idx "I have not crashed since [time_diff $uptime] ;)\r"
	if {$ip != ""} {
		putdcc $idx "I'm on $ip since $timeon.\r"
	} {
		putdcc $idx "I'm not on a server.\r"
	}
	if {![matchattr $hand o]} {
		putdcc $idx "I'm on $numchans chan(s).\r"
	} {
		if {$numchans != 0} {
			putdcc $idx "I'm on theses chans: [channels]\r"
		} {
			putdcc $idx "I'm not on chans.\r"
		}
	}
	if {![matchattr $hand o]} {
		putdcc $idx "I'm linked with $numbots bot(s).\r"
	} {
		if {$numbots != 0} {
			putdcc $idx "I'm linked with theses bots: [bots]\r"
		} {
			putdcc $idx "I'm not linked with bots.\r"
		}
	}
}

### .join <chan> [chan pass]

proc dcc_lol_join {han idx arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {[llength $arg] < 1} {
		putdcc $idx "\002Usage:\002 .join <chan> \[chan pass\]\r"
		return 0
	}
	set chan [lindex $arg 0]
	set pass [lindex $arg 1]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	if {[validchan $chan]} {
		putdcc $idx "I'm already monitoring $chan. \r"
		if {$pass != ""} {
			if {$lol(chankey) == 1} {
				putdcc $idx "New pass set for $chan: $pass. \r"
				channel set $chan need-key "chankey $chan $pass"
			} {
				putdcc $idx "I can't memorize password to keep compatibility with getops.tcl\r"
			}
		}
		if {![onchan [strlwr $botnick] $chan]} {
			putdcc $idx "I'll now try to join $chan.\r"
			putserv "JOIN $chan $pass"
			return 0
		}
		putdcc $idx "I'm already in $chan. \r"
		return 0
	}
	putdcc $idx "New chan monitoring: $chan.\r"
	channel add $chan
	channel set $chan chanmode $lol(chanmode)
	channel set $chan flood-chan $lol(chan_flood)
	channel set $chan flood-deop $lol(deop_flood)
	channel set $chan flood-kick $lol(kick_flood)
	channel set $chan flood-join $lol(join_flood)
	channel set $chan flood-ctcp $lol(ctcp_flood)
	foreach param $lol(chan_parameters) {
		channel set $chan $param
	}
	if {$pass != ""} {
		if {$lol(chankey) == 1} {
			putdcc $idx "New pass set for $chan: $pass. \r"
			channel set $chan need-key "chankey $chan $pass"
		} {
			putdcc $idx "I can't memorize the chan password to keep compatibility with getops.tcl\r"
		}
	}
	putdcc $idx "$chan is now configured.\r"
	putdcc $idx "I'll now try to join $chan.\r"
	putdcc $idx "Use \002.-chan\002 to remove a chan (chan userlist will be deleted).\r"
	putserv "JOIN $chan $pass"
}

### .part <chan>

proc dcc_lol_part {han idx arg} {
	set arg [charfilter $arg]
	if {[llength $arg] != 1} {
		putdcc $idx "\002Usage:\002 .part <chan>\r"
		return 0
	}
	set chan [lindex $arg 0]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	if {![validchan $chan]} {
		putdcc $idx "I'm not monitoring $chan. \r"
		return 0
	}
	if {![matchattr $han m|m $chan]} {
		putdcc $idx "Sorry, but you are not master in $chan."
		return 0
	}
	putdcc $idx "I'll part $chan. \r"
	putdcc $idx "To delete monitoring of this chan, use: \002.-chan $chan\002. \r"
	putserv "PART $chan"
}

### .userlist [flags]

proc dcc_lol_userlist {a b c} {
	set arg [charfilter $c]
	set param [lindex $c 0]
	set list [userlist $param]
	putdcc $b "\037List of my users:\r"
	putdcc $b "$list\r"
}

### .security

proc dcc_lol_security {hand idx arg} {
	set arg [charfilter $arg]
	global lol
	putdcc $idx "                 \002********************************************\r"
	putdcc $idx "                 \002*** SECURITY RISK WITH DYNAMIC IP by LoL ***\r"
	putdcc $idx "                 \002********************************************\r"
	putdcc $idx "\r"
	putdcc $idx "Auto-op is dangerous because the majority of people hasn't a fix IP, but a\r"
	putdcc $idx "dynamic IP that change every connections. When the bot takes the mask value\r"
	putdcc $idx "for recognize you it use some wildcards (*). For example Bill is identified\r"
	putdcc $idx "on the net like that:\r"
	putdcc $idx "\r"
	putdcc $idx "                 |  nick  | |  user  | |  ip addresse  |\r"
	putdcc $idx "  Complete mask:    bill   !  bgates  @  195.135.14.28\r"
	putdcc $idx "\r"
	putdcc $idx "But the bot imagine that bill has not a fix IP addresse and it want recognize\r"
	putdcc $idx "bill even if he has a different one. So it decides to recognize bill with that:\r"
	putdcc $idx "\r"
	putdcc $idx "                 |  nick  | |  user  | |  ip addresse  |\r"
	putdcc $idx "  Partial mask:      *     !  bgates  @  195.135.14.*\r"
	putdcc $idx "\r"
	putdcc $idx "What about that ? The user part is not secure at all, all the user can take a\r"
	putdcc $idx "same user value. And the IP ? 195.135.14.* ? What about that ? You can now\r"
	putdcc $idx "understand that all the users with an IP beginning with 195.135.14 can make\r"
	putdcc $idx "believe at the bot that they are bill....\r"
	putdcc $idx " "
	putdcc $idx "In this case, all the commands that bill used without password can be used by\r"
	putdcc $idx "the hackers too. If bill used !op !ban !kick command in a chan, the hacker can\r"
	putdcc $idx "use them without problems.\r"
	putdcc $idx "\r"
	putdcc $idx "But now you know where the security hole is, you can change that....You know\r"
	putdcc $idx "that bill has a fix IP, you decide to said at the bot to use the complete IP of\r"
	putdcc $idx "bill to recognize him.\r"
	putdcc $idx "\r"
	putdcc $idx ".-host bill *!bgates@195.135.14.*\r"
	putdcc $idx ".+host bill *!*@195.135.14.28\r"
	putdcc $idx "\r"
	putdcc $idx "Now it's ok for bill, no hackers can take his place, but what's about users\r"
	putdcc $idx "without a fix ip ? For them you are obligated to use * in IP, so you are never\r"
	putdcc $idx "sure that an hacker can't take their places... Is for that there is in LoL's Toolz\r"
	putdcc $idx "a complete password protected ident system before any dangerous commands.\r"
	putdcc $idx "\r"
	putdcc $idx "Now back to auto-op :) It's exactly the same problem...So if an user has a fix\r"
	putdcc $idx "IP address, you must check that the bot has take the complete addresse, and then\r"
	putdcc $idx "you can put the auto-op flag, if this user hasn't a fix IP address you don't\r"
	putdcc $idx "must put the +a flag (+a flag = !OP function).\r"
	putdcc $idx "\r"
	putdcc $idx "                                                $lol(version)\r"
}

### .identhelp

proc dcc_lol_identhelp {hand idx arg} {
	set arg [charfilter $arg]
	global botnick
	putdcc $idx "                    \002**************************************\r"
	putdcc $idx "                    \002*** IDENTIFICATION TUTORIAL BY LOL ***\r"
	putdcc $idx "                    \002**************************************\r"
	putdcc $idx "\r"
	putdcc $idx "With the version 4 of my toolz, identification system has been added. Before to\r"
	putdcc $idx "use chan's commands, you must type:\r"
	putdcc $idx "\r"
	putdcc $idx "/msg $botnick ident <password>\r"
	putdcc $idx "\r"
	putdcc $idx "or\r"
	putdcc $idx "\r"
	putdcc $idx "/msg $botnick id <password>\r"
	putdcc $idx "\r"
	putdcc $idx "If you have a recognized user@hostname the bot will identify you, and now you\r"
	putdcc $idx "can use chan's commands.\r"
	putdcc $idx "\r"
	putdcc $idx "If you are a owner you can disable or enable chan's commands for an user:\r"
	putdcc $idx "\r"
	putdcc $idx "partyline:\r"
	putdcc $idx "   .enable <hand>\r"
	putdcc $idx "   .disable <hand>\r"
	putdcc $idx "msg:\r"
	putdcc $idx "   enable <password> <nick|hand> \[chan\]\r"
	putdcc $idx "   disable <password> <nick|hand> \[chan\]\r"
	putdcc $idx "chan:\r"
	putdcc $idx "   !enable <nick>\r"
	putdcc $idx "   !disable <nick>\r"
	putdcc $idx "\r"
	putdcc $idx "The identification is kept all the time, the bot can see the user in a chan.\r"
	putdcc $idx "When the user part all the chans, the bot is on, the identification is removed.\r"
	putdcc $idx "I have make identification 100% compatible with chantoolz and normally\r"
	putdcc $idx "compatible with eggtoolz (concurrent tcl scripts).\r"
	putdcc $idx "\r"
	putdcc $idx "If \"CLONE=1\" all the others that hare recognized as you by the bot AND have the same\r"
	putdcc $idx "IP addresse as the nick that have make the identification are allowed to use chan commands.\r"
	putdcc $idx "\r"
	putdcc $idx "Example: your mask is *!darkvador@193.143.*.* and your IP: 193.143.12.23\r"
	putdcc $idx "=> all the people with *!darkvador@193.143.12.23 are recognized like clones of you.\r"
	putdcc $idx "\r"
	putdcc $idx "If \"CLONE=0\" only the last nick identified is autorised to use the commands. Use that for a\r"
	putdcc $idx "maximum security (against IP spoofing for example). In the above line i speak about the\r"
	putdcc $idx "\"nick\" that have made the identification, i want said the irc user that have made the\r"
	putdcc $idx "identification, because LoL's TooLz autodetect if you change your nick.\r"
	putdcc $idx "\r"
	putdcc $idx "The variable SILENT warn an user if he wants to use chan commands without to be\r"
	putdcc $idx "identified. Set SILENT = 1 (no warning) can be good for example is there is more\r"
	putdcc $idx "than one bot in the chan with my script, and too to limit help queue of bot. But\r"
	putdcc $idx "at the beginning is good to put SILENT = 0 because without that the users will\r"
	putdcc $idx "not understand why the chan's commands don't work.\r"
	putdcc $idx "\r"
	putdcc $idx "(You can now remove manually the identification using !unident, .unident...)\r"
	putdcc $idx "\r"
	putdcc $idx "Still one important thing !!!\r"
	putdcc $idx "\r"
	putdcc $idx "ident <password>\r"
	putdcc $idx "\r"
	putdcc $idx "and\r"
	putdcc $idx "\r"
	putdcc $idx "ident <password> <hand>\r"
	putdcc $idx "\r"
	putdcc $idx "ARE NOT THE  SAME COMMANDS !!!\r"
	putdcc $idx "\r"
	putdcc $idx "The first is a LoL TooLz commands to enable chan commands.\r"
	putdcc $idx "The second is an eggdrop commands to add an host when you have changed provider\r"
	putdcc $idx "or anything...\r"
	putdcc $idx "\r"
	putdcc $idx "Example:\r"
	putdcc $idx "You have changed provider and you come back in IRC:\r"
	putdcc $idx "ident <password> <hand(original nick)>     (to add  you new address)\r"
	putdcc $idx "ident <password>                           (to enable chan commands)\r"
	putdcc $idx "\r"
	putdcc $idx "With LoL's TooLz 5.1, a new feature has been added:\r"
	putdcc $idx "PERMIDENT (msg and party-line)\r"
	putdcc $idx "With that, you can set a mask where the bot don't ask no more for\r"
	putdcc $idx "identification if you match it.\r"
	putdcc $idx "\r"
	putdcc $idx "Example:\r"
	putdcc $idx "/msg $botnick permident <password>\r"
	putdcc $idx "The mask added is your current *!user@IP, the COMPLETE IP is used by\r"
	putdcc $idx "default. If you want to specify an other mask you can make like that:\r"
	putdcc $idx "/msg $botnick permident <password> <mask>\r"
	putdcc $idx "Be careful choosing it !\r"
	putdcc $idx "\r"
	putdcc $idx "Hope this has help you.\r"
}

### .addop <nick> <chan> [hand] [f]

proc dcc_lol_addop {handy idx arg} {
	set arg [charfilter $arg]
	global botnick
	if {[llength $arg] < 2} {
		putdcc $idx "\002Usage:\002 .addop <nick> <chan> \[hand\] \[f\]\r"
		return 0
	}
	set nick [lindex $arg 0]
	set chan [strlwr [lindex $arg 1]]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	set alternate [lindex $arg 2]
	set f [strlwr [lindex $arg 3]]
	if {![validchan $chan]} {
		putdcc $idx "I'm not on $chan\r"
		return 0
	}
	if {![matchattr $handy m|m $chan]} {
		putdcc $idx "Sorry, but you are not master in $chan.\r"
		return 0
	}
	set hostmask "$nick![getchanhost $nick $chan]"
	set hand [nick2hand $nick $chan]
	if {![onchan $nick $chan]} {
		putdcc $idx "Sorry, but i don't find $nick in $chan.\r"
		return 0
	}
	if {[strlwr $nick] == [strlwr $botnick]} {
		putdcc $idx "Sorry, but i can't addop myself.\r"
		return 0
	}
	if {[getting-users]} {
		putdcc $idx "Sorry, but i'm transferring userfile, try later.\r"
		return 0
	}
	if {$f == "f"} {
		if {![validuser $alternate]} {
			adduser $alternate [maskhost $hostmask]
			chattr $alternate +p|+o $chan
			putdcc $idx "New user: $alternate ([maskhost $hostmask])\r"
			putdcc $idx "$nick added in $chan oplist and party-line with the hand: $alternate.\r"
			puthelp "NOTICE $nick :You have been added in $chan oplist and party-line by $handy with the hand: $alternate."
			puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick PASS <your_password>\002"
			if {[botisop $chan]} {pushmode $chan +o $nick}
			return 0
		}
		setuser $alternate HOSTS [maskhost $hostmask]
		chattr $alternate -|+o $chan
		putdcc $idx "Added hostmask for $alternate: [maskhost $hostmask]\r"
		putdcc $idx "$nick added in $chan oplist with the hand: $alternate.\r"
		puthelp "NOTICE $nick :You have been added in $chan oplist by $handy with the hand: $alternate."
		if {[botisop $chan]} {pushmode $chan +o $nick}
		return 0
	}
	if {![validuser $hand]} {
		if {[validuser $nick] && $alternate == ""} {
			putdcc $idx "The hand $nick already exist. \002Usage:\002 .addop <nick> <chan> <hand> \[f\]\r"
			return 0
		}
		if {$alternate != ""} {
			if {[validuser $alternate]} {
				putdcc $idx "The hand $alternate already exist. Choose an other. \002Usage:\002 .addop <nick> <chan> <hand> \[f\]\r"
				return 0
			}
			adduser $alternate [maskhost $hostmask]
			chattr $alternate +p|+o $chan
			putdcc $idx "New user: $alternate ([maskhost $hostmask])\r"
			putdcc $idx "$nick added in $chan oplist and party-line with the hand: $alternate.\r"
			puthelp "NOTICE $nick :You have been added in $chan oplist and party-line by $handy with the hand: $alternate."
			puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick pass <your_password>\002"
			if {[botisop $chan]} {pushmode $chan +o $nick}
			return 0
		}
		adduser $nick [maskhost $hostmask]
		chattr $nick +p|+o $chan
		putdcc $idx "New user: $nick ([maskhost $hostmask])\r"
		putdcc $idx "$nick added in $chan oplist and party-line with the hand: $nick.\r"
		puthelp "NOTICE $nick :You have been added in $chan oplist and party-line by $handy with the hand: $nick."
		puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick pass <your_password>\002"
		if {[botisop $chan]} {pushmode $chan +o $nick}
		return 0
	}
	if {$alternate != ""} {
		if {[validuser $alternate]} {
			putdcc $idx "The hand $alternate already exist. \002Usage:\002 .addop <nick> <chan> <hand> \[f\]\r"
			return 0
		}
		adduser $alternate [maskhost $hostmask]
		chattr $alternate +p|+o $chan
		putdcc $idx "New user: $alternate ([maskhost $hostmask])\r"
		putdcc $idx "$nick added in $chan oplist and party-line with the hand: $alternate.\r"
		puthelp "NOTICE $nick :You have been added in $chan oplist and party-line by $handy with the hand: $alternate."
		puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick PASS <your_password>\002"
		if {[botisop $chan]} {pushmode $chan +o $nick}
		return 0
	}
	if {[matchattr $hand -|+o $chan]} {
		putdcc $idx "$nick is already op in $chan with this hand: $hand\r"
	} {
		chattr $hand -|+o $chan
		putdcc $idx "$nick added in $chan oplist with this hand: $hand.\r"
		puthelp "NOTICE $nick :You have been added in $chan oplist by $handy."
	}
	if {[botisop $chan]} {pushmode $chan +o $nick}
	return 0
}

### .delop <nick> <chan>

proc dcc_lol_delop {handy idx arg} {
	set arg [charfilter $arg]
	global botnick
	if {[llength $arg] != 2} {
		putdcc $idx "\002Usage:\002 .delop <nick> <chan>\r"
		return 0
	}
	set nick [lindex $arg 0]
	set chan [strlwr [lindex $arg 1]]
	if {$chan != ""} {set chan [chanaddapt $chan]}

	if {![validchan $chan]} {
		putdcc $idx "I'm not on $chan "
		return 0
	}
	if {![matchattr $handy m|m $chan]} {
		putdcc $idx "Sorry, but you are not master in $chan.\r"
		return 0
	}
	set hand [nick2hand $nick $chan]
	if {![onchan $nick $chan]} {
		putdcc $idx "Sorry, but i don't find $nick in $chan.\r"
		return 0
	}
	if {[strlwr $nick] == [strlwr $botnick]} {
		putdcc $idx "Yeah right, like I'm going to let you delop ME!\r"
		return 0
	}
	if {![validuser $hand]} {
		putdcc $idx "$nick is not a registered user.\r"
		if {[botisop $chan]} {pushmode $chan -o $nick}
		return 0
	}
	if {[getting-users]} {
		putdcc $idx "Sorry, but i'm transferring userfile, try later.\r"
		return 0
	}
	if {![matchattr $hand -|+o $chan]} {
		putdcc $idx "$nick is not op in $chan\r"
	} {
		chattr $hand -|-o $chan
		putdcc $idx "$nick has been removed of $chan oplist.\r"
		puthelp "NOTICE $nick :You have been removed of $chan oplist by $handy."
	}
	if {[botisop $chan]} {pushmode $chan -o $nick}
	return 0
}

### .channel <chan>

proc dcc_lol_channel {a b arg} {
	set arg [charfilter $arg]
	if {[llength $arg] != 1} {
		putdcc $b "\002Usage:\002 .channel <chan>\r"
		return 0
	}
	set chan [lindex $arg 0]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	if {[validchan $chan]} {
		if {![isdynamic $chan]} {
			putdcc $b "$chan is a STATIC channel\r"
			if {![matchattr $a o|o $chan]} {
				putdcc $b "You are not operator of $chan.\r"
				return 0
			}
			*dcc:channel $a $b $chan
			return 0
		} {
			putdcc $b "$chan is a DYNAMIC channel\r"
			if {![matchattr $a o|o $chan]} {
				putdcc $b "You are not operator of $chan.\r"
				return 0
			}
			*dcc:channel $a $b $chan
			return 0
		}
	} {
		if {![matchattr $a o]} {
			putdcc $b "You need to be a global op to join a new chan.\r"
			return 0
		}
		putdcc $b "Joining $chan...\r"
		channel add $chan
		utimer 10 "*dcc:channel $a $b $chan"
		utimer 15 "partchan $b $chan"
	}
	return 0
}

proc partchan {b chan} {
	putdcc $b "Parting $chan...\r"
	channel remove $chan
}

### .mode <chan> <flags>

proc dcc_lol_mode {a b arg} {
	set arg [charfilter $arg]
	if {[llength $arg] != 2} {
		putdcc $b "\002Usage:\002 .mode <chan> <flags>\r"
		return 0
	}
	set chan [lindex $arg 0]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	set flags [lrange $arg 1 end]
	if {![botisop $chan]} {
		putdcc $b "Sorry, I'm not op in $chan\r"
		return 0
	}
	if {![validchan $chan]} {
		putdcc $b "I'm not on $chan \r"
		return 0
	}
	if {[matchattr $a o|o $chan]} {
		pushmode $chan $flags
		putdcc $b "Mode of $chan changed.\r"
	} {
		putdcc $b "You are not operator of $chan.\r"
	}
}

### .help

proc dcc_lol_help {a b c} {
	set arg [charfilter $c]
	global lol
	*dcc:help $a $b $c
	putdcc $b "\r"
	putdcc $b "!!! Type \002.help-lol\002 to see the special commands of $lol(version) !!!\r"
}

### .gpl-lol

proc dcc_lol_gpl-lol {hand idx arg} {
	set arg [charfilter $arg]
	global lol
	putdcc $idx "\r"
	putdcc $idx "Eggdrop TCL Script: $lol(version).\r"
	putdcc $idx "Copyright (C) 1998 LL Productions.\r"
	putdcc $idx "\r"
	putdcc $idx "Get the last version at: ftp://ftp.sodre.net/pub/eggdrop/scripts1.3/\r"
	putdcc $idx "LoL's TooLz HomePage: http://www.chez.com/lolstoolz/\r"
	putdcc $idx "\r"
	putdcc $idx "This program is free software; you can redistribute it and/or\r"
	putdcc $idx "modify it under the terms of the GNU General Public License 2\r"
	putdcc $idx "\r"
	putdcc $idx "This program is distributed in the hope that it will be useful,\r"
	putdcc $idx "but WITHOUT ANY WARRANTY; without even the implied warranty of\r"
	putdcc $idx "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\r"
	putdcc $idx "GNU General Public License for more details.\r"
	putdcc $idx "\r"
	putdcc $idx "You should have received a copy of the GNU General Public License\r"
	putdcc $idx "along with this program; if not, write to the Free Software\r"
	putdcc $idx "Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.\r"
	putdcc $idx "\r"
}

### .help-lol

proc dcc_lol_help-lol {hand idx arg} {
	set arg [charfilter $arg]
	global lol
	if {[lindex $arg 0] == ""} {
		putdcc $idx "                  \002******************************************\r"
		putdcc $idx "                  \002*** Party-line commands of LOL's Toolz ***\r"
		putdcc $idx "                  \002******************************************\r"
		putdcc $idx "\r"
		putdcc $idx "\037TYPE |         COMMAND         |               DESCRIPTION              | FLAGS\r"
		putdcc $idx "DCC    .param <parameter> <value> Set a bot's global variable.              n\r"
		putdcc $idx "DCC    .enable <hand>            Enable chan commands for a disabled user.  n\r"
		putdcc $idx "DCC    .disable <hand>           Disable chan commands for an user.         n\r"
		putdcc $idx "DCC    .userlist \[flags\]         Sort the users of the bot.                 n\r"
		putdcc $idx "DCC    .join <chan> \[chan pass\]  Join or create a new chan.                 n\r"
		putdcc $idx "DCC    .partyban <hand>          Boot an user and remove partyline flag.    m\r"
		putdcc $idx "DCC    .botnick <nick>           Change the botnick.                        m\r"
		putdcc $idx "DCC    .part <chan>              Part a chan but not remove it of the bot.  m|m\r"
		putdcc $idx "DCC    .security                 Security risk with dynamic IP.             m|m\r"
		putdcc $idx "DCC    .addop <nick> <chan> \[hand\] \[f\] Add opflag and partyline.            m|m\r"
		putdcc $idx "DCC    .delop <nick> <chan>      Remove opflag.                             m|m\r"
		putdcc $idx "DCC    .userlist <flags>         Show bot's userlist.                       o\r"
		putdcc $idx "DCC    .chanlist <chan>          Show bot's channels.                       o\r"
		putdcc $idx "DCC    .online                   Show bot's online infos.                   o\r"
		putdcc $idx "DCC    .channel <chan>           Show who is in a chan.                     o|o\r"
		putdcc $idx "DCC    .mode <chan> <flags>      Put the requested flags at a chan.         o|o\r"
		putdcc $idx "DCC    .unident                  Disable the chan commands.                 -\r"
		putdcc $idx "DCC    .seen <nick|hand>         Show the last time the user was online.    -\r"
		putdcc $idx "DCC    .permident <mask>         Set a permident mask.                      -\r"
		putdcc $idx "DCC    .unpermident              Remove the permident mask.                 -\r"
		putdcc $idx "DCC    .silent                   Disable bot warning for chan commands.     -\r"
		putdcc $idx "DCC    .unsilent                 Enable bot warning for chan commands.     -\r"
		putdcc $idx "DCC    .help-lol \[chan or msg\]   This help and more...                      -\r"
		putdcc $idx "DCC    .chanhelp                 Help on chan's commands.                   -\r"
		putdcc $idx "DCC    .identhelp                Tutorial on ident system.                  -\r"
		putdcc $idx "\r"
		putdcc $idx "For chan commands type: .help-lol chan \r"
		putdcc $idx "For messages commands type: .help-lol msg \r"
		putdcc $idx "\r"
		putdcc $idx "$lol(version)\r"
		putdcc $idx "Report me the bugs, thanks. \002lol@mail.dotcom.fr\002\r"
		return 0
	}
	if {[lindex $arg 0] == "chan"} {
		putdcc $idx "                     \002************************************\r"
		putdcc $idx "                     \002*** Chan commands of LOL's Toolz ***\r"
		putdcc $idx "                     \002************************************\r"
		putdcc $idx "\r"
		putdcc $idx "\037TYPE |         COMMAND         |               DESCRIPTION              | FLAGS\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]param <parameter> <value> Set a value at a bot's global variable    n\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]enable <nick>            Enable chan commands for a disabled user.  n\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]disable <nick>           Disable chan commands for an user.         n\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]deluser <nick|hand> \[chan\] Remove an user or a bot.                 n\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]addhost <nick|hand> \[host\] Add an host.                             n\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]delhost <nick|hand> <host> Delete an host.                          n\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]join <chan> \[chan pass\]  Join or create a new chan.                 n\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]remove <chan>            Remove a chan and his users.               n\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]addmaster <nick> \[hand\] \[f\] Add chan masterflag.                    n|n\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]delmaster <nick>         Delete chan masterflag.                    n|n\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]jump <server> \[port\]     Jump to a new server.                      m\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]botnick <nick>           Change the botnick.                        m\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]banmask <mask> \[time\] \[reason\] Ban a mask (time 0 = perm ban).      m|m\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]adduser <nick> \[hand\] Add an user.                                  m|m\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]addbot <nick> \[port\] \[hand\] Add a bot.                              m|m\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]addop <nick> \[hand\] \[f\] See .addop.                                 m|m\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]delop <nick>             See .delop.                                m|m\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]findip <mask>            Search users that match IP mask.           m|m\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]online                   Show online bot's informations.            o|o\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]mode <flags>             Put the requested flags at a chan.         o|o\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]ban <nick|mask> \[time\] \[reason\] Ban an user (time 0 = perm ban).    o|o\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]unban <mask|number>      Unban a mask.                              o|o\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]broadcast <text>         Send text on all the chans you are op.     o|o\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]addvoice <nick> \[hand\] \[f\] Add voiceflag and partyline.             o|o\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]delvoice <nick>          Remove voiceflag.                          o|o\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]op \[nick\]                Op an user.                                o|o\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]deop \[nick\]              Deop an user.                              o|o\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]whois <nick>             Show the hand of an user.                  o|o\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]quick <nick|mask> \[reason\] Kick an user and ban him 7 seconds.      o|o\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]mirc                     Kick the Mirc users.                       o|o\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]eggdrop                  Kick the Eggdrops.                         o|o\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]ircii                    Kick the IRCII users.                      o|o\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]bitchx                   Kick the BitchX users.                     o|o\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]topic <topic>            Set a new topic.                           o|o\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]chattr <nick> <flags>    Change the flags of an user.               o|o\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]voice \[nick\]             Voice an user.                             v|v\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]devoice \[nick\]           Devoice an user.                           v|v\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]kick <nick|mask> \[reason\] Kick an user.                             v|v\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]stats                    Show channel stats.                        v|v\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]cigarette \[nick\]         Offer a cigarette :)                       v|v\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]rose \[nick\]              Offer a superb rose :)                     v|v\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]pastaga \[nick\]           Give a glass of pastaga :)                 v|v\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]beer \[nick\]              Give a fresh beer :)                       v|v\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]coke \[nick\]              Give a fresh coke :)                       v|v\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]penalty \[player\] \[ball\]  Shoot a penalty (french joke).             v|v\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]unident                  Disable the chan commands.                 -\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]unpermident              Remove the permident mask.                 -\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]seen <nick|hand>         Show the last time the user was online.    -\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]help                     Show a short help in chan.                 -\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]time                     Show the actual time.                      -\r"
		putdcc $idx "CHAN   [string trim $lol(cmdchar)]troubles                 An help to resolve the problems.           -\r"
		putdcc $idx "\r"
		putdcc $idx "Try .chanhelp too ;) another version of this help.\r"
		putdcc $idx "For party-line commands type: .help-lol \r"
		putdcc $idx "For messages commands type: .help-lol msg \r"
		putdcc $idx "\r"
		putdcc $idx "$lol(version)\r"
		putdcc $idx "Report me the bugs, thanks. \002lol@mail.dotcom.fr\002\r"
		return 0
	}
	if {[lindex $arg 0] == "msg"} {
		putdcc $idx "                   \002****************************************\r"
		putdcc $idx "                   \002*** Messages commands of LOL's Toolz ***\r"
		putdcc $idx "                   \002****************************************\r"
		putdcc $idx "\r"
		putdcc $idx "\002 THE FIRST PARAMETER OF ALL THESE COMMANDS IS ALWAYS PASSWORD.\r"
		putdcc $idx "\r"
		putdcc $idx "\037TYPE |         COMMAND         |               DESCRIPTION              | FLAGS\r"
		putdcc $idx "MSG    param <parameter> <value> Set a global variable.                     n\r"
		putdcc $idx "MSG    enable <hand>             Enable chan commands for a disabled user.  n\r"
		putdcc $idx "MSG    disable <hand>            Disable chan commands for an user.         n\r"
		putdcc $idx "MSG    join <chan> \[chan pass\]   Join or create a new chan.                 n\r"
		putdcc $idx "MSG    remove <chan>             Remove a chan and chan's users.            n\r"
		putdcc $idx "MSG    deluser <hand>            Remove an user of the bot.                 n\r"
		putdcc $idx "MSG    addhost <hand> <host>     See !addhost.                              n\r"
		putdcc $idx "MSG    delhost <hand> <host>     See !delhost.                              n\r"
		putdcc $idx "MSG    addmaster <nick> <chan> \[hand\] \[f\] See !addmaster.                   n|n\r"
		putdcc $idx "MSG    msg <chan or nick> <message> Send a message.                         m\r"
		putdcc $idx "MSG    botnick <nick>            Change the botnick.                        m\r"
		putdcc $idx "MSG    part <chan>               Part a chan but not remove it of the bot.  m|m\r"
		putdcc $idx "MSG    banmask <mask> <chan> \[time\] \[reason\] See !banmask.                  m|m\r"
		putdcc $idx "MSG    addop <nick> <chan> \[hand\] \[f\] See !addop.                           m|m\r"
		putdcc $idx "MSG    adduser <nick> <chan> \[hand\] See !adduser.                           m|m\r"
		putdcc $idx "MSG    addbot <nick> <chan> \[port\] \[hand\] See !addbot.                      m|m\r"
		putdcc $idx "MSG    chattr <hand> <flags> \[chan\] See !chattr.                            o|o\r"
		putdcc $idx "MSG    broadcast <password> <text> See !broadcast.                          o|o\r"
		putdcc $idx "MSG    addvoice <nick> <chan> \[hand\] \[f\] See !addvoice.                     o|o\r"
		putdcc $idx "MSG    ban <nick|mask> <chan> \[time\] \[reason\] See !ban.                     o|o\r"
		putdcc $idx "MSG    unban <mask|number> <chan> See !unban.                               o|o\r"
		putdcc $idx "MSG    mode <chan> <flags>       See !mode.                                 o|o\r"
		putdcc $idx "MSG    key <chan>                Send the key of a chan where you are op.   o|o\r"
		putdcc $idx "MSG    quick <nick|mask> <chan>  See !quick.                                o|o\r"
		putdcc $idx "MSG    banlist <chan>            See !banlist.                              o|o\r"
		putdcc $idx "MSG    unban <mask> <chan>       See !unban.                                o|o\r"
		putdcc $idx "MSG    whois <nick>              Show the hand of an user.                  o|o\r"
		putdcc $idx "MSG    invite \[chan\]             Invite you in a chan.                      o|o\r"
		putdcc $idx "MSG    seen <nick|hand>          Show the last time the user was online.   -\r"
		putdcc $idx "MSG    ident                     Enable the chan commands.                 -\r"
		putdcc $idx "MSG    unident                   Disable the chan commands.                 -\r"
		putdcc $idx "MSG    permident \[mask\]          Set a permident mask.                      -\r"
		putdcc $idx "MSG    unpermident               Disable the permident mask.                -\r"
		putdcc $idx "MSG    silent                    Disable bot warning for chan commands.     -\r"
		putdcc $idx "MSG    unsilent                  Enable bot warning for chan commands.      -\r"
		putdcc $idx "MSG    help                      Bot help + LoL's toolz msg quick help.     -\r"
		putdcc $idx "\r"
		putdcc $idx "For party-line commands type: .help-lol\r"
		putdcc $idx "For chan commands type: .help-lol chan\r"
		putdcc $idx "\r"
		putdcc $idx "$lol(version)\r"
		putdcc $idx "Report me the bugs, thanks. \002lol@mail.dotcom.fr\002\r"
		return 0
	}
	putdcc $idx "\002Usage\002: .help-lol \[chan or msg\]\r"
	return 0
}

### .chanhelp

proc dcc_lol_chanhelp {hand idx arg} {
	set arg [charfilter $arg]
	global lol botnick
	putdcc $idx "                         \002****************************\r"
	putdcc $idx "                         \002*** CHAN'S COMMANDS HELP ***\r"
	putdcc $idx "                         \002****************************\r"
	putdcc $idx "\r"
	putdcc $idx "Before to use the chan functions, you need to identify you:\r"
	putdcc $idx "\002/msg $botnick id <password>\002\r"
	putdcc $idx " \r"
	putdcc $idx "\037Global owners:\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]param <parameter> <value>\002 to set a value for a bot's global variable.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]enable <nick>\002 to enable chan commands for a disabled user.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]disable <nick>\002 to disable chan commands for an user.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]deluser <nick>\002 to delete an user or a bot.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]join <chan> \[chan pass\]\002 to join or create a new chan.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]remove \[chan\]\002 to remove a chan and his users.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]jump <server> \[port\]\002 to jump to a new server.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]addhost <nick|hand> \[host\]\002 to add an host.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]delhost <nick|hand> <host>\002 to delete an host.\r"
	putdcc $idx " \r"
	putdcc $idx "\037Chan owners:\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]addmaster <nick> \[hand\] \[f\]\002 to give masterflag and partyline.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]delmaster <nick>\002 to remove masterflag.\r"
	putdcc $idx " \r"
	putdcc $idx "\037Global masters:\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]jump <server> \[port\]\002 to jump to a new server.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]botnick <nick>\002 to change the botnick.\r"
	putdcc $idx " \r"
	putdcc $idx "\037Chan masters:\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]banmask <mask> \[time\]\002 to ban a mask (time 0 = perm ban).\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]addop <nick> \[hand\] \[f\]\002 to give opflag and partyline.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]delop <nick>\002 to remove opflag.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]adduser <nick> \[hand\]\002 to add an user.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]addbot <nick> \[port\] \[hand\]\002 to add a bot.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]findip <mask>\002 Search users that match IP mask.\r"
	putdcc $idx " \r"
	putdcc $idx "\037Chan ops:\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]chattr <nick> <flags>\002 to set specifics flags at an user.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]online\002 to see online bot's informations.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]mode <flags>\002 to put the requested flags on the chan.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]banlist\002 show chan banlist.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]ban <nick|mask> \[time\]\002 to ban someone (time 0 = perm ban).\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]unban <mask|number>\002 to unban a mask.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]addvoice <nick> \[hand\] \[f\]\002 to give voiceflag and partyline.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]delvoice <nick>\002 to remove voiceflag.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]op \[nick\]\002 to op.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]deop \[nick\]\002 to deop.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]broadcast <text>\002 to send a message on all chans you are op.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]topic <topic>\002 to change topic.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]whois <nick>\002 to see the hand of an user.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]quick <nick|mask> \[reason\]\002 to kick someone and ban him 7 seconds.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]mirc\002 to kick the Mirc users.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]eggdrop\002 to kick the Eggdrops.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]ircii\002 to kick the IRCII users.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]bitchx\002 to kick the BitchX users.\r"
	putdcc $idx " \r"
	putdcc $idx "\037Chan voiced:\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]voice \[nick\]\002 to voice.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]devoice \[nick\]\002 to devoice.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]kick <nick|mask> \[reason\]\002 to kick someone.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]stats\002 to see channel stats.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]cigarette \[nick\]\002 to offer a cigarette :)\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]rose \[nick\]\002 to offer superb rose :)\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]pastaga (or [string trim $lol(cmdchar)]pastis or [string trim $lol(cmdchar)]51) \[nick\]\002 to give a glass of pastaga :)\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]coke (or [string trim $lol(cmdchar)]coca-cola) \[nick\]\002 to give a fresh coke :)\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]beer \[nick\]\002 to give a fresh beer :)\r"
	putdcc $idx " \r"
	putdcc $idx "\037Public:\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]unident\002 to disable the chan commands.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]unpermident\002 to disable the permident mask.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]time\002 to get time.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]seen <nick|hand>\002 to view when an user was last on irc.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]troubles\002 is you have problems with me.\r"
	putdcc $idx "\002[string trim $lol(cmdchar)]help\002 to receive a short help.\r"
	putdcc $idx " \r"
	putdcc $idx "If some commands don't work, it's probably because the administrator has\r"
	putdcc $idx "disabled them.\r"
	putdcc $idx " \r"
	putdcc $idx "Report me the bugs, thanks. \002lol@mail.dotcom.fr\002\r"
	return 0
}

################# END OF DCC COMMANDS #################

################# START OF MSG COMMANDS #################

### seen <nick|hand>

proc msg_lol_seen {nick host hand arg} {
	set arg [charfilter $arg]
	if {$hand == "*"} {return 0}
	if {[llength $arg] != 1} {
		puthelp "PRIVMSG $nick :\002Usage\002: seen <nick|hand>"
		return 0
	}
	set who [lindex $arg 0]
	puthelp "PRIVMSG $nick :[lol_seen $nick $hand $who ""]"
	return 0
}

### silent <password>

proc msg_lol_silent {nick host hand arg} {
	set arg [charfilter $arg]
	if {$hand == "*"} {return 0}
	if {[llength $arg] != 1} {
		puthelp "PRIVMSG $nick :\002Usage:\002 silent <password>"
		return 0
	}
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $nick :\037Invalid password.\037 \002Usage:\002 silent <password>"
		return 0
	}
	setuser $hand xtra silent 1
	puthelp "PRIVMSG $nick :You are now in silent mode. You won't be notified if you try a command without to be identified. Use \002unsilent\002 to remove the silent mode."
}

### unsilent <password>

proc msg_lol_unsilent {nick host hand arg} {
	set arg [charfilter $arg]
	if {$hand == "*"} {return 0}
	if {[llength $arg] != 1} {
		puthelp "PRIVMSG $nick :\002Usage:\002 unsilent <password>"
		return 0
	}
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $nick :\037Invalid password.\037 \002Usage:\002 unsilent <password>"
		return 0
	}
	setuser $hand xtra silent 0
	puthelp "PRIVMSG $nick :You are no more in silent mode. You will be notified if you try a command without to be identified. Use \002silent\002 to return in the silent mode."
}

### unpermident <password>

proc msg_lol_unpermident {nick host hand arg} {
	set arg [charfilter $arg]
	if {$hand == "*"} {return 0}
	if {[llength $arg] != 1} {
		puthelp "PRIVMSG $nick :\002Usage:\002 unpermident <password>"
		return 0
	}
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $nick :\037Invalid password.\037 \002Usage:\002 unpermident <password>"
		return 0
	}
	setuser $hand xtra permident ""
	if {[getuser $hand xtra auth] != "DEAD"} {
		setuser $hand xtra auth 0
	}
	chattr $hand -3
	puthelp "PRIVMSG $nick :You have no more a permident mask.\r"
}

### unident <password>

proc msg_lol_unident {nick host hand arg} {
	set arg [charfilter $arg]
	if {$hand == "*"} {return 0}
	if {[llength $arg] != 1} {
		puthelp "PRIVMSG $nick :\002Usage:\002 unident <password>"
		return 0
	}
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $nick :\037Invalid password.\037 \002Usage:\002 unident <password>"
		return 0
	}
	if {![check $hand $nick $host]} {
		puthelp "PRIVMSG $nick :You are already not identified."
		return 0
	}
	if {[getuser $hand xtra auth] != "DEAD"} {
		setuser $hand xtra auth 0
	}
	chattr $hand -3
	puthelp "PRIVMSG $nick :You are no more identified."
}

### botnick <password> <nick>

proc msg_lol_botnick {mynick host hand arg} {
	set arg [charfilter $arg]
	global nick
	if {[llength $arg] != 2} {
		puthelp "PRIVMSG $mynick :\002Usage:\002 botnick <password> <nick>"
		return 0
	}
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $mynick :\037Invalid password.\037 \002Usage:\002 botnick <password> <nick>"
		return 0
	}
	set nick [lindex $arg 1]
}

### addhost <password> <hand> <host>

proc msg_lol_addhost {nick host hand arg} {
	set arg [charfilter $arg]
	if {[llength $arg] != 3} {
		puthelp "PRIVMSG $nick :\002Usage:\002 addhost <password> <hand> <host>"
		return 0
	}
	set who [lindex $arg 1]
	set host [lindex $arg 2]
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $nick :\037Invalid password.\037 \002Usage:\002 addhost <password> <hand> <host>"
		return 0
	}
	if {[passwdok $hand ""]} {
		puthelp "PRIVMSG $nick :You must set a password: pass <your_new_password>"
		return 0
	}
	if {[validuser $who] == "*"} {
		puthelp "PRIVMSG $nick :$who is not a registered user."
		return 0
	}
	if {![matchattr $hand m]} {
		puthelp "PRIVMSG $nick :Sorry, but you are not global master."
		return 0
	}
	setuser $who hosts $host
	puthelp "PRIVMSG $nick :$host added for $who."
	return 0
}

### delhost <password> <hand> <host>

proc msg_lol_delhost {nick host hand arg} {
	set arg [charfilter $arg]
	if {[llength $arg] != 3} {
		puthelp "PRIVMSG $nick :\002Usage:\002 delhost <password> <hand> <host>"
		return 0
	}
	set who [lindex $arg 1]
	set host [lindex $arg 2]
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $nick :\037Invalid password\037 \002Usage:\002 delhost <password> <hand> <host>"
		return 0
	}
	if {[passwdok $hand ""]} {
		puthelp "PRIVMSG $nick :You must set a password: pass <your_new_password>"
		return 0
	}
	if {[validuser $who] == "*"} {
		puthelp "PRIVMSG $nick :$who is not a registered user."
		return 0
	}
	if {![matchattr $hand m]} {
		puthelp "PRIVMSG $nick :Sorry, but you are not global master."
		return 0
	}
	if {[delhost $who $host]} {
		puthelp "PRIVMSG $nick :$host removed for $who."
		return 0
	} {
		puthelp "PRIVMSG $nick :I can't remove $host at $who."
		return 0
	}
}

### chattr <password> <hand> <flags> [chan]

proc msg_lol_chattr {nick host hand arg} {
	set arg [charfilter $arg]
	if {[llength $arg] < 3} {
		puthelp "PRIVMSG $nick :\002Usage:\002 chattr <password> <hand> <flags> \[chan\]"
		return 0
	}
	set who [lindex $arg 1]
	set flags [lindex $arg 2]
	set chan [lindex $arg 3]
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $nick :\037Invalid password\037 \002Usage:\002 chattr <password> <hand> <flags> \[chan\]"
		return 0
	}
	if {[passwdok $hand ""]} {
		puthelp "PRIVMSG $nick :You must set a password: pass <your_new_password>"
		return 0
	}
	if {[validuser $who] == "*"} {
		puthelp "PRIVMSG $nick :$who is not a registered user."
		return 0
	}
	if {$chan != ""} {
		if {[matchattr $hand n|n $chan]} {
			set change [chattr $who -|$flags $chan]
			if {$change != ""} {
				set change [lindex [split $change "|"] 1]
				puthelp "PRIVMSG $nick :$who has now theses flags in $chan: $change"
				return 0
			}
			puthelp "PRIVMSG $nick :The flags for $who have not changed."
			return 0
		}
		set flags [string trim $flags n]
		set flags [string trim $flags m]
		if {[matchattr $hand m|m $chan]} {
			set change [chattr $who -|$flags $chan]
			if {$change != ""} {
				set change [lindex [split $change "|"] 1]
				puthelp "PRIVMSG $nick :$who has now theses flags in $chan: $change"
				return 0
			}
			puthelp "PRIVMSG $nick :The flags for $who have not changed."
			return 0
		}
		set flags [string trim $flags o]
		if {[matchattr $hand o|o $chan]} {
			set change [chattr $who -|$flags $chan]
			if {$change != ""} {
				set change [lindex [split $change "|"] 1]
				puthelp "PRIVMSG $nick :$who has now theses flags in $chan: $change"
				return 0
			}
			puthelp "PRIVMSG $nick :The flags for $who have not changed."
			return 0
		}
	} {
		if {[matchattr $hand n]} {
			set change [chattr $who $flags]
			if {$change != ""} {
				puthelp "PRIVMSG $nick :$who has now theses global flags: $change"
				return 0
			}
			puthelp "PRIVMSG $nick :The flags for $who have not changed."
			return 0
		}
		set flags [string trim $flags n]
		set flags [string trim $flags m]
		if {[matchattr $hand m]} {
			set change [chattr $who $flags]
			if {$change != ""} {
				puthelp "PRIVMSG $nick :$who has now theses global flags: $change"
				return 0
			}
			puthelp "PRIVMSG $nick :The flags for $who have not changed."
			return 0
		}
		set flags [string trim $flags o]
		if {[matchattr $hand o]} {
			set change [chattr $who $flags]
			if {$change != ""} {
				puthelp "PRIVMSG $nick :$who has now theses global flags: $change"
				return 0
			}
			puthelp "PRIVMSG $nick :The flags for $who have not changed."
			return 0
		}
	}
	puthelp "PRIVMSG $nick :You have not enought rights to use this function."
	return 0
}

### param <password> <parameter> <value>

proc msg_lol_param {nick host hand arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {[llength $arg] != 3} {
		puthelp "PRIVMSG $nick :\002Usage:\002 param <password> <parameter> <value>"
		return 0
	}
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $nick :\037Invalid password\037 \002Usage:\002 param <password> <parameter> <value>"
		return 0
	}
	if {[passwdok $hand ""]} {
		puthelp "PRIVMSG $nick :You must set a password: pass <your_new_password>"
		return 0
	}
	if {[lindex $arg 2] == ""} {
		puthelp "PRIVMSG $nick :\037\002Usage:\002 [string trim $lol(cmdchar)]param <parameter> <value>\037"
		set param_display ""
		append param_display "\002cmdchar:\002 $lol(cmdchar)"
		append param_display "   "
		append param_display "\002security:\002 $lol(security)"
		append param_display "   "
		append param_display "\002nopass:\002 $lol(nopass)"
		append param_display "   "
		append param_display "\002chankey:\002 $lol(chankey)"
		append param_display "   "
		append param_display "\002silent:\002 $lol(silent)"
		append param_display "   "
		append param_display "\002ident:\002 $lol(ident)"
		append param_display "   "
		append param_display "\002id_confirm:\002 $lol(id_confirm)"
		append param_display "   "
		append param_display "\002clone:\002 $lol(clone)"
		append param_display "   "
		append param_display "\002jokes:\002 $lol(jokes)"
		append param_display "   "
		append param_display "\002color:\002 $lol(color)"
		append param_display "   "
		append param_display "\002help:\002 $lol(help)"
		append param_display "   "
		append param_display "\002troubles:\002 $lol(troubles)"
		append param_display "   "
		append param_display "\002seen:\002 $lol(seen)"
		append param_display "   "
		append param_display "\002time:\002 $lol(time)"
		append param_display "   "
		append param_display "\002chan_flood:\002 $lol(chan_flood)"
		append param_display "   "
		append param_display "\002join_flood:\002 $lol(join_flood)"
		append param_display "   "
		append param_display "\002deop_flood:\002 $lol(deop_flood)"
		append param_display "   "
		append param_display "\002ctcp_flood:\002 $lol(ctcp_flood)"
		append param_display "   "
		append param_display "\002kick_flood:\002 $lol(kick_flood)"
		append param_display "   "
		append param_display "\002chan_parameters:\002 $lol(chan_parameters)"
		puthelp "PRIVMSG $nick :$param_display"
		set param_display ""
		append param_display "\002ban_protect:\002 $lol(ban_protect)"
		append param_display "   "
		append param_display "\002chanmode:\002 $lol(chanmode)"
		append param_display "   "
		append param_display "\002server_flags:\002 $lol(server_flags)"
		append param_display "   "
		append param_display "\002welcome:\002 $lol(welcome)"
		append param_display "   "
		append param_display "\002idle_protect:\002 $lol(idle_protect)"
		append param_display "   "
		append param_display "\002warn_idle_time:\002 $lol(warn_idle_time)"
		append param_display "   "
		append param_display "\002max_idle_time:\002 $lol(max_idle_time)"
		append param_display "   "
		append param_display "\002kick_idle_time:\002 $lol(kick_idle_time)"
		append param_display "   "
		append param_display "\002idle_ban_time:\002 $lol(idle_ban_time)"
		append param_display "   "
		append param_display "\002no_kick_flags:\002 $lol(no_kick_flags)"
		append param_display "   "
		append param_display "\002no_ban_flags:\002 $lol(no_ban_flags)"
		append param_display "   "
		append param_display "\002no_idle_flags:\002 $lol(no_idle_flags)"
		puthelp "PRIVMSG $nick :$param_display"
		set param_display ""
		append param_display "\002welmsg:\002 $lol(welmsg)"
		puthelp "PRIVMSG $nick :$param_display"
		set param_display ""
		append param_display "\002away:\002 $lol(away)"
		puthelp "PRIVMSG $nick :$param_display"
		return 0
	}
	set lol([strlwr [lindex $arg 1]]) [lrange $arg 2 end]
	puthelp "PRIVMSG $nick :The new value of [strlwr [lindex $arg 1]] is [lrange $arg 2 end]."
	return 0
}

### enable <password> <hand>

proc msg_lol_enable {nick host hand arg} {
	set arg [charfilter $arg]
	global botnick
	if {[llength $arg] != 2} {
		puthelp "PRIVMSG $nick :\002Usage:\002 enable <password> <hand>"
		return 0
	}
	set who [lindex $arg 1]
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $nick :\037Invalid password\037 \002Usage:\002 enable <password> <hand>"
		return 0
	}
	if {[passwdok $hand ""]} {
		puthelp "PRIVMSG $nick :You must set a password: pass <your_new_password>"
		return 0
	}
	if {[validuser $who] == "*"} {
		puthelp "PRIVMSG $nick :$who is not a registered user."
		return 0
	}
	if {[getuser $who xtra auth] != "DEAD"} {
		puthelp "PRIVMSG $nick :$who is already enabled."
		return 0
	}
	setuser $who xtra auth 0
	puthelp "PRIVMSG $nick :$who is now enabled."
	return 0
}

### disable <password> <hand>

proc msg_lol_disable {nick host hand arg} {
	set arg [charfilter $arg]
	global botnick
	if {[llength $arg] != 2} {
		puthelp "PRIVMSG $nick :\002Usage:\002 disable <password> <hand>"
		return 0
	}
	set who [lindex $arg 1]
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $nick :\037Invalid password\037 \002Usage:\002 disable <password> <hand>"
		return 0
	}
	if {[passwdok $hand ""]} {
		puthelp "PRIVMSG $nick :You must set a password: pass <your_new_password>"
		return 0
	}
	if {[validuser $who] == "*"} {
		puthelp "PRIVMSG $nick :$who is not a registered user."
		return 0
	}
	if {[getuser $who xtra auth] == "DEAD"} {
		puthelp "PRIVMSG $nick :$who is already disabled."
		return 0
	}
	setuser $who xtra auth DEAD
	chattr $who -3
	puthelp "PRIVMSG $nick :$who is now disabled."
	return 0
}

### ident <password> [username]

proc msg_lol_ident {nick host hand arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {$hand == "*"} {
		if {[llength $arg] < 2 || [llength $arg] > 2} {return 0}
		set find 0
		foreach user [userlist] {
			if {[strlwr $user] == [strlwr [lindex $arg 1]]} {
				set find 1
				break
			}
		}
		if {$find == 0} {return 0}
		if {[passwdok [strlwr [lindex $arg 1]] [lindex $arg 0]]} {
			*msg:ident $nick $host $hand $arg
		}
		return 0
	}
	if {[llength $arg] > 2} {return 0}
	set pass [lindex $arg 0]
	if {[passwdok $hand ""]} {
		puthelp "PRIVMSG $nick :You must set a new password: pass <your_new_password>"
		return 0
	}
	if {[llength $arg] < 1} {
		puthelp "PRIVMSG $nick :\002Usage:\002 ident <password>"
		return 0
	}
	if {[llength $arg] > 1} {
		if {[strlwr [lindex $arg 1]] != [strlwr $hand]} {
			return 0
		} {
			if {![passwdok $hand $pass]} {return 0}
		}
		puthelp "PRIVMSG $nick :\037You are already recognized by the bot :-) Don't worry about your mask !\037 \002Usage:\002 ident <password>"
		return 0
	}
	if {![passwdok $hand $pass]} {
		puthelp "PRIVMSG $nick :\037Invalid password\037 \002Usage:\002 ident <password>"
		return 0
	}
	if {[getuser $hand xtra auth] == "DEAD"} {
		puthelp "PRIVMSG $nick :Sorry, you are disabled of chan commands."
		return 0
	}
	set find 0
	foreach ch [channels] {
		if {[onchan $nick $ch]} {
			set find 1
			break
		}
	}
	if {$find == 0} {
		puthelp "PRIVMSG $nick :You must be on one of my chans to be identified."
		return 0
	}
	setuser $hand xtra auth 1
	setuser $hand xtra authnick $nick
	set host [lindex [split $host "@"] 1]
	setuser $hand xtra authhost $host
	chattr $hand +3
	if {$lol(id_confirm) == 1} {
		puthelp "PRIVMSG $nick :You have been identified. You can unident you with \002unident\002, set a perm ident mask with \002permident\002 and remove chan ident warning with \002silent\002."
	}
	return 0
}

### permident <password> [nick!user@host]

proc msg_lol_permident {nick host hand arg} {
	set arg [charfilter $arg]
	if {$hand == "*"} {return 0}
	global botnick
	if {[llength $arg] < 1} {
		puthelp "PRIVMSG $nick :\002Usage:\002 permident <password> \[nick!user@host\]"
		return 0
	}
	set mask [lindex $arg 1]
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $nick :\037Invalid password\037 \002Usage:\002 permident <password> \[user@host\]"
		return 0
	}
	if {[passwdok $hand ""]} {
		puthelp "PRIVMSG $nick :You must set a password: pass <your_new_password>"
		return 0
	}
	set find 0
	foreach ch [channels] {
		if {[onchan $nick $ch]} {
			set find 1
			break
		}
	}
	if {$find == 0 && $mask == ""} {
		puthelp "PRIVMSG $nick :You must be on one of my chans to be permidentified, or use: permident <password> <user@host>."
		return 0
	}
	if {$mask == ""} {
		setuser $hand xtra permident *!$host
	} {
		setuser $hand xtra permident $mask
	}
	puthelp "PRIVMSG $nick :You hare permidentified with this mask: [getuser $hand xtra permident]. Use \002unpermident\002 to remove it."
}

### online <password>

proc msg_lol_online {nick host hand arg} {
	set arg [charfilter $arg]
	global server {server-online} uptime
	if {[llength $arg] != 1} {
		puthelp "PRIVMSG $nick :\002Usage:\002 online <password>"
		return 0
	}
	set ip [lindex [split $server ":"] 0]
	set port [lindex [split [lindex [split $server ":"] 1] "-"] 0]
	set timeon [time_diff ${server-online}]
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $nick :\037Invalid password\037 \002Usage:\002 online <password>"
		return 0
	}
	if {[passwdok $hand ""]} {
		puthelp "PRIVMSG $nick :You must set a password: pass <your_new_password>"
		return 0
	}
	set numbots 0
	foreach bot [bots] {
		incr numbots
	}
	set numchans 0
	foreach ch [channels] {
		incr numchans
	}

	set msg ""
	append msg "\037*** ONLINE INFOS !!! ***\037 "
	append msg "I have not crashed since [time_diff $uptime] ;) "
	append msg "\002I'm on $ip since $timeon.\002 "
	if {![matchattr $hand o]} {
		append msg "I'm on $numchans chan(s)."
	} {
		if {$numchans != 0} {
			append msg "I'm on theses chans: [channels]. "
		} {
			append msg "I'm not on chans. "
		}
	}
	if {![matchattr $hand o]} {
		append msg "\002I'm linked with $numbots bot(s).\002 "
	} {
		if {$numbots != 0} {
			append msg "\002I'm linked with theses bots: [bots]\002 "
		} {
			append msg "\002I'm not linked with bots.\002 "
		}
	}
	puthelp "PRIVMSG $nick :$msg"
}

### broadcast <password> <text>

proc msg_lol_broadcast {nick host c arg} {
	set arg [charfilter $arg]
	if {[llength $arg] < 2} {
		puthelp "PRIVMSG $nick :\002Usage:\002 broadcast <password> <text>"
		return 0
	}
	set text [lrange $arg 1 end]
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $nick :\037Invalid password\037 \002Usage:\002 broadcast <password> <text>"
		return 0
	}
	if {[passwdok $hand ""]} {
		puthelp "PRIVMSG $nick :You must set a password: pass <your_new_password>"
		return 0
	}
	foreach chan [channels] {
		if {[matchattr $c o|o $chan]} {
			puthelp "PRIVMSG $chan :\002<$nick>:\002 $text"
		}
	}
}

### key <password> <chan>

proc msg_lol_key {nick host hand arg} {
	set arg [charfilter $arg]
	if {[llength $arg] != 2} {
		puthelp "PRIVMSG $nick :\002Usage\002: key <password> <chan>"
		return 0
	}
	set chan [lindex $arg 1]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $nick :\037Invalid password\037 \002Usage:\002 key <password> <chan>"
		return 0
	}
	if {[passwdok $hand ""]} {
		puthelp "PRIVMSG $nick :You must set a password: pass <your_new_password>"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "PRIVMSG $nick :I'm not on $chan "
		return 0
	}
	if {![matchattr $hand o|o $chan]} {
		puthelp "PRIVMSG $nick :Sorry, but you are not operator in $chan."
		return 0
	}
	set mode [getchanmode $chan]
	if {[string first k [lindex $mode 0]] != -1} {
		set posmode [string first k [lindex $mode 0]]
		if {[string first l [lindex $mode 0]] != -1} {
			set poslim [string first l [lindex $mode 0]]
			if {$posmode < $poslim} {
				puthelp "PRIVMSG $nick :The key of $chan is [lindex $mode 1]."
			} {
				puthelp "PRIVMSG $nick :The key of $chan is [lindex $mode 2]."
			}
		} {
			puthelp "PRIVMSG $nick :The key of $chan is [lindex $mode 1]."
		}
		return 0
	}
	puthelp "PRIVMSG $nick :$chan don't require a key to enter."
}

## kick <password> <nick|mask> <chan> [reason]

proc msg_lol_kick {nick host hand arg} {
	set arg [charfilter $arg]
	global botnick
	if {[llength $arg] < 2} {
		puthelp "PRIVMSG $nick :\002Usage:\002 kick <password> <nick|mask> <chan> \[reason\]"
		return 0
	}
	set who [lindex $arg 1]
	set chan [lindex $arg 2]
	set reason [lrange $arg 3 end]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	if {$reason == ""} {
		set reason "requested"
	}
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $nick :\037Invalid password\037 \002Usage:\002 kick <password> <nick|mask> <chan> \[reason\]"
		return 0
	}
	if {[passwdok $hand ""]} {
		puthelp "PRIVMSG $nick :You must set a password: pass <your_new_password>"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "PRIVMSG $nick :I'm not on $chan "
		return 0
	}
	if {![botisop $chan]} {
		puthelp "PRIVMSG $nick :Sorry, I'm not op in $chan"
		return 0
	}
	if {![matchattr $hand ov|ov $chan]} {
		puthelp "PRIVMSG $nick :Sorry, but you are not operator or voice in $chan."
		return 0
	}
### GLOBAL nick hand chan who
	if {[string first "*" $who] != -1 || [string first "?" $who] != -1} {
		if {![matchattr $hand o|o $chan]} {
			puthelp "PRIVMSG $nick :You need to be an op in $chan to use mask kick."
			return 0
		}
		if {$reason == "requested"} {set reason "MaskKick: $who"}
		set who [strlwr $who]
		set kickcount 0
	
		if {$kickcount == 0} {
			puthelp "PRIVMSG $nick :Sorry but nobody match this mask in $chan."
		}
	} {
		if {![onchan $who $chan]} {
			puthelp "PRIVMSG $nick :Sorry, but i don't find $who in $chan."
			return 0
		}
		if {[strlwr $who] == [strlwr $botnick]} {
			puthelp "PRIVMSG $nick :Yeah right, like I'm going to let you kick ME!"
			return 0
		}
		if {[nick2hand $who $chan] != "*"} {
			if {$hand != [nick2hand $who $chan]} {
				if {[matchattr [nick2hand $who $chan] o|o $chan] && ![matchattr $hand o|o $chan]} {
					puthelp "PRIVMSG $nick :Sorry, you must to be an operator in $chan to kick an operator."
					return 0
				}
				if {([matchattr [nick2hand $who $chan] m|m $chan] || [matchattr [nick2hand $who $chan] b]) && ![matchattr $hand m|m $chan]} {
					puthelp "PRIVMSG $nick :Sorry, you must to be a master in $chan to kick a master or a bot."
					return 0
				}
			}
		}
		putserv "KICK $chan $who :$reason"
	}
	return 0
}

### quick <password> <nick|mask> <chan> [reason]

proc msg_lol_quick {nick host hand arg} {
	set arg [charfilter $arg]
	global botnick
	if {[llength $arg] < 2} {
		puthelp "PRIVMSG $nick :\002Usage:\002 quick <password> <nick|mask> <chan> \[reason\]"
		return 0
	}
	set who [lindex $arg 1]
	set chan [lindex $arg 2]
	set reason [lrange $arg 3 end]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	if {$reason == ""} {
		set reason "requested"
	}
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $nick :\037Invalid password\037 \002Usage:\002 kick <password> <nick|mask> <chan> \[reason\]"
		return 0
	}
	if {[passwdok $hand ""]} {
		puthelp "PRIVMSG $nick :You must set a password: pass <your_new_password>"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "PRIVMSG $nick :I'm not on $chan "
		return 0
	}
	if {![botisop $chan]} {
		puthelp "PRIVMSG $nick :Sorry, I'm not op in $chan"
		return 0
	}
	if {![matchattr $hand ov|ov $chan]} {
		puthelp "PRIVMSG $nick :Sorry, but you are not operator or voice in $chan."
		return 0
	}
### GLOBAL nick hand chan who
	if {[string first "*" $who] != -1 || [string first "?" $who] != -1} {
		if {![matchattr $hand o|o $chan]} {
			puthelp "PRIVMSG $nick :You need to be an op in $chan to use mask kick."
			return 0
		}
		if {$reason == "requested"} {set reason "MaskQuick: $who"}
		set who [strlwr $who]
		set kickcount 0
		foreach chanuser [strlwr [chanlist $chan -mnovfb&-mnovfb]] {
			if {[string match [strlwr $who] [strlwr $chanuser]] && $chanuser != [strlwr $botnick]} {
				incr kickcount
				set hostmask "*!*[getchanhost $chanuser $chan]"
				if {[isop $chanuser $chan]} {pushmode $chan -o $chanuser}
				putserv "MODE $chan +b $hostmask"
				putserv "KICK $chan $chanuser :$reason"
				utimer 7 "deban $chan $hostmask"
			}
		}
		if {$kickcount == 0} {
			puthelp "PRIVMSG $nick :Sorry but nobody match this mask in $chan."
		}
	} {
		if {![onchan $who $chan]} {
			puthelp "PRIVMSG $nick :Sorry, but i don't find $who in $chan."
			return 0
		}
		if {[strlwr $who] == [strlwr $botnick]} {
			puthelp "PRIVMSG $nick :Yeah right, like I'm going to let you kick ME!"
			return 0
		}
		if {[nick2hand $who $chan] != "*"} {
			if {$hand != [nick2hand $who $chan]} {
				if {[matchattr [nick2hand $who $chan] o|o $chan] && ![matchattr $hand o|o $chan]} {
					puthelp "PRIVMSG $nick :Sorry, you must to be an operator in $chan to kick an operator."
					return 0
				}
				if {([matchattr [nick2hand $who $chan] m|m $chan] || [matchattr [nick2hand $who $chan] b]) && ![matchattr $hand m|m $chan]} {
					puthelp "PRIVMSG $nick :Sorry, you must to be a master in $chan to kick a master or a bot."
					return 0
				}
			}
		}
		set hostmask "*!*[getchanhost $who $chan]"
		if {[isop $who $chan]} {pushmode $chan -o $who}
		putserv "MODE $chan +b $hostmask"
		putserv "KICK $chan $who :$reason"
		utimer 7 "deban $chan $hostmask"
	}
	return 0
}

### banlist <password> <chan>

proc msg_lol_banlist {nick host hand arg} {
	set arg [charfilter $arg]
	if {[llength $arg] != 2} {
		puthelp "PRIVMSG $nick :\002Usage:\002 banlist <password> <chan>"
		return 0
	}
	set chan [lindex $arg 1]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $nick :\037Invalid password\037 \002Usage:\002 banlist <password> <chan>"
		return 0
	}
	if {[passwdok $hand ""]} {
		puthelp "PRIVMSG $nick :You must set a password: pass <your_new_password>"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "PRIVMSG $nick :I'm not on $chan "
		return 0
	}
	if {![matchattr $hand o|o $chan]} {
		puthelp "PRIVMSG $nick :Sorry, but you are not operator in $chan."
		return 0
	}
	set num 1
	puthelp "PRIVMSG $nick :\037*** $chan BANS INFOS !!! ***"
	foreach bans [banlist $chan] {
		set victim [lindex $bans 0]
		set why [lindex $bans 1]
		set expire [lindex $bans 2]
		set who [lindex $bans 5]
		set remain [expr $expire - [unixtime]]
		if {$remain > 0} {
			set remain "expire in [time_diff2 $expire]."
		} {
			set remain "PermBan"
		}
		puthelp "PRIVMSG $nick :\002BAN $num:\002 $victim, $remain"
		puthelp "PRIVMSG $nick :$who: $why"
		incr num
	}
	if {$num == 1} {puthelp "PRIVMSG $nick :There is no bans in $chan."}
	return 0
}

### banmask <password> <mask> <chan> [time] [reason]

proc msg_lol_banmask {nick host hand arg} {
	set arg [charfilter $arg]
	if {[llength $arg] < 3} {
		puthelp "PRIVMSG $nick :\002Usage\002: banmask <password> <mask> <chan> \[time\] \[reason\]"
		return 0
	}
	set mask [lindex $arg 1]
	if {[string first "!" $mask] == -1 && [string first "@" $mask] == -1} {set mask $mask!*@*}
#	if {[string first "!" $mask] == -1} {set mask *!*$mask}
	if {[string first "@" $mask] == -1} {set mask $mask*@*}
	set chan [lindex $arg 2]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	set ti [lindex $arg 3]
	if {[number $ti]} {
		set reason [lrange $arg 4 end]
	} {
		set ti ""
		set reason [lrange $arg 3 end]
	}
	if {$reason == ""} {
		set reason "requested"
	}
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $nick :\037Invalid password\037 \002Usage:\002 banmask <password> <mask> <chan> \[time\] \[reason\]"
		return 0
	}
	if {[passwdok $hand ""]} {
		puthelp "PRIVMSG $nick :You must set a password: pass <your_new_password>"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "PRIVMSG $nick :I'm not on $chan "
		return 0
	}
	if {![matchattr $hand m|m $chan]} {
		puthelp "PRIVMSG $nick :Sorry, but you are not master in $chan."
		return 0
	}
	if {[botisop $chan]} {pushmode $chan +b $mask}
	switch $ti {
		""
		{
			newchanban $chan $mask $nick $reason
			puthelp "PRIVMSG $nick :New mask added in $chan: $mask"
		}
		0
		{
			newchanban $chan $mask $nick $reason $ti
			puthelp "PRIVMSG $nick :New mask added permanently in $chan: $mask"
		}
		default
		{
			newchanban $chan $mask $nick $reason $ti
			puthelp "PRIVMSG $nick :New mask added in $chan for $ti minutes: $mask"
		}
	}
	return 0
}

### ban <password> <nick> <chan> [time] [reason]

proc msg_lol_ban {nick host hand arg} {
	set arg [charfilter $arg]
	global botnick
	if {[llength $arg] < 3} {
		puthelp "PRIVMSG $nick :\002Usage:\002 ban <password> <nick> <chan> \[time\] \[reason\]"
		return 0
	}
	set chan [lindex $arg 2]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	set who [lindex $arg 1]
	set ti [lindex $arg 3]
	if {[number $ti]} {
		set reason [lrange $arg 4 end]
	} {
		set ti ""
		set reason [lrange $arg 3 end]
	}
	if {$reason == ""} {
		set reason "requested"
	}
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $nick :\037Invalid password\037 \002Usage:\002 ban <password> <nick> <chan> \[time\] \[reason\]"
		return 0
	}
	if {[passwdok $hand ""]} {
		puthelp "PRIVMSG $nick :You must set a password: pass <your_new_password>"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "PRIVMSG $nick :I'm not on $chan "
		return 0
	}

	if {![matchattr $hand o|o $chan]} {
		puthelp "PRIVMSG $nick :Sorry, but you are not op in $chan."
		return 0
	}
	if {[string first "*" $who] != -1 || [string first "?" $who] != -1} {
		if {$reason == "requested"} {set reason "MaskBan: $who"}
		set who [strlwr $who]
		set bancount 0
		set flags "-$lol(no_ban_flags)&-$lol(no_ban_flags)"
		if {$lol(no_ban_flags) == ""} {
			set list [strlwr [chanlist $chan]]
		} {
			set list [strlwr [chanlist $chan $flags]]
		}
		foreach chanuser $list {
			set banmask ""
			if {[string match [strlwr $who] [strlwr $chanuser]] && $chanuser != [strlwr $botnick] && $chanuser != [strlwr $nick] && ![isop $chanuser $chan] && ![isvoice $chanuser $chan]} {
				incr bancount
				set ipmask [lindex [split [maskhost $chanuser![getchanhost $chanuser $chan]] "@"] 1]
				set userm [lindex [split [getchanhost $chanuser $chan] "@"] 0]
				set banmask *!*$userm@$ipmask
				newchanban $chan $banmask $nick $reason
				if {[botisop $chan]} {
					putserv "MODE $chan +b $banmask"
					putserv "KICK $chan $chanuser :$reason"
				}
			}
		}
		if {$bancount == 0} {
			puthelp "PRIVMSG $nick :Sorry but nobody match this mask."
		}
	} {
		if {![onchan $who $chan]} {
			puthelp "PRIVMSG $nick :Sorry, but i don't find $who in $chan."
			return 0
		}
		if {[strlwr $who] == [strlwr $botnick]} {
			puthelp "PRIVMSG $nick :Yeah right, like I'm going to let you ban ME!"
			return 0
		}
		if {[nick2hand $who $chan] != "*"} {
			if {$hand != [nick2hand $who $chan]} {
				if {[matchattr [nick2hand $who $chan] o|o $chan] && ![matchattr $hand o|o $chan]} {
					puthelp "PRIVMSG $nick :Sorry, you must to be an operator to ban an operator."
					return 0
				}
				if {([matchattr [nick2hand $who $chan] m|m $chan] || [matchattr [nick2hand $who $chan] b]) && ![matchattr $hand m|m $chan]} {
					puthelp "PRIVMSG $nick :Sorry, you must to be a master to ban a master or a bot."
					return 0
				}
			}
		}
		set ipmask [lindex [split [maskhost $who![getchanhost $who $chan]] "@"] 1]
		set userm [lindex [split [getchanhost $who $chan] "@"] 0]
		set banmask *!*$userm@$ipmask
		if {[botisop $chan]} {
			if {[isop $who $chan]} {pushmode $chan -o $who}
			putserv "MODE $chan +b $banmask"
			putserv "KICK $chan $who :$reason"
		}
		switch $ti {
			""
			{
				newchanban $chan $mask $nick $reason
				puthelp "PRIVMSG $nick :New mask added in $chan: $mask"
			}
			0
			{
				newchanban $chan $mask $nick $reason $ti
				puthelp "PRIVMSG $nick :New mask added permanently in $chan: $mask"
			}
			default
			{
				newchanban $chan $mask $nick $reason $ti
				puthelp "PRIVMSG $nick :New mask added in $chan for $ti minutes: $mask"
			}
		}
	}
	return 0
}

### unban <password> <mask|number> <chan>

proc msg_lol_unban {nick host hand arg} {
	set arg [charfilter $arg]
	if {[llength $arg] != 3} {
		puthelp "PRIVMSG $nick :\002Usage:\002 unban <password> <mask> <chan>"
		return 0
	}
	set mask [lindex $arg 1]
	set chan [lindex $arg 2]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	set numban 0
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $nick :\037Invalid password\037 \002Usage:\002 unban <password> <mask> <chan>"
		return 0
	}
	if {[passwdok $hand ""]} {
		puthelp "PRIVMSG $nick :You must set a password: pass <your_new_password>"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "PRIVMSG $nick :I'm not on $chan "
		return 0
	}
	if {![matchattr $hand o|o $chan]} {
		puthelp "PRIVMSG $nick :Sorry, but you are not operator in $chan."
		return 0
	}
	if {[botisop $chan]} {pushmode $chan -b $mask}
	if {[number $mask]} {
		set find 0
		set victim ""
		foreach bans [banlist $chan] {
			incr find
			if {$find == $mask} {
				set victim [lindex $bans 0]
			}
		}
		if {$victim == ""} {
			puthelp "PRIVMSG $nick :There is no ban number $mask in this chan, use \002banlist <password> <chan>\002 to see the bans."
			return 0
		}
		if {[killchanban $chan $victim]} {
			if {[botisop $chan]} {
				pushmode $chan -b $victim
				if {[lindex [split $victim "@"] 1] == "*"} {
					pushmode $chan -b [lindex [split $victim "@"] 0]
				}
			}
			puthelp "PRIVMSG $nick :Ban sucefully removed: $victim"
			return 0
		}
	}
	if {[string first "!" $mask] == -1 && [string first "@" $mask] == -1} {set mask $mask!*@*}
#	if {[string first "!" $mask] == -1} {set mask *!*$mask}
	if {[string first "@" $mask] == -1} {set mask $mask*@*}
	set find 0
	foreach bans [banlist $chan] {
		set victim [lindex $bans 0]
		if {[strlwr $victim] == [strlwr $mask]} {set find 1}
	}
	if {$find == 0} {
		puthelp "PRIVMSG $nick :Your mask don't match exactly a ban, use \002banlist <password> <chan>\002 to see the bans."
		return 0
	}
	if {[killchanban $chan $mask]} {
		puthelp "PRIVMSG $nick :Ban sucefully removed."
		return 0
	} {
		puthelp "PRIVMSG $nick :No such ban."
		return 0
	}
}

### mode <password> <chan> <flags>

proc msg_lol_chan {nick host hand arg} {
	set arg [charfilter $arg]
	global lol
	if {[llength $arg] != 3} {
		puthelp "PRIVMSG $nick :\002Usage:\002 mode <password> <chan> <flags>"
		return 0
	}
	set chan [lindex $arg 1]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	set flags [lrange $arg 2 end]
	if {![passwdok $hand [lindex $arg 0]]} {
		puthelp "PRIVMSG $nick :\037Invalid password\037 \002Usage:\002 mode <password> <chan> <flags>"
		return 0
	}
	if {[passwdok $hand ""]} {
		puthelp "PRIVMSG $nick :You must set a password: pass <your_new_password>"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "PRIVMSG $nick :I'm not on $chan "
		return 0
	}
	if {![botisop $chan]} {
		puthelp "PRIVMSG $nick :Sorry, but I'm not op in $chan"
		return 0
	}
	if {![matchattr $hand o|o $chan]} {
		puthelp "PRIVMSG $nick :Sorry, but you are not operator in $chan."
		return 0
	}
	if {$lol(chankey) == 1} {
		if {[string first k [lindex $mode 0]] != -1} {
			set posmode [string first k [lindex $mode 0]]
			if {[string first l [lindex $mode 0]] != -1} {
				set poslim [string first l [lindex $mode 0]]
				if {$posmode < $poslim} {
					channel set $chan need-key "chankey $chan [lindex $mode 1]"
				} {
					channel set $chan need-key "chankey $chan [lindex $mode 2]"
				}
			} {
				channel set $chan need-key "chankey $chan [lindex $mode 1]"
			}
		}
	}
	pushmode $chan $flags
	puthelp "PRIVMSG $nick :Mode changed in $chan."
	return 0
}

### whois <password> <nick>

proc msg_lol_whois {a b c arg} {
	set arg [charfilter $arg]
	global lol_whois
	if {[llength $arg] != 2} {
		puthelp "PRIVMSG $a :\002Usage:\002 whois <password> <nick>"
		return 0
	}
	set who [lindex $arg 1]
	if {![passwdok $c [lindex $arg 0]]} {
		puthelp "PRIVMSG $a :\037Invalid password\037 \002Usage:\002 whois <password> <nick>"
		return 0
	}
	if {[passwdok $c ""]} {
		puthelp "PRIVMSG $a :You must set a password: pass <your_new_password>"
		return 0
	}
	set find 0
	foreach chan [channels] {
		foreach user [chanlist $chan] {
			if {[strlwr $user] == [strlwr $who]} {
				set find $chan
				break
			}
		}
	}
	if {$find != 0} {
		set handle [nick2hand $who $find]
		set host [getchanhost $who $find]
		puthelp "PRIVMSG $a :[lol_whois $who $host $handle ""]"
		return 0
	} {
		if {![matchattr $c o]} {
			puthelp "PRIVMSG $a :Sorry $who is not on one of my chans right now. I can't analyze him."
			return 0
		}
	}
	if {$lol_whois != ""} {
		puthelp "PRIVMSG $a :Too much whois in queue, wait a moment please."
		return 0
	}
	puthelp "PRIVMSG $a :$who is not on one of my chans right now, I try a whois request to the server, wait a moment."
	putserv "whois $who"
	set lol_whois $a:$who
}

### adduser <password> <nick> <chan> [hand]

proc msg_lol_adduser {me b c arg} {
	set arg [charfilter $arg]
	global botnick
	if {[llength $arg] < 3} {
		puthelp "PRIVMSG $me :\002Usage:\002 adduser <password> <nick> <chan> \[hand\]"
		return 0
	}
	set nick [lindex $arg 1]
	set chan [strlwr [lindex $arg 2]]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	set alternate [lindex $arg 3]]
	if {![passwdok $c [lindex $arg 0]]} {
		puthelp "PRIVMSG $me :\037Invalid password\037 \002Usage:\002 adduser <password> <nick> <chan> \[hand\]"
		return 0
	}
	if {[passwdok $c ""]} {
		puthelp "PRIVMSG $me :You must set a password: pass <your_new_password>"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "PRIVMSG $me :I'm not on $chan "
		return 0
	}
	set hostmask "$nick![getchanhost $nick $chan]"
	set hand [nick2hand $nick $chan]
	if {![onchan $nick $chan]} {
		puthelp "PRIVMSG $me :Sorry, but i don't find $nick in $chan."
		return 0
	}
	if {[strlwr $nick] == [strlwr $botnick]} {
		puthelp "PRIVMSG $me :Sorry, but i can't adduser myself."
		return 0
	}
	if {[getting-users]} {
		puthelp "PRIVMSG $me :Sorry, but i'm transferring userfile, try later."
		return 0
	}
	if {[validuser $hand]} {
		puthelp "PRIVMSG $me :$nick is already recognized with this hand: $hand"
	} {
		if {[validuser $nick] && $alternate == ""} {
			puthelp "PRIVMSG $me :The hand $nick already exist. \002Usage:\002 adduser <password> <nick> <chan>"
			return 0
		}
		if {$alternate != ""} {
			if {[validuser $alternate]} {
				puthelp "PRIVMSG $me :The hand $alternate already exist. Choose an other. \002Usage:\002 adduser <password> <nick> <chan>"
				return 0
			}
			adduser $alternate [maskhost $hostmask]
			puthelp "PRIVMSG $me :New user: $alternate ([maskhost $hostmask])"
			puthelp "NOTICE $nick :You have been added in $botnick userlist by $me with the hand: $alternate."
			puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick pass <your_password>\002"
			return 0
		}
		adduser $nick [maskhost $hostmask]
		puthelp "PRIVMSG $me :New user: $nick ([maskhost $hostmask])"
		puthelp "NOTICE $nick :You have been added in $botnick userlist by $me with the hand: $nick."
		puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick pass <your_password>\002"
		return 0
	}
	if {$alternate != ""} {
		if {[validuser $alternate]} {
			puthelp "PRIVMSG $me :The hand $alternate already exist. \002Usage:\002 adduser <password> <nick> <chan>"
			return 0
		}
		adduser $alternate [maskhost $hostmask]
		puthelp "PRIVMSG $me :New user: $alternate ([maskhost $hostmask])"
		puthelp "NOTICE $nick :You have been added in $botnick userlist by $me with the hand: $alternate."
		puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick PASS <your_password>\002"
		return 0
	}
	return 0
}

### deluser <password> <hand>

proc msg_lol_deluser {me b c arg} {
	set arg [charfilter $arg]
	global botnick
	if {[llength $arg] != 2} {
		puthelp "PRIVMSG $me :\002Usage:\002 deluser <password> <hand>"
		return 0
	}
	set hand [lindex $arg 1]
	if {![passwdok $c [lindex $arg 0]]} {
		puthelp "PRIVMSG $me :\037Invalid password\037 \002Usage:\002 deluser <password> <hand>"
		return 0
	}
	if {[passwdok $c ""]} {
		puthelp "PRIVMSG $me :You must set a password: pass <your_new_password>"
		return 0
	}
	if {[getting-users]} {
		puthelp "PRIVMSG $me :Sorry, but i'm transferring userfile, try later."
		return 0
	}
	if {![validuser $hand]} {
		puthelp "PRIVMSG $me :$nick is not a registered user."
		return 0
	}
	if {[matchattr $hand n]} {
		puthelp "PRIVMSG $me :You can't delete a bot owner."
		return 0
	}
	deluser $hand
	boot $hand "You have been deleted of the bot userlist"
	puthelp "PRIVMSG $me :$hand has been removed from userlist."
	return 0
}

### addbot <password> <nick> <chan> [port] [hand]

proc msg_lol_addbot {me b c arg} {
	set arg [charfilter $arg]
	global botnick
	if {[llength $arg] < 3} {
		puthelp "PRIVMSG $me :\002Usage:\002 addbot <password> <nick> <chan> \[port\] \[hand\]"
		return 0
	}
	set nick [lindex $arg 1]
	set chan [strlwr [lindex $arg 2]]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	set port [lindex $arg 3]
	if {[number $port]} {
		set alternate [lindex $arg 4]
	} {
		set port 3333
		set alternate [lindex $arg 3]
	}
	if {![passwdok $c [lindex $arg 0]]} {
		puthelp "PRIVMSG $me :\037Invalid password\037 \002Usage:\002 addbot <password> <nick> <chan> \[port\] \[hand\]"
		return 0
	}
	if {[passwdok $c ""]} {
		puthelp "PRIVMSG $me :You must set a password: pass <your_new_password>"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "PRIVMSG $me :I'm not on $chan "
		return 0
	}
	set host [lindex [split [getchanhost $nick $chan] "@"] 1]
	set hostmask "*!*[getchanhost $nick $chan]"
	set hand [nick2hand $nick $chan]
	if {![onchan $nick $chan]} {
		puthelp "PRIVMSG $me :Sorry, but i don't find $nick in $chan."
		return 0
	}
	if {[strlwr $nick] == [strlwr $botnick]} {
		puthelp "PRIVMSG $me :Sorry, but i can't addbot myself."
		return 0
	}
	if {[getting-users]} {
		puthelp "PRIVMSG $me :Sorry, but i'm transferring userfile, try later."
		return 0
	}
	if {[validuser $hand]} {
		puthelp "PRIVMSG $me :$nick is already recognized with this hand: $hand"
		return 0
	} {
		if {[validuser $nick] && $alternate == ""} {
			puthelp "PRIVMSG $me :The hand $nick already exist. \002Usage:\002 addbot <password> <nick> <chan> <port> <hand>"
			return 0
		}
		if {$alternate != ""} {
			if {[validuser $alternate]} {
				puthelp "PRIVMSG $me :The hand $alternate already exist. Choose an other. \002Usage:\002 addbot <password> <nick> <chan> <port> <hand>"
				return 0
			}
			addbot $alternate $host:$port
			setuser $alternate hosts $hostmask
			puthelp "PRIVMSG $me :New bot: $alternate ($hostmask)"
			return 0
		}
		addbot $nick $host:$port
		setuser $nick hosts $hostmask
		puthelp "PRIVMSG $me :New bot: $nick ($hostmask)"
		return 0
	}
	if {$alternate != ""} {
		if {[validuser $alternate]} {
			puthelp "PRIVMSG $me :The hand $alternate already exist. \002Usage:\002 addbot <password> <nick> <chan> <port> <hand>"
			return 0
		}
		addbot $alternate $host:$port
		setuser $alternate hosts $hostmask
		puthelp "PRIVMSG $me :New bot: $alternate ($hostmask)"
		return 0
	}
	return 0
}

### addmaster <password> <nick> <chan> [hand] [f]

proc msg_lol_addmaster {me b c arg} {
	set arg [charfilter $arg]
	global botnick
	if {[llength $arg] < 3} {
		puthelp "PRIVMSG $me :\002Usage:\002 addmaster <password> <nick> <chan> \[hand\] \[f\]"
		return 0
	}
	set nick [lindex $arg 1]
	set chan [strlwr [lindex $arg 2]]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	set alternate [lindex $arg 3]
	set f [strlwr [lindex $arg 4]]
	if {![passwdok $c [lindex $arg 0]]} {
		puthelp "PRIVMSG $me :\037Invalid password\037 \002Usage:\002 addmaster <password> <nick> <chan> \[hand\] \[f\]"
		return 0
	}
	if {[passwdok $c ""]} {
		puthelp "PRIVMSG $me :You must set a password: pass <your_new_password>"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "PRIVMSG $me :I'm not on $chan "
		return 0
	}
	set hostmask "$nick![getchanhost $nick $chan]"
	set hand [nick2hand $nick $chan]
	if {![matchattr $c n|n $chan]} {
		puthelp "PRIVMSG $me :Sorry, but you are not owner in $chan."
		return 0
	}
	if {![onchan $nick $chan]} {
		puthelp "PRIVMSG $me :Sorry, but i don't find $nick in $chan."
		return 0
	}
	if {[strlwr $nick] == [strlwr $botnick]} {
		puthelp "PRIVMSG $me :Sorry, but i can't addmaster myself."
		return 0
	}
	if {[getting-users]} {
		puthelp "PRIVMSG $me :Sorry, but i'm transferring userfile, try later."
		return 0
	}
	if {$f == "f"} {
		if {![validuser $alternate]} {
			adduser $alternate [maskhost $hostmask]
			chattr $alternate +p|+m $chan
			puthelp "PRIVMSG $me :New user: $alternate ([maskhost $hostmask])"
			puthelp "PRIVMSG $me :$nick added in $chan masterlist and party-line with the hand: $alternate."
			puthelp "NOTICE $nick :You have been added in $chan masterlist and party-line by $me with the hand: $alternate."
			puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick PASS <your_password>\002"
			if {[botisop $chan]} {pushmode $chan +o $nick}
			return 0
		}
		setuser $alternate HOSTS [maskhost $hostmask]
		chattr $alternate -|+m $chan
		puthelp "PRIVMSG $me :Added hostmask for $alternate: [maskhost $hostmask]"
		puthelp "PRIVMSG $me :$nick added in $chan masterlist with the hand: $alternate."
		puthelp "NOTICE $nick :You have been added in $chan masterlist by $me with the hand: $alternate."
		if {[botisop $chan]} {pushmode $chan +o $nick}
		return 0
	}
	if {![validuser $hand]} {
		if {[validuser $nick] && $alternate == ""} {
			puthelp "PRIVMSG $me :The hand $nick already exist. \002Usage:\002 addmaster <password> <nick> <chan> <hand> \[f\]"
			return 0
		}
		if {$alternate != ""} {
			if {[validuser $alternate]} {
				puthelp "PRIVMSG $me :The hand $alternate already exist. Choose an other. \002Usage:\002 addmaster <password> <nick> <chan> <hand> \[f\]"
				return 0
			}
			adduser $alternate [maskhost $hostmask]
			chattr $alternate +p|+m $chan
			puthelp "PRIVMSG $me :New user: $alternate ([maskhost $hostmask])"
			puthelp "PRIVMSG $me :$nick added in $chan masterlist and party-line with the hand: $alternate."
			puthelp "NOTICE $nick :You have been added in $chan masterlist and party-line by $me with the hand: $alternate."
			puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick pass <your_password>\002"
			if {[botisop $chan]} {pushmode $chan +o $nick}
			return 0
		}
		adduser $nick [maskhost $hostmask]
		chattr $nick +p|+m $chan
		puthelp "PRIVMSG $me :New user: $nick ([maskhost $hostmask])"
		puthelp "PRIVMSG $me :$nick added in $chan masterlist and party-line with the hand: $nick."
		puthelp "NOTICE $nick :You have been added in $chan masterlist and party-line by $me with the hand: $nick."
		puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick pass <your_password>\002"
		if {[botisop $chan]} {pushmode $chan +o $nick}
		return 0
	}
	if {$alternate != ""} {
		if {[validuser $alternate]} {
			puthelp "PRIVMSG $me :The hand $alternate already exist. \002Usage:\002 addmaster <password> <nick> <chan> <hand> \[f\]"
			return 0
		}
		adduser $alternate [maskhost $hostmask]
		chattr $alternate +p|+m $chan
		puthelp "PRIVMSG $me :New user: $alternate ([maskhost $hostmask])"
		puthelp "PRIVMSG $me :$nick added in $chan masterlist and party-line with the hand: $alternate."
		puthelp "NOTICE $nick :You have been added in $chan masterlist and party-line by $me with the hand: $alternate."
		puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick PASS <your_password>\002"
		if {[botisop $chan]} {pushmode $chan +o $nick}
		return 0
	}
	if {[matchattr $hand -|+m $chan]} {
		puthelp "PRIVMSG $me :$nick is already master in $chan with this hand: $hand"
	} {
		chattr $hand -|+m $chan
		puthelp "PRIVMSG $me :$nick added in $chan masterlist with this hand: $hand."
		puthelp "NOTICE $nick :You have been added in $chan masterlist by $me."
	}
	if {[botisop $chan]} {pushmode $chan +o $nick}
	return 0
}

### addop <password> <nick> <chan> [hand] [f]

proc msg_lol_addop {me b c arg} {
	set arg [charfilter $arg]
	global botnick
	if {[llength $arg] < 3} {
		puthelp "PRIVMSG $me :\002Usage:\002 addop <password> <nick> <chan> \[hand\] \[f\]"
		return 0
	}
	set nick [lindex $arg 1]
	set chan [strlwr [lindex $arg 2]]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	set alternate [lindex $arg 3]
	set f [strlwr [lindex $arg 4]]
	if {![passwdok $c [lindex $arg 0]]} {
		puthelp "PRIVMSG $me :\037Invalid password\037 \002Usage:\002 addop <password> <nick> <chan> \[hand\] \[f\]"
		return 0
	}
	if {[passwdok $c ""]} {
		puthelp "PRIVMSG $me :You must set a password: pass <your_new_password>"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "PRIVMSG $me :I'm not on $chan "
		return 0
	}
	set hostmask "$nick![getchanhost $nick $chan]"
	set hand [nick2hand $nick $chan]
	if {![matchattr $c m|m $chan]} {
		puthelp "PRIVMSG $me :Sorry, but you are not master in $chan."
		return 0
	}
	if {![onchan $nick $chan]} {
		puthelp "PRIVMSG $me :Sorry, but i don't find $nick in $chan."
		return 0
	}
	if {[strlwr $nick] == [strlwr $botnick]} {
		puthelp "PRIVMSG $me :Sorry, but i can't addop myself."
		return 0
	}
	if {[getting-users]} {
		puthelp "PRIVMSG $me :Sorry, but i'm transferring userfile, try later."
		return 0
	}
	if {$f == "f"} {
		if {![validuser $alternate]} {
			adduser $alternate [maskhost $hostmask]
			chattr $alternate +p|+o $chan
			puthelp "PRIVMSG $me :New user: $alternate ([maskhost $hostmask])"
			puthelp "PRIVMSG $me :$nick added in $chan oplist and party-line with the hand: $alternate."
			puthelp "NOTICE $nick :You have been added in $chan oplist and party-line by $me with the hand: $alternate."
			puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick PASS <your_password>\002"
			if {[botisop $chan]} {pushmode $chan +o $nick}
			return 0
		}
		setuser $alternate HOSTS [maskhost $hostmask]
		chattr $alternate -|+o $chan
		puthelp "PRIVMSG $me :Added hostmask for $alternate: [maskhost $hostmask]"
		puthelp "PRIVMSG $me :$nick added in $chan oplist with the hand: $alternate."
		puthelp "NOTICE $nick :You have been added in $chan oplist by $me with the hand: $alternate."
		if {[botisop $chan]} {pushmode $chan +o $nick}
		return 0
	}
	if {![validuser $hand]} {
		if {[validuser $nick] && $alternate == ""} {
			puthelp "PRIVMSG $me :The hand $nick already exist. \002Usage:\002 addop <password> <nick> <chan> <hand> \[f\]"
			return 0
		}
		if {$alternate != ""} {
			if {[validuser $alternate]} {
				puthelp "PRIVMSG $me :The hand $alternate already exist. Choose an other. \002Usage:\002 addop <password> <nick> <chan> <hand> \[f\]"
				return 0
			}
			adduser $alternate [maskhost $hostmask]
			chattr $alternate +p|+o $chan
			puthelp "PRIVMSG $me :New user: $alternate ([maskhost $hostmask])"
			puthelp "PRIVMSG $me :$nick added in $chan oplist and party-line with the hand: $alternate."
			puthelp "NOTICE $nick :You have been added in $chan oplist and party-line by $me with the hand: $alternate."
			puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick pass <your_password>\002"
			if {[botisop $chan]} {pushmode $chan +o $nick}
			return 0
		}
		adduser $nick [maskhost $hostmask]
		chattr $nick +p|+o $chan
		puthelp "PRIVMSG $me :New user: $nick ([maskhost $hostmask])"
		puthelp "PRIVMSG $me :$nick added in $chan oplist and party-line with the hand: $nick."
		puthelp "NOTICE $nick :You have been added in $chan oplist and party-line by $me with the hand: $nick."
		puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick pass <your_password>\002"
		if {[botisop $chan]} {pushmode $chan +o $nick}
		return 0
	}
	if {$alternate != ""} {
		if {[validuser $alternate]} {
			puthelp "PRIVMSG $me :The hand $alternate already exist. \002Usage:\002 addop <password> <nick> <chan> <hand> \[f\]"
			return 0
		}
		adduser $alternate [maskhost $hostmask]
		chattr $alternate +p|+o $chan
		puthelp "PRIVMSG $me :New user: $alternate ([maskhost $hostmask])"
		puthelp "PRIVMSG $me :$nick added in $chan oplist and party-line with the hand: $alternate."
		puthelp "NOTICE $nick :You have been added in $chan oplist and party-line by $me with the hand: $alternate."
		puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick PASS <your_password>\002"
		if {[botisop $chan]} {pushmode $chan +o $nick}
		return 0
	}
	if {[matchattr $hand -|+o $chan]} {
		puthelp "PRIVMSG $me :$nick is already op in $chan with this hand: $hand"
	} {
		chattr $hand -|+o $chan
		puthelp "PRIVMSG $me :$nick added in $chan oplist with this hand: $hand."
		puthelp "NOTICE $nick :You have been added in $chan oplist by $me."
	}
	if {[botisop $chan]} {pushmode $chan +o $nick}
	return 0
}

### addvoice <password> <nick> <chan> [hand] [f]

proc msg_lol_addvoice {me b c arg} {
	set arg [charfilter $arg]
	global botnick
	if {[llength $arg] < 3} {
		puthelp "PRIVMSG $me :\002Usage:\002 addvoice <password> <nick> <chan> \[hand\] \[f\]"
		return 0
	}
	set nick [lindex $arg 1]
	set chan [strlwr [lindex $arg 2]]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	set alternate [lindex $arg 3]
	set f [strlwr [lindex $arg 4]]
	if {![passwdok $c [lindex $arg 0]]} {
		puthelp "PRIVMSG $me :\037Invalid password\037 \002Usage:\002 addvoice <password> <nick> <chan> \[hand\] \[f\]"
		return 0
	}
	if {[passwdok $c ""]} {
		puthelp "PRIVMSG $me :You must set a password: pass <your_new_password>"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "PRIVMSG $me :I'm not on $chan "
		return 0
	}
	set hostmask "$nick![getchanhost $nick $chan]"
	set hand [nick2hand $nick $chan]
	if {![matchattr $c o|o $chan]} {
		puthelp "PRIVMSG $me :Sorry, but you are not operator in $chan."
		return 0
	}
	if {![onchan $nick $chan]} {
		puthelp "PRIVMSG $me :Sorry, but i don't find $nick in $chan."
		return 0
	}
	if {[strlwr $nick] == [strlwr $botnick]} {
		puthelp "PRIVMSG $me :Sorry, but i can't addvoice myself."
		return 0
	}
	if {[getting-users]} {
		puthelp "PRIVMSG $me :Sorry, but i'm transferring userfile, try later."
		return 0
	}
	if {$f == "f"} {
		if {![validuser $alternate]} {
			adduser $alternate [maskhost $hostmask]
			chattr $alternate +p|+v $chan
			puthelp "PRIVMSG $me :New user: $alternate ([maskhost $hostmask])"
			puthelp "PRIVMSG $me :$nick added in $chan voicelist and party-line with the hand: $alternate."
			puthelp "NOTICE $nick :You have been added in $chan voicelist and party-line by $me with the hand: $alternate."
			puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick PASS <your_password>\002"
			if {[botisop $chan]} {pushmode $chan +v $nick}
			return 0
		}
		setuser $alternate HOSTS [maskhost $hostmask]
		chattr $alternate -|+v $chan
		puthelp "PRIVMSG $me :Added hostmask for $alternate: [maskhost $hostmask]"
		puthelp "PRIVMSG $me :$nick added in $chan voicelist with the hand: $alternate."
		puthelp "NOTICE $nick :You have been added in $chan voicelist by $me with the hand: $alternate."
		if {[botisop $chan]} {pushmode $chan +v $nick}
		return 0
	}
	if {![validuser $hand]} {
		if {[validuser $nick] && $alternate == ""} {
			puthelp "PRIVMSG $me :The hand $nick already exist. \002Usage:\002 addvoice <password> <nick> <chan> <hand> \[f\]"
			return 0
		}
		if {$alternate != ""} {
			if {$alternate != ""} {
				puthelp "PRIVMSG $me :The hand $alternate already exist. Choose an other. \002Usage:\002 addvoice <password> <nick> <chan> <hand> \[f\]"
				return 0
			}
			adduser $alternate [maskhost $hostmask]
			chattr $alternate +p|+v $chan
			puthelp "PRIVMSG $me :New user: $alternate ([maskhost $hostmask])"
			puthelp "PRIVMSG $me :$nick added in $chan voicelist and party-line with the hand: $alternate."
			puthelp "NOTICE $nick :You have been added in $chan voicelist and party-line by $me with the hand: $alternate."
			puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick pass <your_password>\002"
			if {[botisop $chan]} {pushmode $chan +v $nick}
			return 0
		}
		adduser $nick [maskhost $hostmask]
		chattr $nick +p|+v $chan
		puthelp "PRIVMSG $me :New user: $nick ([maskhost $hostmask])"
		puthelp "PRIVMSG $me :$nick added in $chan voicelist and party-line with the hand: $nick."
		puthelp "NOTICE $nick :You have been added in $chan voicelist and party-line by $me with the hand: $nick."
		puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick pass <your_password>\002"
		if {[botisop $chan]} {pushmode $chan +v $nick}
		return 0
	}
	if {$alternate != ""} {
		if {[validuser $alternate]} {
			puthelp "PRIVMSG $me :The hand $alternate already exist. \002Usage:\002 addvoice <password> <nick> <chan> <hand> \[f\]"
			return 0
		}
		adduser $alternate [maskhost $hostmask]
		chattr $alternate +p|+v $chan
		puthelp "PRIVMSG $me :New user: $alternate ([maskhost $hostmask])"
		puthelp "PRIVMSG $me :$nick added in $chan voicelist and party-line with the hand: $alternate."
		puthelp "NOTICE $nick :You have been added in $chan voicelist and party-line by $me with the hand: $alternate."
		puthelp "NOTICE $nick :You must set a password type: \002/msg $botnick PASS <your_password>\002"
		if {[botisop $chan]} {pushmode $chan +v $nick}
		return 0
	}
	if {[matchattr $hand -|+v $chan]} {
		puthelp "PRIVMSG $me :$nick is already voice in $chan with this hand: $hand"
	} {
		chattr $hand -|+v $chan
		puthelp "PRIVMSG $me :$nick added in $chan voicelist with this hand: $hand."
		puthelp "NOTICE $nick :You have been added in $chan voicelist by $me."
	}
	if {[botisop $chan]} {pushmode $chan +v $nick}
	return 0
}

### help

proc msg_lol_help {nick host hand arg} {
	set arg [charfilter $arg]
	if {$hand == "*"} {return 0}
	global lol
	append flags [chattr $hand]
	foreach chan [channels] {
		append flags [chattr $hand - $chan]
	}
	puthelp "PRIVMSG $nick :Msg commands of $lol(version):"
	set help ""
	if {[matchattr $hand n]} {
		append help "\002param\002 <parameter> <value>  \002enable\002 <hand>"
		append help "  "
		append help "\002disable\002 <hand>  \002deluser\002 <hand>"
		append help "  "
		append help "\002join\002 <chan> \[chanpassword\]  \002remove\002 <chan>"
		append help "  "
		append help "\002addhost\002 <hand> <host>"
		append help "  "
		append help "\002delhost\002 <hand> <host>"
		append help "  "
	}
	if {[string first n $flags] != -1} {
		append help "\002addmaster\002 <nick> <chan> \[hand\] \[f\]"
		append help "  "
	}
	puthelp "PRIVMSG $nick :$help"
	set help ""
	if {[matchattr $hand m]} {
		append help "\002msg\002 <nick|chan> <message>"
		append help "  "
	}
	if {[string first m $flags] != -1} {
		append help "\002part\002 <chan>  \002banmask\002 <mask> <chan>"
		append help "  "
		append help "\002addop\002 <nick> <chan> \[hand\] \[f\]"
		append help "  "
		append help "\002adduser\002 <nick> <chan> \[hand\]"
		append help "  "
		append help "\002addbot\002 <nick> <chan> \[port\] \[hand\]"
		append help "  "
	}
	puthelp "PRIVMSG $nick :$help"
	set help ""
	if {[string first o $flags] != -1} {
		append help "\002chattr\002 <hand> <flags> <chan>"
		append help "  "
		append help "\002broadcast\002 <text>  \002key\002 <chan>"
		append help "  "
		append help "\002addvoice\002 <nick> <chan> \[hand\] \[f\]"
		append help "  "
		append help "\002quick\002 <nick\mask> <chan> \[reason\]"
		append help "  "
		append help "\002banlist\002 <chan>  \002ban\002 <nick|mask> <chan> \[time\] \[reason\]"
		append help "  "
		append help "\002unban\002 <mask|number> <chan>"
		append help "  "
		append help "\002online\002  \002mode\002 <chan> <flags>  \002invite\002 \[chan\]  \002whois\002 <nick>"
		append help "  "
	}
	if {[string first v $flags] != -1} {
		append help "\002kick\002 <nick|mask> <chan> \[reason\]"
		append help "  "
	}
	append help "\002ident\002  \002permident\002 \[nick!user@host\]  \002seen\002 <nick|hand>"
	puthelp "PRIVMSG $nick :$help"
	puthelp "PRIVMSG $nick :All theses commands require your \002password\002 as first argument."
	*msg:help $nick $host $hand $arg
}

### invite <password> [chan]

proc msg_lol_invite {a b c arg} {
	set arg [charfilter $arg]
	if {[llength $arg] < 1} {
		puthelp "PRIVMSG $a :\002Usage:\002 invite <password> \[chan\]"
		return 0
	}
	set chan [strlwr [lindex $arg 1]]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	if {![passwdok $c [lindex $arg 0]]} {
		puthelp "PRIVMSG $a :\037Invalid password\037 \002Usage:\002 invite <password> \[chan\]"
		return 0
	}
	if {[passwdok $c ""]} {
		puthelp "PRIVMSG $a :You must set a password: pass <your_new_password>"
		return 0
	}
	if {$chan != ""} {
		if {$chan != ""} {set chan [chanaddapt $chan]}
		if {![validchan $chan]} {
			puthelp "PRIVMSG $a :I'm not on $chan "
			return 0
		}
		if {[onchan $a $chan]} {
			puthelp "PRIVMSG $a :You are already in $chan."
			return 0
		}
		set flags [lindex [getchanmode $chan] 0]
		if {[string first i $flags] == -1} {
			puthelp "PRIVMSG $a :$chan is not invite only."
			return 0
		}
		if {[matchattr $c o|o $chan]} {
			puthelp "INVITE $a $chan"
			return 0
		}
		puthelp "PRIVMSG $a :Sorry, you are not op in $chan."
		return 0
	}
	set count 0
	foreach chan [channels] {
		set flags [lindex [getchanmode $chan] 0]
		if {[string first i $flags] != -1} {
			if {![onchan $a $chan]} {
				if {[matchattr $c o|o $chan]} {
					puthelp "PRIVMSG $a :You can be invited on $chan."
					set invitchan $chan
					incr count
				}
			}
		}
	}
	if {$count == 0} {
		puthelp "PRIVMSG $a :There is no chan invite only where you can be invited."
		return 0
	} {
		puthelp "INVITE $a $invitchan"
		return 0
	}
	puthelp "PRIVMSG $a :You can be invited on $count chans, make your choice !"
	puthelp "PRIVMSG $a :\002Usage:\002 invite <password> \[chan\]"
}

### join <password> <chan> [chan pass]

proc msg_lol_join {a b c arg} {
	set arg [charfilter $arg]
	global lol botnick
	if {[llength $arg] < 2} {
		puthelp "PRIVMSG $a :\002Usage:\002 join <passsword> <chan> \[chan pass\]"
		return 0
	}
	set chan [lindex $arg 1]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	set pass [lindex $arg 2]
	if {![passwdok $c [lindex $arg 0]]} {
		puthelp "PRIVMSG $a :\037Invalid password\037 \002Usage:\002 join <password> <chan> \[chan pass\]"
		return 0
	}
	if {[passwdok $c ""]} {
		puthelp "PRIVMSG $a :You must set a password: pass <your_new_password>"
		return 0
	}
	if {[validchan $chan]} {
		puthelp "PRIVMSG $a :I'm already monitoring $chan."
		if {$pass != ""} {
			if {$lol(chankey) == 1} {
				puthelp "PRIVMSG $a :New pass set for $chan: $pass."
				channel set $chan need-key "chankey $chan $pass"
			} {
				puthelp "PRIVMSG $a :I can't memorize password to keep compatibility with getops.tcl\r"
			}
		}
		if {![onchan [strlwr $botnick] $chan]} {
			puthelp "PRIVMSG $a :I'll now try to join $chan."
			putserv "JOIN $chan $pass"
			return 0
		}
		puthelp "PRIVMSG $a :I'm already in $chan."
		return 0
	}
	puthelp "PRIVMSG $a :New chan monitoring: $chan."
	channel add $chan
	channel set $chan chanmode $lol(chanmode)
	channel set $chan flood-chan $lol(chan_flood)
	channel set $chan flood-deop $lol(deop_flood)
	channel set $chan flood-kick $lol(kick_flood)
	channel set $chan flood-join $lol(join_flood)
	channel set $chan flood-ctcp $lol(ctcp_flood)
	foreach param $lol(chan_parameters) {
		channel set $chan $param
	}
	if {$pass != ""} {
		if {$lol(chankey) == 1} {
			puthelp "PRIVMSG $a :New pass set for $chan: $pass."
			channel set $chan need-key "chankey $chan $pass"
		} {
			puthelp "PRIVMSG $a :I can't memorize password to keep compatibility with getops.tcl\r"
		}
	}
	puthelp "PRIVMSG $a :$chan is now configured.\r"
	puthelp "PRIVMSG $a :I'll now try to join $chan.\r"
	puthelp "PRIVMSG $a :Use \002.-chan\002 to remove a chan (chan userlist will be deleted)."
	putserv "JOIN $chan $pass"
}

### part <password> <chan>

proc msg_lol_part {a b c arg} {
	set arg [charfilter $arg]
	if {[llength $arg] != 2} {
		puthelp "PRIVMSG $a :\002Usage:\002 part <password> <chan>"
		return 0
	}
	set chan [lindex $arg 1]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	if {![passwdok $c [lindex $arg 0]]} {
		puthelp "PRIVMSG $a :\037Invalid password\037 \002Usage:\002 part <password> <chan>"
		return 0
	}
	if {[passwdok $c ""]} {
		puthelp "PRIVMSG $a :You must set a password: pass <your_new_password>"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "PRIVMSG $a :I'm not monitoring $chan."
		return 0
	}
	if {![matchattr $c m|m $chan]} {
		puthelp "PRIVMSG $a :Sorry, but you are not master in $chan."
		return 0
	}
	puthelp "PRIVMSG $a :I'll part $chan. \r"
	puthelp "PRIVMSG $a :To delete monitoring of this chan, use: remove <password> <chan>"
	puthelp "PART $chan"
}

### remove <password> <chan>

proc msg_lol_remove {a b c arg} {
	set arg [charfilter $arg]
	if {[llength $arg] != 2} {
		puthelp "PRIVMSG $a :\002Usage:\002 remove <password> <chan>"
		return 0
	}
	set chan [lindex $arg 1]
	if {$chan != ""} {set chan [chanaddapt $chan]}
	if {![passwdok $c [lindex $arg 0]]} {
		puthelp "PRIVMSG $a :\037Invalid password\037 \002Usage:\002 remove <password> <chan<"
		return 0
	}
	if {[passwdok $c ""]} {
		puthelp "PRIVMSG $a :You must set a password: pass <your_new_password>"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "PRIVMSG $a :I'm not monitoring $chan."
		return 0
	}
	puthelp "PRIVMSG $a :$chan and $chan's users are deleted. \r"
	channel remove $chan
}

### msg <password> <chan or nick> <message>

proc msg_lol_msg {a b c arg} {
	set arg [charfilter $arg]
	if {[llength $arg] < 3} {
		puthelp "PRIVMSG $a :\002Usage:\002 msg <password> <chan or nick> <message>"
		return 0
	}
	set chan_nick [lindex $arg 1]
	set message [lrange $arg 2 end]
	if {![passwdok $c [lindex $arg 0]]} {
		puthelp "PRIVMSG $a :\037Invalid password\037 \002Usage:\002 msg <password> <chan or nick> <message>"
		return 0
	}
	if {[passwdok $c ""]} {
		puthelp "PRIVMSG $a :You must set a password: pass <your_new_password>"
		return 0
	}
	puthelp "PRIVMSG $chan_nick :$message"
}

################# END OF MSG COMMANDS #################

################# START OF MISC #################

proc initserv {} {
	global lol botnick server lol_whois lol_mirc_kick remove_kickmirc_timer lol_bitchx_kick remove_kickbitchx_timer lol_ircii_kick remove_kickircii_timer lol_eggdrop_kick remove_kickeggdrop_timer lol_oldserver lol_newserver
	puthelp "MODE $botnick $lol(server_flags)"
# DETECT SERVER CHANGE BUT NOT SERVER DECONNECTION
#	set lol_newserver $server
#	if {[info exists lol_oldserver]} {
#		if {$lol_oldserver == $lol_newserver} {return 0}
#	}
	alldeident
	if {$lol(away) != ""} {
		utimer 20 {
			puthelp "AWAY :$lol(away)"
		}
	}
	set lol_whois ""
	set lol_mirc_kick ""
	set lol_bitchx_kick ""
	set lol_ircii_kick ""
	set lol_eggdrop_kick ""
	if {![info exist remove_kickmirc_timer]} {
		set remove_kickmirc_timer ""
	}
	if {![info exist remove_kickbitchx_timer]} {
		set remove_kickbitchx_timer ""
	}
	if {![info exist remove_kickircii_timer]} {
		set remove_kickircii_timer ""
	}
	if {![info exist remove_kickeggdrop_timer]} {
		set remove_kickeggdrop_timer ""
	}
#	set lol_oldserver $server
}

proc lol_whois {who host2 handle chan} {
	if {$handle == "*"} {return "$who is not registered in the bot."}
	if {$handle != ""} {
		set msg "\002The hand of $who is $handle.\002 "
		if {$chan != ""} {
			set chanflags [lindex [split [chattr $handle - $chan] |] 1]
			if {$chanflags == "-"} {set chanflags "no flags"}
		}
		set globalflags [lindex [split [chattr $handle - ] |] 0]
		if {$globalflags == "-"} {set globalflags "no flags"}
		if {$chan != ""} {
			append msg "He has theses flags on this chan: \002$chanflags\002 "
			append msg "and theses global flags: \002$globalflags\002. "
		} {
			append msg "He has theses global flags: \002$globalflags\002 "
		}
		if {[check $handle $who $host2]} {
			if {[string match [strlwr [getuser $handle xtra permident]] [strlwr $who!$host2]]} {
				append msg "He is \002IDENTIFIED\002 right now, with his permident mask: \002[getuser $handle xtra permident]\002. "
			} {
				append msg "He is \002IDENTIFIED\002 right now (nick used for identification: [getuser $handle xtra authnick]). "
				if {[getuser $handle xtra permident] != ""} {
					append msg "Permident mask: \002[getuser $handle xtra permident]\002. "
				} {
					append msg "No permident mask. "
				}
			}
		} {
			append msg "He is not identified right now. "
			if {[getuser $handle xtra permident] != ""} {
				append msg "Permident mask: [getuser $handle xtra permident]. "
			} {
				append msg "No permident mask. "
			}
		}
		if {[getuser $handle xtra silent] == 1} {
			append msg "Silent mode \002ENABLED\002. "
		} {
			append msg "Silent mode \002DISABLED\002. "
		}
		if {$chan != ""} {
			if {[getchaninfo $handle $chan] != ""} {
				append msg "Info line: [getchaninfo $handle $chan]. "
			} {
				append msg "No info line. "
			}
		}
		return "$msg"
	} {
		return "I don't find $who."
	}
}

proc lol_whois_reply {from signal arg} {
	global lol_whois
	set arg [charfilter $arg]
	set nick [lindex $arg 1]
	set user [lindex $arg 2]
	set ip [lindex $arg 3]
	set c [lindex [split $lol_whois ":"] 0]
	if {[strlwr $nick] != [strlwr [lindex [split $lol_whois ":"] 1]]} {
		return 0
	}
	set who $nick!$user@$ip
	set handle [finduser $who]
	if {$handle != "*"} {
		puthelp "PRIVMSG $c :[lol_whois $nick $user@$ip $handle ""]"
	} {
		puthelp "PRIVMSG $c :$who is not recognized like one of my users."
	}
	set lol_whois ""
	return 0
}

proc lol_whois_unknow {from signal arg} {
	global lol_whois
	set arg [charfilter $arg]
	set nick [lindex $arg 1]
	set c [lindex [split $lol_whois ":"] 0]
	set nick2 [lindex [split $lol_whois ":"] 1]
	if {$lol_whois != "" && [strlwr $nick] == [strlwr $nick2]} {
		puthelp "PRIVMSG $c :$nick is on IRC but i have no received informations about him."
		set lol_whois ""
	}
	return 0
}

proc lol_whois_nofound {from signal arg} {
	global lol_whois
	if {![info exists lol_whois]} {return 0}
	set arg [charfilter $arg]
	set nick [lindex $arg 1]
	set c [lindex [split $lol_whois ":"] 0]
	set nick2 [lindex [split $lol_whois ":"] 1]
	if {$lol_whois != "" && [strlwr $nick] == [strlwr $nick2]} {
		puthelp "PRIVMSG $c :$nick is not on IRC."
		set lol_whois ""
	}
	return 0
}

proc lol_seen {nick hand who chan} {
	global botnick
	if {[strlwr $who] == [strlwr $nick]} {
		return "Go look in a mirror. "
	}
	if {[strlwr $who] == [strlwr $botnick]} {
		return "You found me ! "
	}
	if {$chan != ""} {
		if {[onchan $who $chan]} {
			return "Open your eyes, $who is in THIS chan ! "
		}
		foreach user [chanlist $chan] {
			set userh [nick2hand $user $chan]
			if {[strlwr $userh] == [strlwr $who]} {
				if {[strlwr $hand] == [strlwr $who]} {
					return "$who is $user, and $user is YOU :P "
				} {
					return "$who is $user, and $user is on this chan ! "
				}
			}
		}
	} {
		if {[strlwr $hand] == [strlwr $who]} {return "$who is your hand :P "}
	}
	foreach fchan [channels] {
		if {[onchan $who $fchan]} {
			return "$who is actually on $fchan ! "
		}
		foreach user [chanlist $fchan] {
			set userh [nick2hand $user $fchan]
			if {[strlwr $userh] == [strlwr $who]} {
				return "$who is $user, and $user is on $fchan ! "
			}
		}
	}
	foreach fchan [channels] {
		if {[onchansplit $who $fchan]} {
			return "$who was in $fchan, but there was a netsplit... "
		}
	}
	if {[hand2idx $who] >= 0} {
		return "$who is actually in party-line. "
	}
	if {[validuser $who]} {
		set info [getuser $who laston]
		if {$info == ""} {
			return "$who has never been on irc. "
		}
		set time [lindex $info 0]
		set ochand [lindex $info 1]
		if {$ochand == "*"} {set ochand "party-line"}
		return "$who was in $ochand [time_diff $time] ago. "
	}
	return "Sorry, I don't know $who. "
}

proc lol_watch_mode {nick host hand chan mode who} {
	global lol botnick
	if {$mode != "+b" || ![botisop $chan] || $lol(ban_protect) == 0} {return 0}
	set victim ""
	if {[string first "!" $who] == -1 && [string first "@" $who] == -1} {set who $who!*@*}
#	if {[string first "!" $who] == -1} {set who *!*$who}
	if {[string first "@" $who] == -1} {set who $who*@*}
	foreach user [userlist] {
		foreach userhost [getuser $user HOSTS] {
			if {[string match [strlwr $who] [strlwr $userhost]] && ([matchattr $user n|n $chan] || [matchattr $user m|m $chan] || [matchattr $user o|o $chan] || [matchattr $user v|v $chan])} {
				append victim "$user "
				break
			}
		}
	}
	foreach user [chanlist $chan] {
		set userhand [nick2hand $user $chan]
		if {$userhand != "*"} {
			set userhost $user![getchanhost $user $chan]
			if {[string match [strlwr $who] [strlwr $userhost]]} {
				if {[matchattr $userhand n|n $chan] || [matchattr $userhand m|m $chan] || [matchattr $userhand o|o $chan] || [matchattr $userhand v|v $chan]} {
					if {[string first $userhand $victim] == -1} {append victim "$userhand "}
				}
			}
		}
	}
	if {[string match [strlwr $who] [strlwr "$botnick![getchanhost $botnick $chan]"]]} {
		if {![matchattr $hand m|m $chan] && !([matchattr $hand b] && [matchattr $hand o|o $chan])} {
			putserv "MODE $chan -b $who"
			puthelp "NOTICE $nick :Don't set bans that match me !"
			return 0
		} {
			append victim "$botnick"
		}
	}
	if {$victim != ""} {lol_ban_warn $nick $hand $who $chan $victim}
	return 0
}

proc lol_ban_warn {nick hand ban chan victims} {
	global lol
	if {![botisop $chan] || [strlwr $hand] == [string trimright [strlwr $victims] " "] || $lol(ban_protect) == 0} {return 0}
	if {$hand == "*"} {
		if {[string first +userbans [channel info $chan]] != -1} {
			puthelp "NOTICE $nick :Your ban match my users ! Be careful !"
			putserv "MODE $chan -b $ban"
		}
	return 0
	}
	set remove 0
	foreach user $victims {
		if {([matchattr $user m|m $chan] || [matchattr $user b]) && !([matchattr $hand m|m $chan] || ([matchattr $hand o|o $chan] && [matchattr $hand b]))} {
			set remove 1
			break
		}
		if {([matchattr $user o|o $chan] || [matchattr $user v|v $chan]) && ![matchattr $hand o|o $chan]} {
			set remove 1
			break
		}
	}
	if {$remove == 1} {putserv "MODE $chan -b $ban"}
	if {![matchattr $hand b]} {
		if {[llength $victims] > 1} {
			puthelp "NOTICE $nick :Your ban in $chan ($ban), match my users: $victims"
		} {
			puthelp "NOTICE $nick :Your ban in $chan ($ban), match one of my users: $victims"
		}
	}
	return 0
}

proc rmuser {hand idx arg} {
	boot $arg
	*dcc:-user $hand $idx [lindex $arg 0]
}

proc checksilent {hand} {
	set temp [getuser $hand xtra silent]
	if {$temp == 1} {return 1}
	return 0
}

proc check {hand nick host} {
	global lol
	if {$lol(ident) == 0} {return 1}
	if {[getuser $hand xtra auth] != "DEAD"} {
		set perm_host [getuser $hand xtra permident]
		if {[string match [strlwr $perm_host] [strlwr $nick!$host]]} {
			return 1
		}
	}
	set host [lindex [split $host "@"] 1]
	if {[getuser $hand xtra auth] == 1} {
		if {$lol(clone) == 1} {
			if {[getuser $hand xtra authhost] == $host} {
				return 1
			}
		}
		if {[getuser $hand xtra authnick] == $nick} {
			return 1
		}
	}
	return 0
}

proc chidentnick {nick host hand chan newnick} {
	global botnick
	if {$hand == "*"} {return 0}
	if {[getuser $hand xtra auth] == 1} {
		if {[getuser $hand xtra authnick] == $nick} {
			setuser $hand xtra authnick $newnick
		}
	}
}

proc kickident {nick host hand chan kick arg} {
	global botnick
	if {$kick == $botnick} {
		foreach user [chanlist $chan] {
			set find 0
			foreach ch [channels] {
				if {[onchan $user $ch] && $ch != $chan} {
					incr find
				}
			}
			set userhand [nick2hand $user $chan]
			if {$userhand != "*"} {
				if {$find == 0} {
					if {[getuser $userhand xtra auth] != "DEAD"} {
						setuser $userhand xtra auth 0
					}
					chattr $userhand -3
				}
			}
		}
	}
	return 0
}

proc partident {nick host hand chan} {
	if {$hand == "*"} {return 0}
	set find 0
	foreach ch [channels] {
		if {[onchan $nick $ch] && $ch != $chan} {set find 1}
	}
	if {$find == 0} {
		if {[getuser $hand xtra auth] != "DEAD"} {
			setuser $hand xtra auth 0
		}
		chattr $hand -3
	}
}

proc rejnident {nick host hand chan} {
	if {$hand == "*"} {return 0}
	set find 0
	foreach ch [channels] {
		if {[onchan $nick $ch] && $ch != $chan} {incr find}
	}
	if {$find == 0} {
		if {[getuser $hand xtra auth] != "DEAD"} {
			setuser $hand xtra auth 0
		}
		chattr $hand -3
	}
}

proc joinident {nick host hand chan} {
	if {$hand == "*"} {return 0}
	set find 0
	foreach ch [channels] {
		if {[onchan $nick $ch] && $ch != $chan} {incr find}
	}
	if {$find == 0} {
		if {[getuser $hand xtra auth] != "DEAD"} {
			setuser $hand xtra auth 0
		}
		chattr $hand -3
	}
}

proc alldeident {} {
	foreach user [userlist] {
		if {[getuser $user xtra auth] != "DEAD"} {
			setuser $user xtra auth 0
		}
		chattr $user -3
	}
}

proc deident {nick host hand chan reason} {
	if {$hand == "*"} {return 0}
	if {[getuser $hand xtra auth] != "DEAD"} {
		setuser $hand xtra auth 0
	}
	chattr $hand -3
}

proc strlwr {string} {
	return [string tolower $string]
}

proc chankey {chan pass} {
	putserv "JOIN $chan $pass"
}

proc chanaddapt {chan} {
	if {[string index $chan 0] != "#" && [string index $chan 0] != "&"} {
		set newchan #$chan
		return $newchan
	}
	return $chan
}

proc see_new_pass {a b c d e} {
	global lol
	if {$lol(chankey) == 0} {return 0}
	set k [lindex $e 0]
	set pass [lindex $e 1]
	if {$k == "+k"} {
		channel set $d need-key "chankey $d $pass"
	}
}

proc see_new_pass2 {a b c d e f} {
	global lol
	if {$lol(chankey) == 0} {return 0}
	set k [lindex $e 0]
	set pass [lindex $f 0]
	channel set $d need-key "chankey $d $pass"

}

proc time_diff2 {time} {
	set ltime [expr $time - [unixtime]]
	set seconds [expr $ltime % 60]
	set ltime [expr ($ltime - $seconds) / 60]
	set minutes [expr $ltime % 60]
	set ltime [expr ($ltime - $minutes) / 60]
	set hours [expr $ltime % 24]
	set days [expr ($ltime - $hours) / 24]
	set result ""
	if {$days} {
		append result "$days "
		if {$days} {
			append result "day "
		} {
			append result "days "
		}
	}
	if {$hours} {
		append result "$hours "
		if {$hours} {
			append result "hour "
		} {
			append result "hours "
		}
	}
	if {$minutes} {
		append result "$minutes "
		if {$minutes} {
			append result "minute"
		} {
			append result "minutes"
		}
	}
	if {$seconds} {
		append result " $seconds "
		if {$seconds} {
			append result "second"
		} {
			append result "seconds"
		}
	}
	return $result
}

proc time_diff {time} {
	set ltime [expr [unixtime] - $time]
	set seconds [expr $ltime % 60]
	set ltime [expr ($ltime - $seconds) / 60]
	set minutes [expr $ltime % 60]
	set ltime [expr ($ltime - $minutes) / 60]
	set hours [expr $ltime % 24]
	set days [expr ($ltime - $hours) / 24]
	set result ""
	if {$days} {
		append result "$days "
		if {$days} {
			append result "day "
		} {
			append result "days "
		}
	}
	if {$hours} {
		append result "$hours "
		if {$hours} {
			append result "hour "
		} {
			append result "hours "
		}
	}
	if {$minutes} {
		append result "$minutes "
		if {$minutes} {
			append result "minute"
		} {
			append result "minutes"
		}
	}
	if {$seconds} {
		append result " $seconds "
		if {$seconds} {
			append result "second"
		} {
			append result "seconds"
		}
	}
	return $result
}

proc number {test} {
	foreach i [split $test {}] {
		if ![string match \[0-9\] $i] {
			return 0
		}
	}
	return 1
}

# FILTRE UNE CHAINE, " ABcd efgH   " => "abcd efgh"
# RTRIM, LTRIM, LOWERCASE

proc lol_filtre {string} {
	#LTRIM
	while {[string index $string 0] == " "} {
		set string [string range $string 1 end]
	}
	#RTRIM
	set long  [string length $string]
	incr long -1
	while {[string index $string $long] == " "} {
		incr long -1
		set string [string range $string 0 $long]
	}
	# STRING TOLOWER
	set string [string tolower $string]
	return $string
}

# Char filter concept by Bass@undernet, Thanks to Jeff fisher in egg mailing-list.

proc charfilter {x {y ""} } {
	for {set i 0} {$i < [string length $x]} {incr i} {
		switch -- [string index $x $i] {
			"\"" {append y "\\\""}
			"\\" {append y "\\\\"}
			"\[" {append y "\\\["}
			"\]" {append y "\\\]"}
			"\} " {append y "\\\} "}
			"\{" {append y "\\\{"}
			default {append y [string index $x $i]}
		}
	}
	return $y
}

proc lol_idle_check {} {
	global lol botnick remove_lol_idle_check
	set remove_lol_idle_check [timer 1 lol_idle_check]
	if {$lol(idle_protect) == 0} {
		return 0
	}
	set flags "-$lol(no_idle_flags)&-$lol(no_idle_flags)"
	foreach chan [channels] {
		if {![botisop $chan]} {continue}
		if {$lol(no_idle_flags) == ""} {
			set list [strlwr [chanlist $chan]]
		} {
			set list [strlwr [chanlist $chan $flags]]
		}
		foreach nick $list {
			if {[strlwr $nick] != [strlwr $botnick] && ![isop $nick $chan] && ![isvoice $nick $chan]} {
				set idle_time [getchanidle $nick $chan]
				if {$idle_time >= $lol(kick_idle_time)} {
					set reason "Idle Kick ($lol(kick_idle_time) minutes of idle time)."
					putserv "KICK $chan $nick :$reason"
					return 0
				}
				if {$idle_time == $lol(warn_idle_time) && $lol(max_idle_time) < $lol(kick_idle_time)} {
					puthelp "PRIVMSG $nick :You are idle on $chan since $idle_time minutes, after $lol(max_idle_time) minutes of idle, you'll be banned for $lol(idle_ban_time) minutes. Part the chan or make anything !"
					return 0
				}
				if {$idle_time >= $lol(max_idle_time)} {
					set ipmask [lindex [split [maskhost $nick![getchanhost $nick $chan]] "@"] 1]
					set userm [lindex [split [getchanhost $nick $chan] "@"] 0]
					set banmask *!*$userm@$ipmask
					set reason "Banned for $lol(idle_ban_time) minutes, because of $lol(max_idle_time) minutes idle."
					newchanban $chan $banmask IdleBan $reason $lol(idle_ban_time)
					putserv "MODE $chan +b $banmask"
					putserv "KICK $chan $nick :$reason"
					return 0
				}
			}
		}
	}
	return 0
}

if {[info exists remove_lol_idle_check]} {killtimer $remove_lol_idle_check}
lol_idle_check

### END OF SCRIPT

putlog "\r"
putlog "\037>>> $lol(version), Copyright (C) 1998 LL Productions.\r"

if {$numversion <= 1029999} {
	putlog "\002>>> WARNING !!!:\r"
	putlog "\002>>> You need at least Eggdrop 1.3.0 to use correctly $lol(version) !!!\r"
}
