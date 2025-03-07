extends MeshInstance3D


func _ready() -> void:
	if Global.tile_puzzle_level == 5:
		queue_free()
