extends CSGMesh3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Global.current_object == "ConsoleBody":
		if Input.is_action_just_pressed("click"):
			get_tree().change_scene_to_file("res://Scenes/Interfaces/storm_repel_interface.tscn")
