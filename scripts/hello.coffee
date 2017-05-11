execCommand = (res, command, callback) ->
	@exec = require('child_process').exec
	@exec command, (error, stdout, stderr) ->
		if callback
			callback()
		res.send "Executting #{command}..."
		if error
			res.send error

		# if stdout
		# 	res.send stdout

		if stderr
			res.send stderr	

module.exports = (robot) -> 
	robot.respond /deploy project (.*) at branch (.*)/i, (res) ->
		project = res.match[1] 
		branch = res.match[2] 

		if project is 'nextexithistory'
			res.send "Deploying #{project} at #{branch}..."
			
			execCommand res, "cd ~/izotx-next-exit-history", () -> 
				execCommand res, "cd ~/izotx-next-exit-history ; git checkout #{branch}", () -> 
					execCommand res, "cd ~/izotx-next-exit-history ; git pull", () -> 
						execCommand res, "cd ~/izotx-next-exit-history ; source venvs/bin/activate", () -> 
							execCommand res, "cd ~/izotx-next-exit-history ; python manage.py collectstatic", () -> 
								execCommand res, "cd ~/izotx-next-exit-history/landing/static/landing", () -> 
									execCommand res, "cd ~/izotx-next-exit-history/landing/static/landing ; grunt", () -> 
										execCommand res, "sudo service apache2 restart", () -> 
											res.send "Deploy of #{project} at #{branch} is done!"
					


		else
			res.send "The project #{project} is not configured!"
		