extends Node2D

signal dial_puzzle_completed

var dial_puzzle_complete = false

func _on_back_button_pressed() -> void:
	self.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if dial_puzzle_complete:
		dial_puzzle_completed.emit()
		dial_puzzle_complete = false
