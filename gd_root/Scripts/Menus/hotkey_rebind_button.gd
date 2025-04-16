class_name HotkeyRebindButton
extends Control

@onready var key_text = $HBoxContainer/key_text as Label
@onready var button = $HBoxContainer/Button as Button

@export var action_name : String = ""

func _ready():
	set_process_unhandled_input(false)
	set_action_name()
	set_text_for_key()


func set_action_name():
	key_text.text = "unassigned"
	
	match action_name:
		"forward":
			key_text.text = "Move Forward"
		"left":
			key_text.text = "Move Left"
		"backward":
			key_text.text = "Move Backward"
		"right":
			key_text.text = "Move Right"
		"jump":
			key_text.text = "Jump"
		"sprint":
			key_text.text = "Sprint"
		"crouch":
			key_text.text = "crouch"
		"exit":
			key_text.text = "Exit/Return"
		"interact":
			key_text.text = "Interact"
		"open_list":
			key_text.text = "Toggle List"


func set_text_for_key():
	var action_events = InputMap.action_get_events(action_name)
	var action_event = action_events[0]
	var action_keycode = OS.get_keycode_string(action_event.physical_keycode)
	
	button.text = "%s" % action_keycode


func _on_button_toggled(button_pressed):
	if button_pressed:
		button.text = "Press any key..."
		set_process_unhandled_key_input(button_pressed)
		
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = false
				i.set_process_unhandled_input(false)
	else:
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = true
				i.set_process_unhandled_input(true)
		
		


func _unhandled_key_input(event):
	rebind_action_key(event)
	button.button_pressed = false


func rebind_action_key(event):
	if button.button_pressed:
		InputMap.action_erase_events(action_name)
		InputMap.action_add_event(action_name, event)
		
		set_process_unhandled_key_input(false)
		set_text_for_key()
		set_action_name()
