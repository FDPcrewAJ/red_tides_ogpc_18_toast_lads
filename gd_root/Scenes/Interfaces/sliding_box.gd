extends Sprite2D

var mouse_touching = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mouse_touching == true:
		if Input.is_action_pressed("left_click"):
			if  get_global_mouse_position().x > -250 and get_global_mouse_position().x < 250:
				if get_global_mouse_position().y > -300 and get_global_mouse_position().y < 200:
					position = get_global_mouse_position()

func _on_area_2d_mouse_entered() -> void:
	mouse_touching = true


func _on_area_2d_mouse_exited() -> void:
	mouse_touching = false
