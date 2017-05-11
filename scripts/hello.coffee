execCommand = (res, command, callback) ->
	@exec = require('child_process').exec
	@exec command, (error, stdout, stderr) ->
		if callback
			callback()

		if error
			res.send error

		if stdout
			res.send stdout

		if stderr
			res.send stderr	

		res.send "Executting #{command} Done!"

module.exports = (robot) -> 
	robot.respond /deploy project (.*) at branch (.*)/i, (res) ->
		project = res.match[1] 
		branch = res.match[2] 

		if project is 'nextexithistory'
			res.send "Deploying #{project} at #{branch}..."
			
			execCommand res, "../deploy.sh #{branch}"	


		else
			res.send "The project #{project} is not configured!"
		