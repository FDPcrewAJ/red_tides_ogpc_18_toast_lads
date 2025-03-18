extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.fire_puzzle == true:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_area_entered(area: Area3D) -> void:
	Global.fire_puzzle = true
	queue_free()
