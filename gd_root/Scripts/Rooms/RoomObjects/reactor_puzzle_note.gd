extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#This needs to correspond to the note's body node
	if Global.current_object == "ReactorPuzzleNoteBody":
		#Must correspond to the interactables display node in the current scene
		$"../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			#This needs to correspond to the menu prompt node in the current scene.
			$"../MenuPrompt"._set_label_prompt_text("If the reactor gets low on coolant, you need to pump more in through the flow pipes (the ones with the red valves). The reactor needs exactly 100 units of coolant, no more no less. Unfortunately, some of the pipes bring in more coolant than others, so you'll have to try a bunch of combinations. If you put in too much, you can press the yellow button to flush the system and try again. \n \n -Engineering")
