extends Node3D

@onready var interactables_display: Control = $"../../../InteractablesDisplay"


func _process(_delta):
	if Global.current_object == "exit_door":
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Final Levels/facility_exterior.tscn")
	
	if Global.current_object == "facility_enterance_elevator":
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Final Levels/elevator.tscn")
