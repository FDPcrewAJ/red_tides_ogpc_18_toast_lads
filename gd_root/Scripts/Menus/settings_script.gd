extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file(Global.previous_scene)
