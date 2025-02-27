extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/testingLevels/tile_puzzle.tscn")


func _on_dial_pressed() -> void:
	$Dial/Sprite2D._rotate()
	print($Dial/Sprite2D.rotation)


func _on_dial_2_pressed() -> void:
	$Dial2/Sprite2D._rotate()
	print($Dial2/Sprite2D.rotation)

func _on_dial_3_pressed() -> void:
	$Dial3/Sprite2D._rotate()
	print($Dial3/Sprite2D.rotation)
