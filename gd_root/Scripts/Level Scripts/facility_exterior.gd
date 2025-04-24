extends Node3D

@onready var player = $player
@onready var boat = $world/boat

var boat_repair_mode = false

# Boat Parts 
@onready var antennas: Node3D = $world/boat/boat_parts/antennas
@onready var radar: Node3D = $world/boat/boat_parts/radar
@onready var motor: CSGMesh3D = $world/boat/boat_parts/motor
@onready var battery: MeshInstance3D = $world/boat/boat_parts/battery
@onready var fuel_can: CSGMesh3D = $world/boat/boat_parts/fuel_can


@onready var boat_repair_label: Label = $world/boat_repair_text/boat_repair_label


func _ready():
	boat.axis_lock_linear_x = true

func _process(_delta):
	#Room Switching
	if Global.current_object == "doorCol":
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.floor = "Hub"
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Final Levels/facility_enterance.tscn")


func _unhandled_input(_event) -> void:
	if boat_repair_mode:
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			if Global.antennas_collected:
				antennas.visible = true
			if Global.radar_collected:
				radar.visible = true
			if Global.motor_collected:
				motor.visible = true
			if Global.battery_collected:
				battery.visible = true
			if Global.fuel_can_collected:
				fuel_can.visible = true


func _on_death_col_area_entered(_area):
	player.position = Vector3(16.5, 3.5, -38)


func _on_boat_repair_col_area_entered(_area) -> void:
	var event_array = InputMap.action_get_events("interact")
	var event = event_array[0]
	var interact_key = OS.get_keycode_string(event.physical_keycode)
	boat_repair_label.text = "Press " + str(interact_key) + " or Left Mouse to repair"
	if Global.list_in_hand:
		boat_repair_mode = true
		boat_repair_label.visible = true


func _on_boat_repair_col_area_exited(_area) -> void:
	if Global.list_in_hand:
		boat_repair_mode = false
		boat_repair_label.visible = false
