extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.tile_puzzle_level == 1:
		text = "Level: I"
	elif Global.tile_puzzle_level == 2:
		text = "Level: II"
	elif Global.tile_puzzle_level == 3:
		text = "Level: III"
	else:
		text = "Level: IV"
