extends Node3D

# Player and other control
@onready var player: Player = $"../player"
@onready var interactables_display: Control = $"../InteractablesDisplay"

# Boat Parts
@onready var fuel_can: Node3D = $boat_parts/fuel_can

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if Global.current_object == "first_floor_tile_puzzle":
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.lastpos = player.position
			Global.previous_scene = "res://Scenes/Final Levels/first_floor.tscn"
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Interfaces/tile_puzzle_interface.tscn")
	
	if Global.tile_puzzle_completed:
		fuel_can.position = Vector3(-21, 0.5, 5)
