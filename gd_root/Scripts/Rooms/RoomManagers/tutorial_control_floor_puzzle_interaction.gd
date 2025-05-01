extends Node3D

signal start_dial_voice_lines

# Player and other control
@onready var player: Player = $"../player"
@onready var interactables_display: Control = $"../InteractablesDisplay"

# Tutorial versions of the puzzles
@onready var storm_code_interface: Node2D = $storm_code_interface
@onready var dial_puzzle_interface: Node2D = $dial_puzzle_interface
@onready var checklist_pick_up: StaticBody3D = $"../tutorial_sequence/fire_container/checklist_pick_up"

var interaction_ready = false
var first_puzzle_interaction = true

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _process(_delta: float) -> void:
	if interaction_ready:
		match Global.current_object:
			"control_floor_code":
				interactables_display._show_interactable()
				if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
					storm_code_interface.show()
					Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
					player.has_control = false
			"control_floor_dial_puzzle":
				interactables_display._show_interactable()
				if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
					dial_puzzle_interface.show()
					Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
					player.has_control = false
					if first_puzzle_interaction:
						start_dial_voice_lines.emit()
						first_puzzle_interaction = false
			"checklist_pick_up":
				interactables_display._show_interactable()
				if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
					checklist_pick_up.position.y = -10
					Global.list_collected = true


func _on_tutorial_sequence_interaction_ready() -> void:
	interaction_ready = true
