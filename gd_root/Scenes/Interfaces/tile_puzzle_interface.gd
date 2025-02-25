extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.tile_puzzle_level == 1:
		if $TileButton5.on == true and $TileButton10.on == true and $TileButton15.on == true and $TileButton20.on == true and $TileButton23.on == true and $TileButton26.on == true and $TileButton29.on == true:
			Global.tile_puzzle_level += 1
	elif Global.tile_puzzle_level == 2:
		if $TileButton5.on == true and $TileButton6.on == true and $TileButton15.on == true and $TileButton16.on == true and $TileButton22.on == true and $TileButton21.on == true and $TileButton31.on == true and $TileButton32.on == true:
			Global.tile_puzzle_level += 1


func _on_tile_button_37_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/testingLevels/tile_puzzle.tscn")
