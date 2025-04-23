extends Node3D

@onready var player = $player
@onready var boat = $world/boat
@onready var intro_camera = $intro_camera
@onready var intro_objects: Node3D = $world/boat/intro_objects

var boat_end_pos = -44.0
var end_intro = true

var boat_repair_mode = false

# Boat Parts 
@onready var antennas: Node3D = $world/boat/boat_parts/antennas
@onready var radar: Node3D = $world/boat/boat_parts/radar
@onready var motor: CSGMesh3D = $world/boat/boat_parts/motor
@onready var battery: MeshInstance3D = $world/boat/boat_parts/battery
@onready var fuel_can: CSGMesh3D = $world/boat/boat_parts/fuel_can


func _ready():
	player.has_control = false
	boat.axis_lock_linear_x = true


func _process(_delta):
	#Room Switching
	if Global.current_object == "doorCol":
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.floor = "Hub"
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Final Levels/facility_enterance.tscn")
	
	# Boat Movement Control
	if end_intro:
		if boat.global_position.z > boat_end_pos:
			boat.apply_central_force(Vector3(0,0,-5))
		else:
			end_intro = false
			boat.axis_lock_linear_z = true
			intro_objects.visible = false
			intro_camera.current = false
			player.visible = true
			player.has_control = true
			# Hide Boat Parts
			antennas.visible = false
			radar.visible = false
			motor.visible = false
			battery.visible = false
			fuel_can.visible = false


func _on_death_col_area_entered(_area):
	player.position = Vector3(16.5, 3.5, -38)
