extends Node3D

@onready var node = $player

func _on_reactor_portal_area_entered(_area):
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/testingLevels/reactor.tscn")


func _on_detection_portal_area_entered(_area):
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/testingLevels/detection.tscn")


func _on_dock_portal_area_entered(_area):
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/testingLevels/dock.tscn")


func _on_storage_portal_area_entered(_area):
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/testingLevels/storage.tscn")
