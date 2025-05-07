extends Node3D


func _process(_delta: float) -> void:
	if Global.current_object == "antennas_col":
		$"../../../../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			self.position = Vector3(0, -10, 0)
			Global.antennas_collected = true
			Global.checklist_scratch.play()
	
	if Global.antennas_collected == true:
		self.position = Vector3(0, -10, 0)
