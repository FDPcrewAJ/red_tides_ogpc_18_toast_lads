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
	update_line()
	intro_animation_player.play("captain_1")


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
			boat.apply_central_force(Vector3(0,0,-13))
		else:
			update_boat = false
			boat.axis_lock_linear_z = true
			intro_objects.visible = false
			intro_camera.current = false
			player.visible = true


func _on_death_col_area_entered(_area):
	player.position = Vector3(16.5, 3.5, -38)


func match_voice_line(line_string) -> AudioStream:
	match line_string:
		"line_1":
			return load("res://Audio/Tutorial Voice Lines/line_1.mp3")
		"line_2":
			return load("res://Audio/Tutorial Voice Lines/line_2.mp3")
		"line_3":
			return load("res://Audio/Tutorial Voice Lines/line_3.mp3")
		"line_4":
			return load("res://Audio/Tutorial Voice Lines/line_4.mp3")
		"line_5":
			return load("res://Audio/Tutorial Voice Lines/line_5.mp3")
		"line_6":
			return load("res://Audio/Tutorial Voice Lines/line_6.mp3")
		"line_7":
			return load("res://Audio/Tutorial Voice Lines/line_7.mp3")
		"line_8":
			return load("res://Audio/Tutorial Voice Lines/line_8.mp3")
		"line_9":
			return load("res://Audio/Tutorial Voice Lines/line_9.mp3")
	return load("res://Audio/Tutorial Voice Lines/line_1.mp3")


func match_text_display(line_string) -> String:
	match line_string:
		"line_1":
			return "So, you must be excited, not everyone gets an opportunity like this."
		"line_2":
			return "A silent type then? That's going to be a *joy* to work with."
		"line_3":
			return "Anyway, while we’re approaching the facility, I should probably go through this handy list of propagan-ah- sorry, list of things I should tell you."
		"line_4":
			return "I’m going to assume you know why we’re here. Those filthy pigs over in America drilled too much, and now we have to deal with the consequences."
		"line_5":
			return "Anyway, we’re short staffed right now so you’re going to have to be balancing a lot."
		"line_6":
			return "The facility requires constant configuration, and it was a challenge to do that with 20 men."
		"line_7":
			return "Anyway, the government has cut funds, and now we’re just two guys against cyclones."
		"line_8":
			return "This is going to be so much fun!"
		"line_9":
			return "Alright, we’re almost here…"
	return ""


func update_line():
	Global.line_num += 1
	Global.voice_line = Global.default_audio_name + str(Global.line_num)


func _on_intro_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"captain_1":
			voice_audio.set_stream(match_voice_line(Global.voice_line))
			voice_audio.play()
			tutorial_text_ui.show()
			tutorial_text_ui.set_text(match_text_display(Global.voice_line))


func _on_voice_audio_finished():
	update_line()
	if Global.line_num < 10:
		voice_audio.set_stream(match_voice_line(Global.voice_line))
		voice_audio.play()
		tutorial_text_ui.set_text(match_text_display(Global.voice_line))
	if Global.line_num == 3:
		update_boat = true
		intro_camera.position = Vector3(89.0, 8.0, 83.0)
		intro_camera.rotation.x = deg_to_rad(10.0)
		intro_camera.rotation.y = deg_to_rad(58.0)
	if Global.line_num == 10:
		tutorial_text_ui.hide()
