extends Node3D


func _ready() -> void:
	if typeof(Global.lastpos) != TYPE_INT:
		$player._set_last_pos()


func _process(delta: float) -> void:
	if typeof(Global.lastpos) != TYPE_INT:
		$player._set_last_pos()
	
	# Switch to Fire Puzzle Room
	if Global.current_object == "doorCol":
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.next_floor = "Hub"
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/testingLevels/fire_puzzle.tscn")
