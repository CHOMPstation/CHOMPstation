/proc/ext_python(var/script, var/args, var/scriptsprefix = 1)
	if(scriptsprefix) script = "scripts/" + script
	if(world.system_type == MS_WINDOWS)
		script = replacetext(script, "/", "\\")

	var/command = config.python_path + " " + script + " " + args
	log_debug("ext_python: Sending [command] to shell")
	shell("[command]")
	return
