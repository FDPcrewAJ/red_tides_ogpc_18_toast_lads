extends Node3D

func _on_hub_portal_area_entered(_area):
	get_tree().change_scene_to_file("res://Scenes/testingLevels/hub.tscn")
