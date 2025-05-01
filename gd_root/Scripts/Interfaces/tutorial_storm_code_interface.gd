extends Node2D

@onready var player: Player = $"../../player"

func _on_back_button_pressed() -> void:
	player.has_control = true
	self.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
