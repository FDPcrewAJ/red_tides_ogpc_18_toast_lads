extends Node2D


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_exit_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/Final Levels/elevator.tscn")


func _on_underwater_floor_button_pressed() -> void:
	Global.next_floor = "Water Processing"


func _on_enterance_floor_button_pressed() -> void:
	Global.next_floor = "Entrance"


func _on_floor_1_button_pressed() -> void:
	Global.next_floor = "First Floor"


func _on_floor_2_button_pressed() -> void:
	Global.next_floor = "Second Floor"


func _on_control_floor_button_pressed() -> void:
	Global.next_floor = "Control"

func _input(Input):
	if Input.is_action_pressed("exit"):
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/Final Levels/elevator.tscn")
