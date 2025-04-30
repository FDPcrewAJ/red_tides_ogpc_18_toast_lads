extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#This needs to correspond to the note's body node
	if Global.current_object == "TilePuzzleNoteBody":
		#Must correspond to the interactables display node in the current scene
		$"../../../../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			#This needs to correspond to the menu prompt node in the current scene.
			$"../../../../MenuPrompt"._set_label_prompt_text("If this terminal is still in calibration mode, you need to input the correct tile pattern. There's a poster nearby that tells you what tiles you need to input depending on your level. It resets if you look away from it though, I'll probably fix that eventually. \n \n -Engineering")
