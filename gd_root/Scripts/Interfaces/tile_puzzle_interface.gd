extends Node2D

var wrong_button = false

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _process(_delta) -> void:
	if Global.tile_puzzle_level == 1:
		if $TileButton5.on == true and $TileButton10.on == true and $TileButton15.on == true and $TileButton20.on == true and $TileButton23.on == true and $TileButton26.on == true and $TileButton29.on == true:
			if wrong_button == false:
				Global.tile_puzzle_level += 1
	elif Global.tile_puzzle_level == 2:
		if $TileButton5.on == true and $TileButton6.on == true and $TileButton15.on == true and $TileButton16.on == true and $TileButton22.on == true and $TileButton21.on == true and $TileButton31.on == true and $TileButton32.on == true:
			if wrong_button == false:
				Global.tile_puzzle_level += 1
	elif Global.tile_puzzle_level == 3:
		if $TileButton.on == true and $TileButton2.on == true and $TileButton5.on == true and $TileButton6.on == true and $TileButton9.on == true and $TileButton10.on == true and $TileButton7.on == true and $TileButton8.on == true and $TileButton31.on == true and $TileButton32.on == true and $TileButton35.on == true and $TileButton34.on == true and $TileButton33.on == true and $TileButton29.on == true:
			Global.tile_puzzle_level += 1
	else:
		if $TileButton4.on == true and $TileButton5.on == true and $TileButton11.on == true and $TileButton20.on == true and $TileButton22.on == true and $TileButton29.on == true and $TileButton32.on == true and $TileButton36.on == true:
			if wrong_button == false:
				Global.tile_puzzle_level += 1


func _wrong_button_on():
	wrong_button = true

func _wrong_button_off():
	wrong_button = false

func _on_tile_button_37_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", Global.previous_scene)

func _input(_event: InputEvent):
	if Input.is_action_pressed("exit"):
		get_tree().call_deferred("change_scene_to_file", Global.previous_scene)
