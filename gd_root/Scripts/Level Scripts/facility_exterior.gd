extends Node3D

@onready var boat = $world/boat
var boat_end_pos = -44.0

func _process(_delta):
	if boat.position.z > boat_end_pos:
		boat.translate(Vector3(0,0,-0.01 * 1))
