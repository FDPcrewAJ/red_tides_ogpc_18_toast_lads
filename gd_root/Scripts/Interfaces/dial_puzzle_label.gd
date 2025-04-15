extends Label


func _process(_delta):
	if ($"../Dial/Sprite2D1".rotation_degrees < -85 and $"../Dial/Sprite2D1".rotation_degrees > -95) and ($"../Dial2/Sprite2D2".rotation_degrees < -35 and $"../Dial2/Sprite2D2".rotation_degrees > -55) and ($"../Dial3/Sprite2D3".rotation_degrees < -175 and $"../Dial3/Sprite2D3".rotation_degrees > -185) or Global.dial_puzzle_completed == true:
		text = "Calibration Completed"
		Global.dial_puzzle_completed = true
	else:
		text = "Incorrect Calibration"
		Global.dial_puzzle_completed = false
