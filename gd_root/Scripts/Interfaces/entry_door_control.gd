extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	Global.entry_door_open = true


func _on_back_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/testingLevels/entry_chamber.tscn")
