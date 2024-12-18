extends Node3D

@onready var node = $player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_reactor_portal_area_entered(area: Area3D) -> void:
	get_tree().change_scene_to_file("res://Scenes/testingLevels/reactor.tscn")


func _on_detection_portal_area_entered(area: Area3D) -> void:
	get_tree().change_scene_to_file("res://Scenes/testingLevels/detection.tscn")


func _on_dock_portal_area_entered(area: Area3D) -> void:
	get_tree().change_scene_to_file("res://Scenes/testingLevels/dock.tscn")


func _on_storage_portal_area_entered(area: Area3D) -> void:
	get_tree().change_scene_to_file("res://Scenes/testingLevels/storage.tscn")
