/proc/send2irc(var/msg, var/admin = 0)
    if(config.use_irc_bot)
        paranoid_sanitize(msg)
        if(admin)
            msg = "ADMIN - [msg]"
        // 3rd param is unused in the bot, would spend time to fix this but I'm lazy. - Jon
        ext_python("ircbot_message.py", "[config.comms_password] [config.irc_bot_host] null [msg]")
    return

/proc/send2mainirc(var/msg)
    send2irc(msg)
    return

/proc/send2adminirc(var/msg)
    send2irc(msg, 1)
    return

/hook/startup/proc/ircNotify()
    send2mainirc("Server starting up on [config.server? "byond://[config.server]" : "byond://[world.address]:[world.port]"]")
    return 1
