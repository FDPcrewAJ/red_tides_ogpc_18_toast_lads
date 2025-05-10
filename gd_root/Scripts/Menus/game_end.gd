extends Control


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Global.music_control.playing = false


func _on_death_video_finished() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/title_screen.tscn")
