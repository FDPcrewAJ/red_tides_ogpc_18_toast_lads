extends MeshInstance3D


func _process(_delta: float) -> void:
	if Global.reactorStable == false:
		position.y = 2.655
	else:
		position.y = 0.951
