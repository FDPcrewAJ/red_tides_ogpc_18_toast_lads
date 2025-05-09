extends Node3D


func _process(_delta: float) -> void:
	if Global.reactor_stable == true:
		queue_free()
