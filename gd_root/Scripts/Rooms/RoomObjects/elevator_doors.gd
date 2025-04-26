extends Node3D

func _ready():
	pass

func _process(_delta):
	#This needs to correspond to the computer's console body node
	if Global.current_object == "ElevatorDoorBody":
		#Must correspond to the interactables display node in the current scene
		$"../../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			if Global.next_floor == "Water Processing":
				get_tree().call_deferred("change_scene_to_file", "res://Scenes/Final Levels/underwater_floor.tscn")
			if Global.next_floor == "Electrical":
				get_tree().call_deferred("change_scene_to_file", "res://Scenes/testingLevels/fire_puzzle.tscn")
			if Global.next_floor == "Entrance":
				get_tree().call_deferred("change_scene_to_file", "res://Scenes/Final Levels/facility_enterance.tscn")
			if Global.next_floor == "First Floor":
				get_tree().call_deferred("change_scene_to_file", "res://Scenes/Final Levels/first_floor.tscn")
			if Global.next_floor == "Second Floor":
				get_tree().call_deferred("change_scene_to_file", "res://Scenes/Final Levels/second_floor.tscn")
			if Global.next_floor == "Control":
				get_tree().call_deferred("change_scene_to_file", "res://Scenes/Final Levels/control_floor.tscn")
