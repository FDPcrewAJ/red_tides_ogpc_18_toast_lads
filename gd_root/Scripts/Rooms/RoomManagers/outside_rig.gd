extends Node3D

func _on_hub_portal_area_entered(area: Area3D) -> void:
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/testingLevels/entry_chamber.tscn")


func _on_sprint_trigger_area_entered(area: Area3D) -> void:
	$TextPopup._set_text("Hold SHIFT to sprint.")
	$SprintTrigger.queue_free()


func _on_sprint_disable_trigger_area_entered(area: Area3D) -> void:
	$TextPopup._set_text("")
	$SprintDisableTrigger.queue_free()
