extends Node3D

@onready var cptn_dead: Node3D = $cptn_dead


func _ready() -> void:
	var chief_dead = cptn_dead.get_child(1)
	chief_dead.play("animation")
	
	if typeof(Global.lastpos) != TYPE_INT:
		$player._set_last_pos()
