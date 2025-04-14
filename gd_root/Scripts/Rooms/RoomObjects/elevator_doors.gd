extends MeshInstance3D

func _ready():
	pass

func _process(_delta):
	#This needs to correspond to the computer's console body node
	if Global.current_object == "ElevatorDoorBody":
		#Must correspond to the interactables display node in the current scene
		$"../../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact"):
			if Global.floor == "Underwater":
				get_tree().call_deferred("change_scene_to_file", "res://Scenes/Final Levels/underwater_floor.tscn")
			if Global.floor == "Electrical":
				get_tree().call_deferred("change_scene_to_file", "res://Scenes/testingLevels/fire_puzzle.tscn")
			if Global.floor == "Hub":
				get_tree().call_deferred("change_scene_to_file", "res://Scenes/Testing Rooms/pipe_puzzle_test.tscn")
			if Global.floor == "Storage":
				get_tree().call_deferred("change_scene_to_file", "res://Scenes/testingLevels/storage_room.tscn")
			if Global.floor == "Systems":
				get_tree().call_deferred("change_scene_to_file", "res://Scenes/testingLevels/systems_room.tscn")
			if Global.floor == "Anti-Storm":
				get_tree().call_deferred("change_scene_to_file", "res://Scenes/testingLevels/anti_storm_room.tscn")
