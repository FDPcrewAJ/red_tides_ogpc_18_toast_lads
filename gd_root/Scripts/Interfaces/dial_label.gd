extends Label

@onready var dial_1_sprite: Sprite2D = $"../../Dial/Dial1Sprite"
@onready var dial_2_sprite: Sprite2D = $"../../Dial2/Dial2Sprite"
@onready var dial_3_sprite: Sprite2D = $"../../Dial3/Dial3Sprite"


func _process(delta: float) -> void:
	match self.name:
		"Dial1Label":
			text = str(int(dial_1_sprite.rotation_degrees))
		"Dial2Label":
			text = str(int(dial_2_sprite.rotation_degrees))
		"Dial3Label":
			text = str(int(dial_3_sprite.rotation_degrees))
