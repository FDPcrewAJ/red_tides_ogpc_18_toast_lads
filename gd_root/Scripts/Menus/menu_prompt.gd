extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PromptLabel.hide()
	$CloseButton.hide()


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_released("exit"):
		if Global.in_menu == true:
			_on_close_button_pressed()

func pause():
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func unpause():
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _set_label_prompt_text(new_text):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$PromptLabel._set_prompt_text(new_text)
	$PromptLabel.show()
	$CloseButton.show()
	Global.in_menu = true
	pause()

func _on_close_button_pressed() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$PromptLabel.hide()
	$CloseButton.hide()
	Global.in_menu = false
	unpause()
