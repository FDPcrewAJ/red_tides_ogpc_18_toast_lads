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
		if Input.is_action_just_pressed("interact"):
			#This needs to correspond to the menu prompt node in the current scene.
			$"../MenuPrompt"._set_label_prompt_text("There are a lot of exposed wires around here, so incase things catch on fire, here's how to use the fire supression system. There are 3 terminals around the room, and each one is connected to a seperate water pipe. You can use a terminal to direct water to one of six areas, but each terminal can only access enough water to put out one fire at a time. You can change which area is being put out whenever you want though. Yeah, this system is so scuffed. Can't believe I even have to write this. \n \n -Engineering")
