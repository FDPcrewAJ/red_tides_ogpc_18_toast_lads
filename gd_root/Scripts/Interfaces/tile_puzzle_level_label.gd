extends Label

var call_once = true

func _process(_delta) -> void:
	if Global.tile_puzzle_level == 1:
		text = "Level: I"
	elif Global.tile_puzzle_level == 2:
		text = "Level: II"
	elif Global.tile_puzzle_level == 3:
		text = "Level: III"
	elif Global.tile_puzzle_level == 4:
		text = "Level: IV"
	else:
		text = "Calibration Completed!"
		if call_once:
			Global.tile_puzzle_completed = true
			call_once = false
