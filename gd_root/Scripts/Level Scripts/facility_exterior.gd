extends Node3D

@onready var water_hitbox = $world/Water/waterCol
@onready var player = $world/boat/player

@onready var boat = $world/boat
var boat_end_pos = -44.0


func _ready() -> void:
	if Global.consistent_positioning == true:
		if typeof(Global.new_position) != TYPE_INT:
			#You need to change the $player node referenced here to the player in the current scene
			player._set_new_pos()
			Global.consistent_positioning = false

func _process(_delta):
	if boat.position.z > boat_end_pos:
		boat.translate(Vector3(0,0,-0.04 * 1))
	
	if Global.current_object == "doorCol":
		if Input.is_action_just_pressed("interact"):
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Testing Rooms/pipe_puzzle_test.tscn")


func _on_water_col_area_entered(_area):
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/Final Levels/facility_exterior.tscn")
	
