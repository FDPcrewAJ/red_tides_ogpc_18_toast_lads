extends CSGMesh3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.current_object == "StaticBody3D:<StaticBody3D#37782291843>":
		if Input.is_action_just_pressed("click"):
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/testingLevels/storage.tscn")
