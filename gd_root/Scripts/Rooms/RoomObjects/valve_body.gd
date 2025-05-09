extends StaticBody3D


func _process(_delta: float) -> void:
	if Global.reactor_stable == true:
		position.y = -20
