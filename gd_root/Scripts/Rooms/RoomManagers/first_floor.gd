extends Node3D


func _ready() -> void:
	if typeof(Global.lastpos) != TYPE_INT:
		$player._set_last_pos()
