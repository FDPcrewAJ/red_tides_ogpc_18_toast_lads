extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#This needs to correspond to the note's body node
	if Global.current_object == "FirePuzzleNoteBody":
		#Must correspond to the interactables display node in the current scene
		$"../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			#This needs to correspond to the menu prompt node in the current scene.
			$"../MenuPrompt"._set_label_prompt_text("In order to put out a fire, you need to reach the emergency fire supression switch at the opposite end of the room. You have three terminals in the room, but each one can only put out one fire at a time. You can reroute the water to put out a new fire from the terminals whenever you want though. Yeah, this system is so scuffed. Can't belive we even have to write this. \n \n -Engineering")
