extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	Global.floor = "Water Processing"


func _on_button_2_pressed() -> void:
	Global.floor = "Electrical"


func _on_button_3_pressed() -> void:
	Global.floor = "Entrance"


func _on_button_4_pressed() -> void:
	Global.floor = "First Floor"


func _on_button_5_pressed() -> void:
	Global.floor = "Second Floor"


func _on_button_6_pressed() -> void:
	Global.floor = "Control"


func _on_exit_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/Final Levels/elevator.tscn")
