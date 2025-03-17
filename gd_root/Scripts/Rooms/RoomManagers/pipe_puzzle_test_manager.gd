extends Node3D

var dial_puzzle = false
var tile_puzzle = false
var fire_puzzle = false


func _ready():
	dial_puzzle = true
	tile_puzzle = true
	fire_puzzle = true


func _process(_delta):
	if dial_puzzle and tile_puzzle and fire_puzzle:
		if Global.current_object == "doorCol":
			if Input.is_action_just_pressed("interact"):
				get_tree().call_deferred("change_scene_to_file", "res://Scenes/Menus/title_screen.tscn")
