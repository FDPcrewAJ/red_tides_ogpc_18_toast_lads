extends Node3D


func _process(_delta: float) -> void:
	if Global.current_object == "facility_elevator":
		$"../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.lastpos = 0
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Final Levels/elevator.tscn")
