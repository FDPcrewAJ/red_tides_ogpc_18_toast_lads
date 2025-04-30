extends MeshInstance3D


func _process(_delta: float) -> void:
	if Global.radar_puzzle_completed == true:
		queue_free()
