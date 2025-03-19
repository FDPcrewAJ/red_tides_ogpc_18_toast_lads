extends Button


func _process(_delta):
	if button_pressed:
		if name == "Dial":
			$Sprite2D1._rotate()
		elif name == "Dial2":
			$"../Dial2/Sprite2D2"._rotate()
		else:
			$"../Dial3/Sprite2D3"._rotate()
