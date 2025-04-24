extends Label


func _process(_delta):
	if Global.code_degrees1 == 0 and Global.code_degrees2 == 0 and Global.code_degrees3 == 0:
		text = "Storm origin not found"
	else:
		text = ("Calibration Needed:  \n #1: " + str(Global.code_degrees1) + " degrees. \n #2: " + str(Global.code_degrees2) + " degrees \n #3: " + str(Global.code_degrees3) + " degrees")
