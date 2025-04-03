@tool
extends StaticBody3D

@export var execute_button: bool = false:
	set = _set_execute_button

@onready var old_water_mesh = $water_mesh

func _set_execute_button(__):
	execute_button = false
