extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_back_button_pressed() -> void:
	if Global.dial_puzzle_completed == true:
		Global.code_degrees1 = 0
		Global.code_degrees2 = 0
		Global.code_degrees3 = 0
		Global._set_time_left(Global.time_left + 2)
		if Global.time_left > 2:
			Global.music_control.get_stream_playback().switch_to_clip(3)
		#reset the storm
		Global.dial_puzzle_completed = false
	get_tree().call_deferred("change_scene_to_file", Global.previous_scene)
