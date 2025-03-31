extends Button

var on = false


func _process(_delta) -> void:
	if button_pressed:
		on = true
