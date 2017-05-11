module.exports = (robot) -> 
	robot.hear /izotx/i, (res) ->
	    res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"

	robot.respond /deploy project (.*) at branch (.*)/i, (res) ->
		project = res.match[1] 
		branch = res.match[1] 

		res.send "Deploying #{project} at #{branch}..."

		hostname = msg.match[1]
		@exec = require('child_process').exec
		
		command = "host #{hostname}"

		msg.send "Looking up #{hostname}..."
		msg.send "This is the command #{command}."

		@exec command, (error, stdout, stderr) ->
			msg.send error
			msg.send stdout
			msg.send stderr