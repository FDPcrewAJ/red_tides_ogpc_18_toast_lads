extends MeshInstance3D

@onready var interactables_display: Control = $"../../../../InteractablesDisplay"
@onready var menu_prompt: Control = $"../../../../MenuPrompt"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.tutorial_completed == false:
		queue_free()
	#This needs to correspond to the note's body node
	if Global.current_object == "FlowPuzzleNoteBody":
		#Must correspond to the interactables display node in the current scene
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			#This needs to correspond to the menu prompt node in the current scene.
			menu_prompt._set_label_prompt_text("In case of an emergency, this terminal can access the pipe flow controls if the auto-pumps fail. You need to redirect the start flow to the end point by rotating the various pipes on the monitor. \n \n -Engineering")
