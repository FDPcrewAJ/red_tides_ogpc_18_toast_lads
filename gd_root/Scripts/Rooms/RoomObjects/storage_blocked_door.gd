extends MeshInstance3D


func _process(_delta: float) -> void:
	if Global.keypad_positive == true:
		queue_free()
