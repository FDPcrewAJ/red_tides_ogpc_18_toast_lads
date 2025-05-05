extends Label

var time_error = false

func _process(_delta):
	if Global.time_left >= 7:
		time_error = true
	if time_error == false:
		if Global.code_degrees1 == 0 and Global.code_degrees2 == 0 and Global.code_degrees3 == 0:
			text = "Storm origin not found"
		else:
			text = ("Calibration Needed:  \n #1: " + str(Global.code_degrees1) + " degrees \n #2: " + str(Global.code_degrees2) + " degrees \n #3: " + str(Global.code_degrees3) + " degrees")
	else:
		text = "Storm is too far away.\nStorm must be less than\n7 minutes away to find\nstorm origin."
