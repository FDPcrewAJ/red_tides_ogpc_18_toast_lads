extends Node3D

signal start_dial_voice_lines

# Player and other control
@onready var player: Player = $"../player"
@onready var interactables_display: Control = $"../InteractablesDisplay"

# Tutorial versions of the puzzles
@onready var storm_code_interface: Node2D = $storm_code_interface
@onready var dial_puzzle_interface: Node2D = $dial_puzzle_interface

var interaction_ready = false
var first_puzzle_interaction = true

func _ready() -> void:
	Global.list_collected = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _process(_delta: float) -> void:
	if interaction_ready:
		if Global.current_object == "control_floor_code":
			interactables_display._show_interactable()
			if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
				storm_code_interface.show()
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
		if Global.current_object == "control_floor_dial_puzzle":
			interactables_display._show_interactable()
			if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
				dial_puzzle_interface.show()
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				if first_puzzle_interaction:
					start_dial_voice_lines.emit()
					first_puzzle_interaction = false


func _on_tutorial_sequence_interaction_ready() -> void:
	interaction_ready = true
