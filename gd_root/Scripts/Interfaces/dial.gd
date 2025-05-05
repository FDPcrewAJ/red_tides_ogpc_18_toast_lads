extends Button

@onready var dial_1_sprite: Sprite2D = %Dial1Sprite
@onready var dial_2_sprite: Sprite2D = $"../Dial2/Dial2Sprite"
@onready var dial_3_sprite: Sprite2D = $"../Dial3/Dial3Sprite"



func _process(_delta):
	if button_pressed:
		match name:
			"Dial":
				dial_1_sprite._rotate()
				dial_1_sprite.selected = true
			"Dial2":
				dial_2_sprite._rotate()
				dial_2_sprite.selected = true
			"Dial3":
				dial_3_sprite._rotate()
				dial_3_sprite.selected = true
	if button_pressed == false:
		match name:
			"Dial":
				dial_1_sprite.selected = false
			"Dial2":
				dial_2_sprite.selected = false
			"Dial3":
				dial_3_sprite.selected = false
