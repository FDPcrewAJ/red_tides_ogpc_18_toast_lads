extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass


func _on_area_3d_area_entered(_area) -> void:
	get_tree().change_scene_to_file("res://Scenes/Testing Rooms/2d_dev_testing_room.tscn")
