extends Sprite2D

var mouse_offset_x = 0
var mouse_offset_y = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_offset_x = get_global_mouse_position().x
	
func _rotate():
	rotation_degrees += (mouse_offset_x - get_global_mouse_position().x) / 2
	print(rotation_degrees)
	
