extends Node3D


func _process(_delta: float) -> void:
	if Global.tile_puzzle_completed == true:
		queue_free()
