extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if button_pressed:
		if name == "Dial":
			$Sprite2D._rotate()
		elif name == "Dial2":
			$"../Dial2/Sprite2D"._rotate()
		else:
			$"../Dial3/Sprite2D"._rotate()
