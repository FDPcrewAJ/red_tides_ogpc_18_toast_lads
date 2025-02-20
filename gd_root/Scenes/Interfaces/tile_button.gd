extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if button_pressed == true:
		print(self)

func _toggled(bool) -> void:
	print(self)
