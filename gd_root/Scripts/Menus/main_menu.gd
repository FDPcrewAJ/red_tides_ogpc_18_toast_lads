extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Testing Rooms/dev_testing_room.tscn")


func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Testing Rooms/dev_testing_room.tscn")
