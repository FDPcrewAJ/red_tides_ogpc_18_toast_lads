extends MeshInstance3D

func _process(_delta):
	if Global.current_object == "EntryConsole":
		if Input.is_action_just_pressed("interact"):
			Global.lastpos = $"../player".position
			get_tree().change_scene_to_file("res://Scenes/Interfaces/entry_door_control.tscn")
