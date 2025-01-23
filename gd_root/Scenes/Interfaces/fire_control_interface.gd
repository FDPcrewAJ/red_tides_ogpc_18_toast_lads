extends Node2D

var water_amount = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if Global.one_watered == false:
		if water_amount > 0:
			water_amount -= 1
			Global.one_watered = true
	else:
		water_amount += 1
		Global.one_watered = false


func _on_button_2_pressed() -> void:
	if Global.two_watered == false:
		if water_amount > 0:
			water_amount -= 1
			Global.two_watered = true
	else:
		water_amount += 1
		Global.two_watered = false


func _on_button_3_pressed() -> void:
	if Global.three_watered == false:
		if water_amount > 0:
			water_amount -= 1
			Global.three_watered = true
	else:
		water_amount += 1
		Global.three_watered = false


func _on_button_4_pressed() -> void:
	if Global.four_watered == false:
		if water_amount > 0:
			water_amount -= 1
			Global.four_watered = true
	else:
		water_amount += 1
		Global.four_watered = false


func _on_button_5_pressed() -> void:
	if Global.five_watered == false:
		if water_amount > 0:
			water_amount -= 1
			Global.five_watered = true
	else:
		water_amount += 1
		Global.five_watered = false


func _on_button_6_pressed() -> void:
	if Global.six_watered == false:
		if water_amount > 0:
			water_amount -= 1
			Global.six_watered = true
	else:
		water_amount += 1
		Global.six_watered = false


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/testingLevels/firepuzzle.tscn")
