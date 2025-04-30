extends Label

@onready var dial_1_sprite: Sprite2D = $"../Dial/Dial1Sprite"
@onready var dial_2_sprite: Sprite2D = $"../Dial2/Dial2Sprite"
@onready var dial_3_sprite: Sprite2D = $"../Dial3/Dial3Sprite"


func _process(_delta):
	if Global.code_degrees1 == 0 and Global.code_degrees2 == 0 and Global.code_degrees3 == 0:
		text = "Storm origin not found"
	else:
		if dial_1_sprite.rotation_degrees < Global.code_degrees1 + 2 and dial_1_sprite.rotation_degrees > Global.code_degrees1 - 2:
			if dial_2_sprite.rotation_degrees < Global.code_degrees2 + 2 and dial_2_sprite.rotation_degrees > Global.code_degrees2 - 2:
				if dial_3_sprite.rotation_degrees < Global.code_degrees3 + 2 and dial_3_sprite.rotation_degrees > Global.code_degrees3 - 2:
					text = "Calibration Completed"
					Global.dial_puzzle_completed = true
		else:
			text = "Incorrect Calibration"
			Global.dial_puzzle_completed = false
