extends Node3D

func _ready():
	if typeof(Global.lastpos) != TYPE_INT:
		$player._set_last_pos()

func _process(_delta):
	if Global.current_object_parent == "entryDoor":
		#Must correspond to the interactables display node in the current scene
		$"../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact"):
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Testing Rooms/pipe_puzzle_test.tscn")
