execCommand = (res, command, callback) ->
	@exec = require('child_process').exec
	@exec command, (error, stdout, stderr) ->
		if(error != null)
			res.send error

		if(stdout != null)
			res.send stdout

		if(stderr != null)
			res.send stderr	

module.exports = (robot) -> 
	robot.hear /izotx/i, (res) ->
	    res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"

	robot.respond /deploy project (.*) at branch (.*)/i, (res) ->
		project = res.match[1] 
		branch = res.match[1] 

		if project is 'nextexithistory'
			res.send "Deploying #{project} at #{branch}..."
			
			execCommand res, "cd ~/izotx-next-exit-history", () -> 
				execCommand res, "git checkout #{branch}", () -> 
					res.send "Deploy of #{project} at #{branch} is done!"


		else
			res.send "The project #{project} is not configured!"
		