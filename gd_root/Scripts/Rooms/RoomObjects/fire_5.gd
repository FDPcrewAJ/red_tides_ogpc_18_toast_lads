extends MeshInstance3D


func _ready():
	if Global.five_watered == true:
		queue_free()


func _on_area_3d_area_entered(_area):
	get_tree().change_scene_to_file("res://Scenes/Testing Rooms/pipe_puzzle_test.tscn")
