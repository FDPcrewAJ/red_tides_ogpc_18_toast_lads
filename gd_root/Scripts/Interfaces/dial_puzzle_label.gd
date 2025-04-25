extends Label


func _process(_delta):
	if Global.code_degrees1 == 0 and Global.code_degrees2 == 0 and Global.code_degrees3 == 0:
		text = "Storm origin not found"
	else:
		if $"../Dial/Sprite2D1".rotation_degrees < Global.code_degrees1 + 10 and $"../Dial/Sprite2D1".rotation_degrees > Global.code_degrees1 - 10:
			if $"../Dial2/Sprite2D2".rotation_degrees < Global.code_degrees2 + 10 and $"../Dial2/Sprite2D2".rotation_degrees > Global.code_degrees2 - 10:
				if $"../Dial3/Sprite2D3".rotation_degrees < Global.code_degrees3 + 10 and $"../Dial3/Sprite2D3".rotation_degrees > Global.code_degrees3 - 10:
					text = "Calibration Completed"
					Global.dial_puzzle_completed = true
		else:
			text = "Incorrect Calibration"
			Global.dial_puzzle_completed = false
