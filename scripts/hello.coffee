execCommand = (res, command, callback) ->
	res.send "Executting #{command}..."
	@exec = require('child_process').exec
	@exec command, (error, stdout, stderr) ->
		if error
			res.send error

		if stdout
			res.send stdout

		if stderr
			res.send stderr	

		if callback
			callback()

izotx = (res, anything, next) ->
	res.send "You say #{anything}"
	if next
		next()


module.exports = (robot) -> 
	robot.hear /izotx/i, (res) ->
	    izotx res, "Felipe1", () -> 
		    izotx res, "Felipe2", () -> 
			    izotx res, "Felipe3", () -> 
				    izotx res, "Felipe4", () -> 
				    	izotx res, "Felipe5"

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
		