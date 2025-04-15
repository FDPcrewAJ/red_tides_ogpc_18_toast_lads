extends Label


func _process(_delta) -> void:
	if Global.tile_puzzle_level == 1:
		text = "Level: I"
		Global.tile_puzzle_completed = false
	elif Global.tile_puzzle_level == 2:
		text = "Level: II"
		Global.tile_puzzle_completed = false
	elif Global.tile_puzzle_level == 3:
		text = "Level: III"
		Global.tile_puzzle_completed = false
	elif Global.tile_puzzle_level == 4:
		text = "Level: IV"
		Global.tile_puzzle_completed = false
	else:
		text = "Calibration Completed!"
		Global.tile_puzzle_completed = true
