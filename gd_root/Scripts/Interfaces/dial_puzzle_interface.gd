extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_back_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", Global.previous_scene)
