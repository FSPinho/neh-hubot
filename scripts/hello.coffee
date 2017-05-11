module.exports = (robot) -> 
	robot.hear /izotx/i, (res) ->
	    res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"

	robot.respond /deploy project (.*) at branch (.*)/i, (res) ->
		project = res.match[1] 
		branch = res.match[1] 

		if project is 'nextexithistory'
			res.send "Deploying #{project} at #{branch}..."
			
			@exec = require('child_process').exec
			command = "cd ~/izotx-next-exit-history; git checkout #{branch}"
			
			@exec command, (error, stdout, stderr) ->
				if(error != null)
					res.send error

				if(stdout != null)
					res.send stdout

				if(stderr != null)
					res.send stderr

				command2 = "cd ~/izotx-next-exit-history/landing/static/landing ; grunt"
			
				@exec command2, (error, stdout, stderr) ->
					if(error != null)
						res.send error

					if(stdout != null)
						res.send stdout

					if(stderr != null)
						res.send stderr

					command3 = "cd ~/izotx-next-exit-history ; source venvs/bin/activate ; python manage.py collectstatic ; sudo service apache2 restart"
			
					@exec command3, (error, stdout, stderr) ->
						if(error != null)
							res.send error

						if(stdout != null)
							res.send stdout

						if(stderr != null)
							res.send stderr

						res.send "Deploy of #{project} at #{branch} is done!"


		else
			res.send "The project #{project} is not configured!"
		