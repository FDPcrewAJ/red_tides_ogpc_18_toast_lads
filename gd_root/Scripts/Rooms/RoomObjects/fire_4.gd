extends MeshInstance3D


func _ready():
	if Global.four_watered == true:
		queue_free()


func _on_area_3d_area_entered(_area):
	get_tree().change_scene_to_file("res://Scenes/testingLevels/fire_puzzle.tscn")


func _on_stop_fire_fire_stopped() -> void:
	queue_free()
