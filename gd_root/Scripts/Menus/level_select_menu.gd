extends Control


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file(Global.previous_scene)


func _on_hub_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/testingLevels/hub.tscn")

func _on_fire_puzzle_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/testingLevels/fire_puzzle.tscn")


func _on_outside_rig_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/testingLevels/outside_rig.tscn")

func _on_tile_puzzle_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/testingLevels/tile_puzzle.tscn")


func _on_pipe_puzzle_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Testing Rooms/pipe_puzzle_test.tscn")
