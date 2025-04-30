extends Node3D


func _ready() -> void:
	if Global.entry_position == true:
		$player.position.x = 8.544
		$player.position.y = 1.6
		$player.position.z = 0
	else:
		$player.position.x = -7.456
		$player.position.y = 1.6
		$player.position.z = 8
