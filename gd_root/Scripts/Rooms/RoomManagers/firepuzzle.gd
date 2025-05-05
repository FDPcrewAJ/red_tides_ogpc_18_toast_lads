extends Node3D

@onready var lights: Node3D = $"../lights"


func _ready():
	lights.red_lights()
	if typeof(Global.lastpos) != TYPE_INT:
		$"../player"._set_last_pos()
