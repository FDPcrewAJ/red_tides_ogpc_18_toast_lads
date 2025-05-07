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
	if Global.current_object == "FlowCrateNoteBody":
		#Must correspond to the interactables display node in the current scene
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			#This needs to correspond to the menu prompt node in the current scene.
			menu_prompt._set_label_prompt_text("After the *incident*, any electronics stored in this room will be automatically locked away if there are ANY irregularities with water flow. \n \n -Engineering")
