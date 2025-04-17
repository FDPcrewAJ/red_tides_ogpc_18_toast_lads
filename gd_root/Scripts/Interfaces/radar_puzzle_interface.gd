extends Node2D

var goalPositionX = RandomNumberGenerator.new().randf_range(200, 1800)
var goalPositionY = RandomNumberGenerator.new().randf_range(200, 800)
var puzzleComplete = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $RadarDot.position.x < goalPositionX + 30 and $RadarDot.position.x > goalPositionX - 30:
		if $RadarDot.position.y < goalPositionY + 30 and $RadarDot.position.y > goalPositionY - 30:
			puzzleComplete = true
		else:
			puzzleComplete = false
	else:
		puzzleComplete = false


func _on_back_button_pressed() -> void:
	if puzzleComplete == true:
		Global.radar_puzzle_completed = true
	get_tree().call_deferred("change_scene_to_file", Global.previous_scene)
