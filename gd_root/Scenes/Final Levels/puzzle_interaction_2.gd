extends Node3D

# Player and other control
@onready var player: Player = $"../player"
@onready var interactables_display: Control = $"../InteractablesDisplay"

# Boat Parts
@onready var antennas: Node3D = $boat_parts/inventory_test/antennas


func _ready() -> void:
	Global.list_in_hand = true


func _process(delta: float) -> void:
	pass
	# Puzzle Control
	
	# Boat Part appear once puzzle complete
	# Tile Puzzle
	
	# Antennas
	
