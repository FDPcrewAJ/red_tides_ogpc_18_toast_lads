extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_back_button_pressed():
	self.visible = false

func _unhandled_input(_event):
	if Input.is_action_just_released("exit"):
		self.visible = false
