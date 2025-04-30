extends Sprite2D

var mouse_offset_x = 0
var mouse_offset_y = 0
	
func _rotate():
	rotate(get_angle_to(get_global_mouse_position()))
	
	if rotation_degrees < 0:
		rotation_degrees = 0
	if rotation_degrees > 360:
		rotation_degrees = 0
	
