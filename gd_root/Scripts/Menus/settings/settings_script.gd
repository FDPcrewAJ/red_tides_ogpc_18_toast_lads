extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func close_settings_menu():
	self.visible = false
	SignalBus.emit_set_settings_dictionary(SettingsContainer.create_storage_dictionary())

func _on_back_button_pressed():
	close_settings_menu()

func _unhandled_input(_event):
	if Input.is_action_just_released("exit"):
		close_settings_menu()
