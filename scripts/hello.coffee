module.exports = (robot) -> 
	robot.hear /izotx/i, (res) ->
	    res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"


	robot.respond /deploy/i, (res) ->
    	res.reply "Me obrige!"