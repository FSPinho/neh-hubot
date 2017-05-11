execCommand = (res, command, callback) ->
	res.send "Executting #{command}..."
	@exec = require('child_process').exec
	@exec command, (error, stdout, stderr) ->
		if(error != null)
			res.send error

		if(stdout != null)
			res.send stdout

		if(stderr != null)
			res.send stderr	

		callback()

izotx = (res, anything) ->
	res.send "You say #{anything}"


module.exports = (robot) -> 
	robot.hear /izotx/i, (res) ->
	    izotx "Felipe"

	robot.respond /deploy project (.*) at branch (.*)/i, (res) ->
		project = res.match[1] 
		branch = res.match[2] 

		if project is 'nextexithistory'
			res.send "Deploying #{project} at #{branch}..."
			
			execCommand res, "cd ~/izotx-next-exit-history", () -> 
				execCommand res, "git checkout #{branch}", () -> 
					execCommand res, "git pull", () -> 
						execCommand res, "source venvs/bin/activate", () -> 
							res.send "Deploy of #{project} at #{branch} is done!"


		else
			res.send "The project #{project} is not configured!"
		