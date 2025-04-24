extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.entry_position == true:
		$player.position.x = 8.544
		$player.position.y = 1.6
		$player.position.z = 0
	else:
		$player.position.x = -7.456
		$player.position.y = 1.6
		$player.position.z = 8


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
