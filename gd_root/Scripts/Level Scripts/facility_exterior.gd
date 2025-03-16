extends Node3D

@onready var water_hitbox = $world/Water/waterCol

@onready var boat = $world/boat
var boat_end_pos = -44.0

func _process(_delta):
	if boat.position.z > boat_end_pos:
		boat.translate(Vector3(0,0,-0.01 * 1))


func _on_water_col_area_entered(_area):
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/Final Levels/facility_exterior.tscn")
	
