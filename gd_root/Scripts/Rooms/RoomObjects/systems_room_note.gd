extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.tutorial_completed == false:
		queue_free()
	#This needs to correspond to the note's body node
	if Global.current_object == "SystemsNoteBody":
		#Must correspond to the interactables display node in the current scene
		$"../../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			#This needs to correspond to the menu prompt node in the current scene.
			$"../../MenuPrompt"._set_label_prompt_text("I've made it so the door to the master terminal stays locked until all the systems are calibrated. If you want to access the master terminal room, go calibrate the other two system terminals in this room. If you get trapped in the master terminal room, try screaming. \n \n -Engineering")
