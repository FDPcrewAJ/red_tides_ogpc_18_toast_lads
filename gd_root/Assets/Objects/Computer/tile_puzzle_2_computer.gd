extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Tile Puzzle
	if Global.current_object == "second_floor_tile_puzzle":
		$"../../../../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.lastpos = $"../../../../player".position
			Global.previous_scene = "res://Scenes/Final Levels/second_floor.tscn"
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Interfaces/tile_puzzle_interface.tscn")
