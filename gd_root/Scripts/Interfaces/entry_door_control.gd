extends Node2D

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_button_pressed() -> void:
	Global._set_entry_door(true)


func _on_back_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/testingLevels/entry_chamber.tscn")
