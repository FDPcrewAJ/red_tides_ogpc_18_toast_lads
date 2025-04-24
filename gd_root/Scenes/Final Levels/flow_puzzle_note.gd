extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#This needs to correspond to the note's body node
	if Global.current_object == "FlowPuzzleNoteBody":
		#Must correspond to the interactables display node in the current scene
		$"../../../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			#This needs to correspond to the menu prompt node in the current scene.
			$"../../../MenuPrompt"._set_label_prompt_text("In case of an emergency, this terminal can access the pipe flow controls if the auto-pumps fail. You need to redirect the start flow to the end point by rotating the various pipes on the monitor. \n \n -Engineering")
