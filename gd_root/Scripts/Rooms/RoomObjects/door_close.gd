extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.entry_door_open == true:
		$"../TextPopup"._set_text("")
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
