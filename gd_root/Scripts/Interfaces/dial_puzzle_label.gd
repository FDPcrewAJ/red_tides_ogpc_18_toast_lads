extends Label


func _process(_delta):
	if ($"../Dial/Sprite2D1".rotation_degrees < -85 and $"../Dial/Sprite2D1".rotation_degrees > -95) and ($"../Dial2/Sprite2D2".rotation_degrees < -40 and $"../Dial2/Sprite2D2".rotation_degrees > -50) and ($"../Dial3/Sprite2D3".rotation_degrees < -175 and $"../Dial3/Sprite2D3".rotation_degrees > -185):
		text = "Calibration Completed"
		Global.dial_puzzle_completed = true
		Global.dial_puzzle = true
	else:
		text = "Incorrect Calibration"
		Global.dial_puzzle_completed = false
		Global.dial_puzzle = false
