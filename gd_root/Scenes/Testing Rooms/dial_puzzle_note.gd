extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#This needs to correspond to the note's body node
	if Global.current_object == "DialPuzzleNoteBody":
		if Input.is_action_just_pressed("interact"):
			Global.in_menu = true
			$"../player"._set_menu_prompt_text("I AM TESTING THIS")
