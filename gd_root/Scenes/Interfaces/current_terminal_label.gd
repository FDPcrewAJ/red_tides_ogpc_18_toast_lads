extends Label


func _process(_delta: float) -> void:
	text = ("Current Terminal: " + str(Global.fire_console_number))
