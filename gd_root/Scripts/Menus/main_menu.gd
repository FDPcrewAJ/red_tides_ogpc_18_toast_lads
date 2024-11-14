extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Testing Rooms/dev_testing_room.tscn")


func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Testing Rooms/dev_testing_room.tscn")


func _on_settings_pressed() -> void:
	GlobalAutoload.previous_scene = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file("res://Scenes/Menus/settings.tscn")
