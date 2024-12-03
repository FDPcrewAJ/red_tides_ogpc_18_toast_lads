extends Control


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file(Global.previous_scene)


func _on_hub_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/testingLevels/hub.tscn")
