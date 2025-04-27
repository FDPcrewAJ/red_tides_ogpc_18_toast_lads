extends Node3D

func _process(_delta):
	#This needs to correspond to the computer's console body node
	if Global.current_object == "ElevatorDoorBody":
		#Must correspond to the interactables display node in the current scene
		$"../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.lastpos = 0
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Final Levels/elevator.tscn")
