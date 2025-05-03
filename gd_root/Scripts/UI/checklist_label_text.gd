extends Label

var label_text


func _process(_delta: float) -> void:
	update_text()


func update_text():
	var event_array = InputMap.action_get_events("open_list")
	var event = event_array[0]
	var interact_key = OS.get_keycode_string(event.physical_keycode)
	match self.name:
		"open_list_label":
			label_text = "Press " + str(interact_key) + " to open checklist"
		"close_list_label":
			label_text = "Press " + str(interact_key) + " to close checklist"
	self.text = label_text
