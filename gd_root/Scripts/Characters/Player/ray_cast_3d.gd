extends RayCast3D

var cur_object = "none"
var cur_object_parent = "none"


func _process(_delta: float) -> void:
	if is_colliding() == true:
		cur_object = get_collider().get_name()
		cur_object = str(cur_object)
		Global.current_object = cur_object
		cur_object_parent = get_collider().get_parent().get_name()
		cur_object_parent = str(cur_object_parent)
		Global.current_object_parent = cur_object_parent
	if is_colliding() == false:
		cur_object = "none"
		cur_object = str(cur_object)
		Global.current_object = cur_object
		cur_object_parent = "none"
		cur_object_parent = str(cur_object_parent)
		Global.current_object_parent = cur_object_parent
