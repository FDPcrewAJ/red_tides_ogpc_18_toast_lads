extends Node3D

@onready var path = $world/Path3D/PathFollow3D
@onready var second_path = $world/Path3D/PathFollow3D/Path3D/PathFollow3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	path.progress += 0.2
	second_path.progress += 0.01
