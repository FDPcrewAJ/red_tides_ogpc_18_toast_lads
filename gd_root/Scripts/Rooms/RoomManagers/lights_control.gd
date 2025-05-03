extends Node3D

var lights


func _ready() -> void:
	Global.make_lights_normal.connect(reset_lights)
	Global.make_lights_red.connect(red_lights)
	lights = self.get_children()
	Global._set_time_left(Global.time_left)


func reset_lights():
	for l in lights:
		l.light_color = Color(0.998, 0.817, 0.416)


func red_lights():
	for l in lights:
		l.light_color = Color(0.775, 0.084, 0)
