extends MeshInstance3D

@onready var interactables_display: Control = $"../../InteractablesDisplay"
@onready var menu_prompt: Control = $"../../MenuPrompt"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#This needs to correspond to the note's body node
	if Global.current_object == "ReactorPuzzleNoteBody":
		#Must correspond to the interactables display node in the current scene
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			#This needs to correspond to the menu prompt node in the current scene.
			menu_prompt._set_label_prompt_text("This unit is in charge of emptying the desalination pool. It should drain it automatically if the complex is in emergency mode, but it will only do so if the water pressure is just right. It has to be exactly 100, no more, no less. You can adjust it manually with the flow pipes (the ones with the red valves), but each pipeline is different, and adds a different amount of pressure to the system. If you messed it up, you can press the yellow button to flush the system and try again. \n \n -Engineering")
