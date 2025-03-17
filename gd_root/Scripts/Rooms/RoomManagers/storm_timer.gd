extends Label

func _process(_delta):
	text = "Storm approaching in: " + str(Global.storm_time)
