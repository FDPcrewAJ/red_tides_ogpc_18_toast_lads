extends Resource
class_name save_resource

@export var current_scene = ""
@export var player_pos = Vector3.ZERO


func save_scene(value):
	current_scene = value


func save_pos(value):
	player_pos = value
