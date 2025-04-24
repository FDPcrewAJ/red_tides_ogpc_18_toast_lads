extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if typeof(Global.lastpos) != TYPE_INT:
		$player._set_last_pos()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
