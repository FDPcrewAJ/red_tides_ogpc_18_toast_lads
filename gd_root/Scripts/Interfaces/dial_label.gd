extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.name == "Dial1Label":
		text = str(int($"../Sprite2D1".rotation_degrees))
	if self.name == "Dial2Label":
		text = str(int($"../Sprite2D2".rotation_degrees))
	if self.name == "Dial3Label":
		text = str(int($"../Sprite2D3".rotation_degrees))
