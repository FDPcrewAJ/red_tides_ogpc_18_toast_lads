extends Node2D

func _on_back_button_pressed() -> void:
	if Global.dial_puzzle_completed == true:
		Global.code_degrees1 = 0
		Global.code_degrees2 = 0
		Global.code_degrees3 = 0
		Global.time_left += 5
		#reset the storm
		Global.dial_puzzle_completed = false
	self.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
