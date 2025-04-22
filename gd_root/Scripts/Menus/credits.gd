extends Control
@onready var credits = $"."


func _on_back_button_pressed():
	credits.visible = false
