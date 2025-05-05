extends Node3D

@onready var lights = $".".get_children()

func reset_lights():
	for l in lights:
		l.light_color = Color(0.998, 0.817, 0.416)



func red_lights():
	for l in lights:
		l.light_color = Color(0.775, 0.084, 0)
