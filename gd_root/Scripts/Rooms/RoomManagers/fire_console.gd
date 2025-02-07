extends CSGMesh3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.current_object == "ConsoleBody":
		if Input.is_action_just_pressed("click"):
			Global.lastpos = $"../../../player".position
			if Global.current_object_parent == "FireConsole":
				Global.fire_console_number = 1
			if Global.current_object_parent == "FireConsole2":
				Global.fire_console_number = 2
			if Global.current_object_parent == "FireConsole3":
				Global.fire_console_number = 3
			get_tree().change_scene_to_file("res://Scenes/Interfaces/fire_control_interface.tscn")
