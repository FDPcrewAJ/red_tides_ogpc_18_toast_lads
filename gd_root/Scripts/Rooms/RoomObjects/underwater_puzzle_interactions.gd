extends Node3D


func _process(_delta: float) -> void:
		
		# Motor
	if Global.current_object == "motor_col":
		$"../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			$"../motor".position = Vector3(0, -10, 0)
			Global.motor_collected = true
