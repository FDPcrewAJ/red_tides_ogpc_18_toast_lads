extends Node2D


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _process(_delta) -> void:
	if Global.tile_puzzle_level == 1:
		if $TileButton5.on == true and $TileButton10.on == true and $TileButton15.on == true and $TileButton20.on == true and $TileButton23.on == true and $TileButton26.on == true and $TileButton29.on == true:
			if $TileButton.on == false and $TileButton2.on == false and $TileButton3.on == false and $TileButton4.on == false and $TileButton6.on == false and $TileButton7.on == false and $TileButton8.on == false and $TileButton9.on == false and $TileButton11.on == false and $TileButton12.on == false and $TileButton13.on == false and $TileButton14.on == false and $TileButton16.on == false and $TileButton17.on == false and $TileButton18.on == false and $TileButton19.on == false and $TileButton21.on == false and  $TileButton22.on == false and $TileButton24.on == false and $TileButton25.on == false and $TileButton27.on == false and $TileButton28.on == false and $TileButton30.on == false and $TileButton31.on == false and $TileButton32.on == false and $TileButton33.on == false and $TileButton34.on == false and $TileButton35.on == false and $TileButton36.on == false and $TileButton37.on == false:
				Global.tile_puzzle_level += 1
	elif Global.tile_puzzle_level == 2:
		if $TileButton5.on == true and $TileButton6.on == true and $TileButton15.on == true and $TileButton16.on == true and $TileButton22.on == true and $TileButton21.on == true and $TileButton31.on == true and $TileButton32.on == true:
			if $TileButton.on == false and $TileButton2.on == false and $TileButton3.on == false and $TileButton4.on == false and $TileButton7.on == false and $TileButton8.on == false and $TileButton9.on == false and $TileButton11.on == false and $TileButton12.on == false and $TileButton13.on == false and $TileButton14.on == false and $TileButton17.on == false and $TileButton18.on == false and $TileButton19.on == false and $TileButton20.on == false and  $TileButton23.on == false and $TileButton24.on == false and $TileButton25.on == false and $TileButton27.on == false and $TileButton28.on == false and $TileButton30.on == false and $TileButton30.on == false and $TileButton33.on == false and $TileButton34.on == false and $TileButton35.on == false and $TileButton36.on == false and $TileButton37.on == false:
				Global.tile_puzzle_level += 1
	elif Global.tile_puzzle_level == 3:
		if $TileButton.on == true and $TileButton2.on == true and $TileButton5.on == true and $TileButton6.on == true and $TileButton9.on == true and $TileButton10.on == true and $TileButton7.on == true and $TileButton8.on == true and $TileButton31.on == true and $TileButton32.on == true and $TileButton35.on == true and $TileButton34.on == true and $TileButton33.on == true and $TileButton29.on == true:
			if $TileButton3.on == false and $TileButton4.on == false and $TileButton11.on == false and $TileButton12.on == false and $TileButton13.on == false and $TileButton14.on == false and $TileButton15.on == false and $TileButton16.on == false and $TileButton17.on == false and $TileButton18.on == false and $TileButton19.on == false and $TileButton20.on == false and $TileButton21.on == false and  $TileButton22.on == false and $TileButton23.on == false and $TileButton24.on == false and $TileButton25.on == false and $TileButton26.on == false and $TileButton27.on == false and $TileButton28.on == false and $TileButton30.on == false and $TileButton34.on == false and $TileButton35.on == false and $TileButton36.on == false and $TileButton37.on == false:
				Global.tile_puzzle_level += 1
	else:
		if $TileButton4.on == true and $TileButton5.on == true and $TileButton11.on == true and $TileButton20.on == true and $TileButton22.on == true and $TileButton29.on == true and $TileButton32.on == true and $TileButton36.on == true:
			Global.tile_puzzle_level += 1


func _on_tile_button_37_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", Global.previous_scene)
