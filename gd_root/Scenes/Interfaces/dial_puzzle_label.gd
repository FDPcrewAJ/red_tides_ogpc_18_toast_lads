extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"../Dial/Sprite2D".rotation == 2 and $"../Dial2/Sprite2D".rotation == 3 and $"../Dial3/Sprite2D".rotation == 4:
		text = "Wow u did it congrats u are the best wow u did the puzzle wow"
