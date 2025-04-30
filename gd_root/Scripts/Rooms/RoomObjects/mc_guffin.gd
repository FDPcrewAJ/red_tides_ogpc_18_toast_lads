extends MeshInstance3D


func _ready():
	if Global.fire_puzzle_completed == true:
		queue_free()


func _on_area_3d_area_entered(_area):
	Global.fire_puzzle_completed = true
	queue_free()
