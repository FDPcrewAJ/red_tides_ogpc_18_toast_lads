extends Node2D

@onready var player: Player = $"../../player"

signal dial_puzzle_completed

var dial_puzzle_complete = false

func _on_back_button_pressed() -> void:
	close_menu()


func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("exit"):
		close_menu()


func close_menu():
	player.has_control = true
	self.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if dial_puzzle_complete:
		dial_puzzle_completed.emit()
		dial_puzzle_complete = false
		player.has_control = false
