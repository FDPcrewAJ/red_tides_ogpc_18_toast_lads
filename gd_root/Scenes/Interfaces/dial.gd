extends Button

var has_mouse_1 = false
var has_mouse_2 = false
var has_mouse_3 = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(has_mouse_1)
	print(has_mouse_2)
	print(has_mouse_3)
	if Input.is_action_pressed("click"):
		if self.name == "Dial":
			if has_mouse_1 == true:
				global_position = get_global_mouse_position()
		elif self.name == "Dial2":
			if has_mouse_2 ==  true:
				global_position = get_global_mouse_position()
		else:
			if has_mouse_3 == true:
				global_position = get_global_mouse_position()


func _on_area_2d_1_area_entered(area: Area2D) -> void:
	has_mouse_1 = true


func _on_area_2d_2_area_entered(area: Area2D) -> void:
	has_mouse_2 = true


func _on_area_2d_3_area_entered(area: Area2D) -> void:
	has_mouse_3 = true


func _on_area_2d_1_area_exited(area: Area2D) -> void:
	has_mouse_1 = false


func _on_area_2d_2_area_exited(area: Area2D) -> void:
	has_mouse_2 = false


func _on_area_2d_3_area_exited(area: Area2D) -> void:
	has_mouse_3 = false
