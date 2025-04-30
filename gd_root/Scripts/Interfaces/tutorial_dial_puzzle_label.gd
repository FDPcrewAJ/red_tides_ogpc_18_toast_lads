extends Label

@onready var dial_1_sprite: Sprite2D = $"../Dial/Dial1Sprite"
@onready var dial_2_sprite: Sprite2D = $"../Dial2/Dial2Sprite"
@onready var dial_3_sprite: Sprite2D = $"../Dial3/Dial3Sprite"
@onready var dial_puzzle_interface: Node2D = $".."

var call_once = true

func _process(_delta):
	if dial_1_sprite.rotation_degrees < 254 + 2 and dial_1_sprite.rotation_degrees > 254 - 2:
		if dial_2_sprite.rotation_degrees < 78 + 2 and dial_2_sprite.rotation_degrees > 78 - 2:
			if dial_3_sprite.rotation_degrees < 126 + 2 and dial_3_sprite.rotation_degrees > 126 - 2:
				text = "Calibration Completed"
				if call_once:
					print("called incorectly")
					dial_puzzle_interface.dial_puzzle_complete = true
					call_once = false
	else:
		text = "Incorrect Calibration"
