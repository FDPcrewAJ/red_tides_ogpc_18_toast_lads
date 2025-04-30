extends Node3D

@onready var player: Player = $"../../player"
@onready var camera_container: Node3D = $"../camera_container"


func reset_player():
	player.position.x = camera_container.position.x
	player.position.z = camera_container.position.z


func _on_fire_area_entered(_area: Area3D) -> void:
	reset_player()


func _on_fire_2_area_entered(_area: Area3D) -> void:
	reset_player()


func _on_fire_5_area_entered(_area: Area3D) -> void:
	reset_player()


func _on_fire_3_area_entered(_area: Area3D) -> void:
	reset_player()


func _on_fire_4_area_entered(_area: Area3D) -> void:
	reset_player()
