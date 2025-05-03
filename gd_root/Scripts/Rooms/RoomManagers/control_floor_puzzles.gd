extends Node3D

# Player and other control
@onready var player: Player = $"../player"
@onready var interactables_display: Control = $"../InteractablesDisplay"


func _process(_delta: float) -> void:
	# Puzzle Control
	# Tile Puzzle
	if Global.current_object == "control_floor_code":
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.lastpos = player.position
			Global.previous_scene = "res://Scenes/Final Levels/control_floor.tscn"
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Interfaces/storm_code_interface.tscn")
	
	if Global.current_object == "control_floor_dial_puzzle":
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.lastpos = player.position
			Global.previous_scene = "res://Scenes/Final Levels/control_floor.tscn"
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Interfaces/dial_puzzle_interface.tscn")
	
	# chat logs
	if Global.current_object == "lore_chatlog_01":
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.lastpos = player.position
			Global.previous_scene = "res://Scenes/Final Levels/control_floor.tscn"
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Interfaces/Lore/chatlog_interface_01.tscn")
			
	if Global.current_object == "lore_chatlog_02":
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.lastpos = player.position
			Global.previous_scene = "res://Scenes/Final Levels/control_floor.tscn"
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Interfaces/Lore/chatlog_interface_02.tscn")
			
	if Global.current_object == "lore_chatlog_03":
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.lastpos = player.position
			Global.previous_scene = "res://Scenes/Final Levels/control_floor.tscn"
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Interfaces/Lore/chatlog_interface_03.tscn")
			
	# computer logs
	if Global.current_object == "lore_logs_01":
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.lastpos = player.position
			Global.previous_scene = "res://Scenes/Final Levels/control_floor.tscn"
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Interfaces/Lore/logs_interface_01.tscn")
