extends Sprite2D

var mouse_touching = false
var goalPositionX = 0
var goalPositionY = 0
var puzzle_complete = false


func _ready() -> void:
	goalPositionX = RandomNumberGenerator.new().randf_range(200, 1800)
	goalPositionY = RandomNumberGenerator.new().randf_range(200, 800)


func _process(_delta: float) -> void:
	if mouse_touching == true:
		if Input.is_action_pressed("left_click"):
			position = get_global_mouse_position()
	
	if position.x < goalPositionX + 30 and position.x > goalPositionX - 30:
		if position.y < goalPositionY + 30 and position.y > goalPositionY - 30:
			texture = load("res://Imports/images/radarDot-removebg-preview-green.png")
			puzzle_complete = true
	else:
		if position.x < goalPositionX + 100 and position.x > goalPositionX - 100:
			if position.y < goalPositionY + 100 and position.y > goalPositionY - 100:
				texture = load("res://Imports/images/radarDot-removebg-preview-yellow.png")
		else:
			if position.x < goalPositionX + 300 and position.x > goalPositionX - 300:
				if position.y < goalPositionY + 300 and position.y > goalPositionY - 300:
					texture = load("res://Imports/images/radarDot-removebg-preview-orange.png")
			else:
				texture = load("res://Imports/images/radarDot-removebg-preview-red.png")


func _on_area_2d_mouse_entered() -> void:
	mouse_touching = true


func _on_area_2d_mouse_exited() -> void:
	mouse_touching = false
