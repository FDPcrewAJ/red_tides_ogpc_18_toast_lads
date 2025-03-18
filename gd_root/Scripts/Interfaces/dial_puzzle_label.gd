extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ($"../Dial/Sprite2D1".rotation_degrees < -85 and $"../Dial/Sprite2D1".rotation_degrees > -95) and ($"../Dial2/Sprite2D2".rotation_degrees < -40 and $"../Dial2/Sprite2D2".rotation_degrees > -50) and ($"../Dial3/Sprite2D3".rotation_degrees < -175 and $"../Dial3/Sprite2D3".rotation_degrees > -185):
		text = "Calibration Completed"
		Global.dial_puzzle_completed = true
		Global.dial_puzzle = true
	else:
		text = "Incorrect Calibration"
		Global.dial_puzzle_completed = false
		Global.dial_puzzle = false
