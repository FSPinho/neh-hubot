module.exports = (robot) -> 
	robot.hear /izotx/i, (res) ->
	    res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"

	robot.respond /deploy project (.*) at branch (.*)/i, (res) ->
		project = res.match[1] 
		branch = res.match[1] 

		res.send "Deploying #{project} at #{branch}..."
		
		@exec = require('child_process').exec
		command = "ls -a"
		@exec command, (error, stdout, stderr) ->
			if(error != null)
				res.send error

			if(stdout != null)
				res.send stdout

			if(stderr != null)
				res.send stderr