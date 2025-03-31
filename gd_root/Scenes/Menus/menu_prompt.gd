extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _set_label_prompt_text(new_text):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$PromptLabel._set_prompt_text(new_text)
	$PromptLabel.visible = true
	$CloseButton.visible = true
	$CloseButton.disabled = false
	get_tree().paused = true

func _on_close_button_pressed() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$PromptLabel.visible = false
	$CloseButton.visible = false
	$CloseButton.disabled = true
	get_tree().paused = false
