extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#This needs to correspond to the note's body node
	if Global.current_object == "DialPuzzleNoteBody":
		#Must correspond to the interactables display node in the current scene
		$"../../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact"):
			#This needs to correspond to the menu prompt node in the current scene.
			$"../../MenuPrompt"._set_label_prompt_text("If this terminal is still in calibration mode, you just need to turn the dials to the corresponding angles. The angles you need to turn them to are written down... somewhere around this place.  \n \n -Engineering")
