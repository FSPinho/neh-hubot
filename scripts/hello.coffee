execCommand = (res, command)
	@exec = require('child_process').exec
	@exec command, (error, stdout, stderr) ->
		if(error != null)
			res.send error

		if(stdout != null)
			res.send stdout

		if(stderr != null)
			res.send stderr	

		res.send "Deploy of #{project} at #{branch} is done!"

module.exports = (robot) -> 
	robot.hear /izotx/i, (res) ->
	    res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"

	robot.respond /deploy project (.*) at branch (.*)/i, (res) ->
		project = res.match[1] 
		branch = res.match[1] 

		if project is 'nextexithistory'
			res.send "Deploying #{project} at #{branch}..."
			
			execCommand "cd ~/izotx-next-exit-history; git checkout #{branch}"


		else
			res.send "The project #{project} is not configured!"
		