extends Node2D


func _on_pipe_button_pressed() -> void:
	rotation_degrees += 90
	$"..".reset_all_pipes()
