extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#This needs to correspond to the note's body node
	if Global.current_object == "TileLockerNoteBody":
		#Must correspond to the interactables display node in the current scene
		$"../../../../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			#This needs to correspond to the menu prompt node in the current scene.
			$"../../../../MenuPrompt"._set_label_prompt_text("Apparently this room gets really hot if the servers aren't properly calibrated for efficiency. I've set up an insulated container to put sensitive parts in. It'll only open when the systems here are calibrated properly, so don't yell at me if you leave your favorite mug in here. \n \n -Engineering")
