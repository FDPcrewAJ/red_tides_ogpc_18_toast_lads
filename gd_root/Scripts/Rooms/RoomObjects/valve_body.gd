extends StaticBody3D


func _process(_delta: float) -> void:
	if Global.reactorStable == true:
		queue_free()
