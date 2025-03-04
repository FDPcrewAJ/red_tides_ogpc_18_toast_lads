extends MeshInstance3D

func _process(_delta):
	if Global.current_object == "ConsoleBody":
		if Input.is_action_just_pressed("click"):
			Global.lastpos = $"../player".position
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Interfaces/dial_puzzle_interface.tscn")
