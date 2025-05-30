extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Global.fire_console_number == 1:
		Global.water_amount = Global.fire_console_one_water
	if Global.fire_console_number == 2:
		Global.water_amount = Global.fire_console_two_water
	if Global.fire_console_number == 3:
		Global.water_amount = Global.fire_console_three_water


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.fire_console_number == 1:
		if Global.water_amount == 0:
			Global.fire_console_one_water = 0
		if Global.water_amount == 1:
			Global.fire_console_one_water = 1
	if Global.fire_console_number == 2:
		if Global.water_amount == 0:
			Global.fire_console_two_water = 0
		if Global.water_amount == 1:
			Global.fire_console_two_water = 1
	if Global.fire_console_number == 3:
		if Global.water_amount == 0:
			Global.fire_console_three_water = 0
		if Global.water_amount == 1:
			Global.fire_console_three_water = 1


func _on_button_pressed() -> void:
	if Global.one_watered == false:
		if Global.water_amount > 0:
			Global.water_amount -= 1
			Global.one_watered = true
			Global.one_fire_acess = Global.fire_console_number
	else:
		if Global.one_fire_acess == Global.fire_console_number:
			Global.water_amount += 1
			Global.one_watered = false


func _on_button_2_pressed() -> void:
	if Global.two_watered == false:
		if Global.water_amount > 0:
			Global.water_amount -= 1
			Global.two_watered = true
			Global.two_fire_acess = Global.fire_console_number
	else:
		if Global.two_fire_acess == Global.fire_console_number:
			Global.water_amount += 1
			Global.two_watered = false


func _on_button_3_pressed() -> void:
	if Global.three_watered == false:
		if Global.water_amount > 0:
			Global.water_amount -= 1
			Global.three_watered = true
			Global.three_fire_acess = Global.fire_console_number
	else:
		if Global.three_fire_acess == Global.fire_console_number:
			Global.water_amount += 1
			Global.three_watered = false


func _on_button_4_pressed() -> void:
	if Global.four_watered == false:
		if Global.water_amount > 0:
			Global.water_amount -= 1
			Global.four_watered = true
			Global.four_fire_acess = Global.fire_console_number
	else:
		if Global.four_fire_acess == Global.fire_console_number:
			Global.water_amount += 1
			Global.four_watered = false


func _on_button_5_pressed() -> void:
	if Global.five_watered == false:
		if Global.water_amount > 0:
			Global.water_amount -= 1
			Global.five_watered = true
			Global.five_fire_acess = Global.fire_console_number
	else:
		if Global.five_fire_acess == Global.fire_console_number:
			Global.water_amount += 1
			Global.five_watered = false


func _on_button_6_pressed() -> void:
	if Global.six_watered == false:
		if Global.water_amount > 0:
			Global.water_amount -= 1
			Global.six_watered = true
			Global.six_fire_acess = Global.fire_console_number
	else:
		if Global.six_fire_acess == Global.fire_console_number:
			Global.water_amount += 1
			Global.six_watered = false


func _on_back_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/testingLevels/fire_puzzle.tscn")

func _input(_event: InputEvent):
	if Input.is_action_pressed("exit"):
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/testingLevels/fire_puzzle.tscn")
