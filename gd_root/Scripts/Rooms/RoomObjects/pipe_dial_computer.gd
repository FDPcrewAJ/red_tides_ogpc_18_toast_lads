extends MeshInstance3D

func _ready():
	if typeof(Global.lastpos) != TYPE_INT:
		#You need to change the $player node referenced here to the player in the current scene
		$"../../../player"._set_last_pos()

func _process(_delta):
	#This needs to correspond to the computer's console body node
	if Global.current_object == "DialConsoleBody":
		#Must correspond to the interactables display node in the current scene
		$"../../../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact"):
			#You need to change the $player node referenced here to the player in the current scene
			Global.lastpos = $"../../../player".position
			Global.previous_scene = get_tree().current_scene.scene_file_path
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Interfaces/dial_puzzle_interface.tscn")
