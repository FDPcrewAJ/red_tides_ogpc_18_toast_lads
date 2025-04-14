extends Node2D

var inputtedID = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	inputtedID += "1"


func _on_button_2_pressed() -> void:
	inputtedID += "2"


func _on_button_3_pressed() -> void:
	inputtedID += "3"


func _on_button_4_pressed() -> void:
	inputtedID += "4"


func _on_button_5_pressed() -> void:
	inputtedID += "5"


func _on_button_6_pressed() -> void:
	inputtedID += "6"


func _on_button_7_pressed() -> void:
	inputtedID += "7"


func _on_button_8_pressed() -> void:
	inputtedID += "8"


func _on_button_9_pressed() -> void:
	inputtedID += "9"


func _on_exit_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", Global.previous_scene)
