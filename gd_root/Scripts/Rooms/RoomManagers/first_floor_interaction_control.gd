extends Node3D

# Player and other control
@onready var player: Player = $"../player"
@onready var interactables_display: Control = $"../InteractablesDisplay"

# Boat Parts
@onready var fuel_can: Node3D = $boat_parts/inventory_test/fuel_can
@onready var battery: Node3D = $boat_parts/inventory_test/battery
@onready var radar: Node3D = $boat_parts/inventory_test/radar


func _ready() -> void:
	Global.list_in_hand = true


func _process(_delta: float) -> void:
	# Puzzle Control
	# Tile Puzzle
	if Global.current_object == "first_floor_radar_puzzle":
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.lastpos = player.position
			Global.previous_scene = "res://Scenes/Final Levels/first_floor.tscn"
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Interfaces/radar_puzzle_interface.tscn")
	
	if Global.current_object == "first_floor_flow_puzzle":
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.lastpos = player.position
			Global.previous_scene = "res://Scenes/Final Levels/first_floor.tscn"
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Interfaces/flow_puzzle_interface.tscn")
	
	
	
	# Boat Part Control
	
	# Boat Part appear once puzzle complete
	# Tile Puzzle
	
	# Boat Part Inventory and Interaction
	# Tile Puzzle / Fuel Can
	if Global.current_object == "fuel_can_col":
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			fuel_can.position = Vector3(0, -10, 0)
			Global.fuel_can_collected = true
	
	# Battery
	if Global.current_object == "battery_col":
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			battery.position = Vector3(0, -10, 0)
			Global.battery_collected = true
	
	# Radar
	if Global.current_object == "radar_col":
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			radar.position = Vector3(0, -10, 0)
			Global.radar_collected = true
