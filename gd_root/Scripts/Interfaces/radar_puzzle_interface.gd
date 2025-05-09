extends Node2D


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_back_button_pressed() -> void:
	if $RadarDot.puzzle_complete == true:
		Global._set_radar_puzzle(true)
	get_tree().call_deferred("change_scene_to_file", Global.previous_scene)


func _input(_event: InputEvent):
	if Input.is_action_pressed("exit"):
		if $RadarDot.puzzle_complete == true:
			Global._set_radar_puzzle(true)
		get_tree().call_deferred("change_scene_to_file", Global.previous_scene)
