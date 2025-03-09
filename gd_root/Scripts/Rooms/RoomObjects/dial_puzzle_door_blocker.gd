extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.dial_puzzle_completed == true:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
