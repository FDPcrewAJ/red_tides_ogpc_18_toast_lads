extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_back_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", Global.previous_scene)


func _on_search_button_pressed() -> void:
	Global.code_degrees1 = int(RandomNumberGenerator.new().randf_range(10, 350))
	Global.code_degrees2 = int(RandomNumberGenerator.new().randf_range(10, 350))
	Global.code_degrees3 = int(RandomNumberGenerator.new().randf_range(10, 350))
