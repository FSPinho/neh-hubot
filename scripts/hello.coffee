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

module.exports = (robot) -> 
	robot.respond /deploy project (.*) at branch (.*)/i, (res) ->
		project = res.match[1] 
		branch = res.match[2] 

		if project is 'nextexithistory'
			res.send "Deploying #{project} at #{branch}..."
			
			execCommand res, "mkdir foo", () -> 
				execCommand res, "rm -r foo"
				


		else
			res.send "The project #{project} is not configured!"
		