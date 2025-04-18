extends Node3D

@onready var player = $player
@onready var boat = $world/boat
@onready var intro_camera: Camera3D = $intro_camera
@onready var intro_objects: Node3D = $world/boat/intro_objects
@onready var interactables_display: Control = $InteractablesDisplay


var boat_end_pos = -44.0


func _ready():
	player.has_control = false
	boat.axis_lock_linear_x = true
	if Global.consistent_positioning == true:
		if typeof(Global.new_position) != TYPE_INT:
			#You need to change the $player node referenced here to the player in the current scene
			player._set_new_pos()
			Global.consistent_positioning = false

func _process(_delta):
	#Room Switching
	if Global.current_object == "doorCol":
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.floor = "Hub"
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Final Levels/facility_enterance.tscn")


	# Boat Movement Control
	if boat.global_position.z > boat_end_pos:
		boat.apply_central_force(Vector3(0,0,-5))
	else:
		boat.axis_lock_linear_z = true
		intro_objects.visible = false
		intro_camera.current = false
		player.visible = true
		player.has_control = true


func _on_death_col_area_entered(_area):
	player.position.x = boat.position.x
	player.position.y = boat.position.y + 5
	player.position.z = boat.position.z + 3
