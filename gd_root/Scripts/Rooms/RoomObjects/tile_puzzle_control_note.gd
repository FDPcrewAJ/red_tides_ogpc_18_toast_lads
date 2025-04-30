extends MeshInstance3D


func _process(_delta):
	#This needs to correspond to the note's body node
	if Global.current_object == "TilePuzzleControlNoteBody":
		#Must correspond to the interactables display node in the current scene
		$"../../../../../../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			#This needs to correspond to the menu prompt node in the current scene.
			$"../../../../../../MenuPrompt"._set_label_prompt_text("This terminal calibrates the emergency storm defenses. You need to turn each dial to match the degrees of the storm origin. The storm origin can be found by a terminal in the boss's office. \n \n -Engineering")
