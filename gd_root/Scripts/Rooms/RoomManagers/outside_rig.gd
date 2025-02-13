extends Node3D

func _on_hub_portal_area_entered(area: Area3D) -> void:
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/testingLevels/entry_chamber.tscn")
