extends Sprite2D

var mouse_touching = false
var goalPositionX = 0
var goalPositionY = 0
var puzzle_complete = false
var status = ""
var clicked = false


func _ready() -> void:
	goalPositionX = RandomNumberGenerator.new().randf_range(60, 1300)
	goalPositionY = RandomNumberGenerator.new().randf_range(100, 1000)
	if position.x < goalPositionX + 30 and position.x > goalPositionX - 30:
		if position.y < goalPositionY + 30 and position.y > goalPositionY - 30:
			texture = load("res://Imports/images/radarDot-removebg-preview-green.png")
			status = "green"
			if clicked == false:
				puzzle_complete = true
	else:
		if position.x < goalPositionX + 100 and position.x > goalPositionX - 100:
			if position.y < goalPositionY + 100 and position.y > goalPositionY - 100:
				texture = load("res://Imports/images/radarDot-removebg-preview-yellow.png")
				status = "yellow"
		else:
			if position.x < goalPositionX + 300 and position.x > goalPositionX - 300:
				if position.y < goalPositionY + 300 and position.y > goalPositionY - 300:
					texture = load("res://Imports/images/radarDot-removebg-preview-orange.png")
					status = "orange"
			else:
				texture = load("res://Imports/images/radarDot-removebg-preview-red.png")
				status = "red"


func _process(_delta: float) -> void:
	if position.x < goalPositionX + 30 and position.x > goalPositionX - 30:
		if position.y < goalPositionY + 30 and position.y > goalPositionY - 30:
			texture = load("res://Imports/images/radarDot-removebg-preview-green.png")
			status = "green"
			if clicked == false:
				puzzle_complete = true
	else:
		if position.x < goalPositionX + 100 and position.x > goalPositionX - 100:
			if position.y < goalPositionY + 100 and position.y > goalPositionY - 100:
				texture = load("res://Imports/images/radarDot-removebg-preview-yellow.png")
				status = "yellow"
		else:
			if position.x < goalPositionX + 300 and position.x > goalPositionX - 300:
				if position.y < goalPositionY + 300 and position.y > goalPositionY - 300:
					texture = load("res://Imports/images/radarDot-removebg-preview-orange.png")
					status = "orange"
			else:
				texture = load("res://Imports/images/radarDot-removebg-preview-red.png")
				status = "red"
	
	if Input.is_action_pressed("left_click"):
		if mouse_touching == true:
			if get_global_mouse_position().x > 60 and get_global_mouse_position().x < 1300:
				if get_global_mouse_position().y > 100 and get_global_mouse_position().y < 1000:
					position = get_global_mouse_position()
					clicked = true
	else:
		clicked = false


func _on_area_2d_mouse_entered() -> void:
	mouse_touching = true


func _on_area_2d_mouse_exited() -> void:
	mouse_touching = false
