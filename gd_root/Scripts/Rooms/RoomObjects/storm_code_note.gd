extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#This needs to correspond to the note's body node
	if Global.current_object == "StormCodeNoteBody":
		#Must correspond to the interactables display node in the current scene
		$"../../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			#This needs to correspond to the menu prompt node in the current scene.
			$"../../MenuPrompt"._set_label_prompt_text("This terminal can track the origin of the closest storm to help calibrate the storm defenses. Once you get the degrees from this terminal, you need to input them on another terminal by the desks. \n \n -Engineering")
