extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#This needs to correspond to the note's body node
	if Global.current_object == "EngineerLoreNoteBody":
		#Must correspond to the interactables display node in the current scene
		$"../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			#This needs to correspond to the menu prompt node in the current scene.
			$"../MenuPrompt"._set_label_prompt_text("I'm quitting. Consider this my official letter of resignation because I can't stand it here any longer. This piece of scrap is falling apart faster than I can patch it up. Moscow is barely putting enough roubles into this project to pay our wages, much less manufacture replacement parts. I didn't graduate top of my class at LIT to end up fish food, so I'm leaving before this whole rig goes under. I've left notes around on how to fix all the junk in this place, so use those instead of writing me a letter. \n \n -Head Engineer Mikhail")
