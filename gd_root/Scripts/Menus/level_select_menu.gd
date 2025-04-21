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


func _on_dial_puzzle_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/testingLevels/dial_puzzle.tscn")


func _on_facility_exterior_pressed():
	get_tree().change_scene_to_file("res://Scenes/Final Levels/facility_exterior.tscn")


func _on_underwater_floor_pressed():
	get_tree().change_scene_to_file("res://Scenes/Final Levels/underwater_floor.tscn")


func _on_facility_enterance_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Final Levels/facility_enterance.tscn")


func _on_first_floor_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Final Levels/first_floor.tscn")


func _on_second_floor_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Final Levels/second_floor.tscn")


func _on_control_floor_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Final Levels/control_floor.tscn")
