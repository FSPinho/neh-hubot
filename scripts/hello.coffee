module.exports = (robot) -> 
	robot.hear /izotx/i, (res) ->
	    res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"


	robot.respond /deploy project (.*) at branch (.*)/i, (res) ->
		priject = res.match[1] 
		branch = res.match[1] 
    	
    	res.reply "Deploying #{branch} at #{branch}..."