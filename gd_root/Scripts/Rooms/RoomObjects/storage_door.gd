extends CSGMesh3D


func _process(_delta: float) -> void:
	if Global.keypadPositive == true:
		queue_free()
