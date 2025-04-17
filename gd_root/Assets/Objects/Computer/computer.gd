extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#This needs to correspond to the note's body node
	if Global.current_object == "StorageComputerBody":
		#Must correspond to the interactables display node in the current scene
		$"../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact"):
			#This needs to correspond to the menu prompt node in the current scene.
			Global.previous_scene = "res://Scenes/testingLevels/storage_room.tscn"
			Global.lastpos = $"../player".position
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Interfaces/storage_puzzle_interface.tscn")
