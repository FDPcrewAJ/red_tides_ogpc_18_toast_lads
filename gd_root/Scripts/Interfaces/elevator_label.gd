extends Label


func _process(_delta: float) -> void:
	text = "Your floor is: " + Global.next_floor
