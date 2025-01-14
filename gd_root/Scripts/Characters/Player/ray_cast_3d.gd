extends RayCast3D

var cur_object = "none"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_colliding() == true:
		cur_object = get_collider().get_name()
		cur_object = str(cur_object)
		Global.current_object = cur_object
	if is_colliding() == false:
		cur_object = "none"
		cur_object = str(cur_object)
		Global.current_object = cur_object
