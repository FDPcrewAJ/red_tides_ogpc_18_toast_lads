extends Node3D


func _process(_delta):
	if Global.dial_puzzle and Global.tile_puzzle and Global.fire_puzzle:
		if Global.current_object_parent == "exitDoor":
			#Must correspond to the interactables display node$"." in the current scene
			$"../InteractablesDisplay"._show_interactable()
			if Input.is_action_just_pressed("interact"):
				get_tree().call_deferred("change_scene_to_file", "res://Scenes/Menus/title_screen.tscn")
	if Global.current_object_parent == "firePuzzleDoor":
		#Must correspond to the interactables display node in the current scene
		$"../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact"):
			#Set lastpos to 0 before loading a new room
			Global.lastpos = 0
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/testingLevels/fire_puzzle.tscn")
