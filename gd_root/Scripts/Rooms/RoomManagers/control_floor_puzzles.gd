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


func _process(delta: float) -> void:
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
