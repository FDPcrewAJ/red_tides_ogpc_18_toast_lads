extends Node3D

func _ready():
	if typeof(Global.lastpos) != TYPE_INT:
		$"../player"._set_last_pos()

func _process(_delta):
	pass
