@tool
extends StaticBody3D

@export var gen_water = false

@onready var water_mesh = $water_mesh

func _physics_process(_delta):
	if Input.is_action_just_pressed("jump"):
		gen_water = true
		generate_water()
		gen_water = false

func generate_water():
	pass
