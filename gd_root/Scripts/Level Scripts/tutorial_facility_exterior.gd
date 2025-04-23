extends Node3D

signal allow_boat_movement

# Nodes to Access
@onready var player = $player
@onready var boat = $world/boat
@onready var intro_camera = $intro_camera
@onready var intro_objects: Node3D = $world/boat/intro_objects
@onready var intro_animation_player: AnimationPlayer = $intro_animation_player
@onready var voice_audio: AudioStreamPlayer = $voice_audio
@onready var tutorial_text_ui: Control = $tutorial_text_ui

# Boat Parts 
@onready var antennas: Node3D = $world/boat/boat_parts/antennas
@onready var radar: Node3D = $world/boat/boat_parts/radar
@onready var motor: CSGMesh3D = $world/boat/boat_parts/motor
@onready var battery: MeshInstance3D = $world/boat/boat_parts/battery
@onready var fuel_can: CSGMesh3D = $world/boat/boat_parts/fuel_can

var boat_end_pos = -44.0
var update_boat = false

func _ready():
	player.has_control = false
	boat.axis_lock_linear_x = true
	intro_animation_player.play("1_captain_turn")


func _process(_delta):
	#Room Switching
	if Global.current_object == "doorCol":
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.floor = "Hub"
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Final Levels/facility_enterance.tscn")
	
	# Boat Movement Control
	if update_boat:
		allow_boat_movement.emit()
		if boat.global_position.z > boat_end_pos:
			boat.apply_central_force(Vector3(0,0,-5))
		else:
			update_boat = false
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


func match_voice_line(line_string) -> AudioStream:
	match line_string:
		"line_1":
			return load("res://Audio/Tutorial Voice Lines/line_1.mp3")
	return load("res://Audio/Tutorial Voice Lines/line_1.mp3")


func match_text_display(line_string) -> String:
	return "null"


func _on_intro_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"1_captain_turn":
			voice_audio.set_stream(match_voice_line(Global.voice_line))
			voice_audio.play()
			tutorial_text_ui.show()


func _on_sfx_audio_finished() -> void:
	pass
