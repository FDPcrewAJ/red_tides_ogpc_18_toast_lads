extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.tutorial_completed == false:
		queue_free()
	#This needs to correspond to the note's body node
	if Global.current_object == "RadarPuzzleNoteBody":
		#Must correspond to the interactables display node in the current scene
		$"../../../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			#This needs to correspond to the menu prompt node in the current scene.
			$"../../../MenuPrompt"._set_label_prompt_text("The radar systems will need to be recalibrated in the event of a system collapse. There is a certain point you must drag the radar dot onto. The closer you get to this point the radar dot will change color and beep more. \n \n -Engineering")
