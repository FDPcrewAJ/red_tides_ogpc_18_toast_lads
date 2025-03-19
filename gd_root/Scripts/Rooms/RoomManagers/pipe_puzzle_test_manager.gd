extends Node3D


func _process(_delta):
	if Global.dial_puzzle and Global.tile_puzzle and Global.fire_puzzle:
		if Global.current_object_parent == "exitDoor":
			if Input.is_action_just_pressed("interact"):
				get_tree().call_deferred("change_scene_to_file", "res://Scenes/Menus/title_screen.tscn")
	if Global.current_object_parent == "firePuzzleDoor":
		if Input.is_action_just_pressed("interact"):
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/testingLevels/fire_puzzle.tscn")
