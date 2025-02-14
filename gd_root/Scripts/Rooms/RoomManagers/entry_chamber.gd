extends Node3D

func _ready():
	if typeof(Global.lastpos) != TYPE_INT:
		$player._set_last_pos()


func _on_area_3d_area_entered(area: Area3D) -> void:
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/testingLevels/hub.tscn")
