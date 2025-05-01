extends MeshInstance3D


func _process(_delta):
	#This needs to correspond to the note's body node
	if Global.current_object == "StormCodeNoteBody":
		#Must correspond to the interactables display node in the current scene
		$"../../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			#This needs to correspond to the menu prompt node in the current scene.
			$"../../MenuPrompt"._set_label_prompt_text("This terminal finds the coordinates of incoming storms. Once you have found a storm origin, match the degrees found to the dials in the other terminal on the desk outside this room. \n \n -Captain")
