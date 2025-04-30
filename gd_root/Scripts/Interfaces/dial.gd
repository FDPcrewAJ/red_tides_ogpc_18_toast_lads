extends Button

@onready var dial_1_sprite: Sprite2D = %Dial1Sprite
@onready var dial_2_sprite: Sprite2D = $"../Dial2/Dial2Sprite"
@onready var dial_3_sprite: Sprite2D = $"../Dial3/Dial3Sprite"



func _process(_delta):
	if button_pressed:
		match name:
			"Dial":
				dial_1_sprite._rotate()
			"Dial2":
				dial_2_sprite._rotate()
			"Dial3":
				dial_3_sprite._rotate()
