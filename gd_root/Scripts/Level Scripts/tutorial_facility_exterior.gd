extends Node3D

signal allow_boat_movement

# Nodes to Access
@onready var player = $player
@onready var boat = $world/boat
@onready var intro_camera: Camera3D = $camera_container/intro_camera
@onready var camera_container: Node3D = $camera_container
@onready var intro_objects: Node3D = $world/boat/intro_objects
@onready var intro_animation_player: AnimationPlayer = $intro_animation_player
@onready var voice_audio: AudioStreamPlayer = $voice_audio
@onready var tutorial_text_ui: Control = $tutorial_text_ui

@onready var dock_cutscene_objects: Node3D = $world/dock_cutscene_objects
@onready var boat_parts_dock: Node3D = $world/dock_cutscene_objects/boat_parts_dock
@onready var boat_parts: Node3D = $world/boat/boat_parts

# Chief Models and Animations
@onready var chief_container: Node3D = $world/dock_cutscene_objects/chief_container
@onready var cptn_idle: Node3D = $world/dock_cutscene_objects/chief_container/cptn_idle
@onready var cptn_talk: Node3D = $world/dock_cutscene_objects/chief_container/cptn_talk
@onready var boat_cptn_talk: Node3D = $world/boat/intro_objects/boat_cptn_talk
var chief_talk_anim
var chief_idle_anim
var boat_cptn_anim

# Boat Parts 
@onready var antennas: Node3D = $world/boat/boat_parts/antennas
@onready var radar: Node3D = $world/boat/boat_parts/radar
@onready var motor: CSGMesh3D = $world/boat/boat_parts/motor
@onready var battery: MeshInstance3D = $world/boat/boat_parts/battery
@onready var fuel_can: CSGMesh3D = $world/boat/boat_parts/fuel_can

var boat_end_pos = -44.0
var update_boat = false
var animate_camera = false

func _ready():
	player.has_control = false
	boat.axis_lock_linear_x = true
	update_line()
	intro_animation_player.play("cheif_intro_turn")
	
	chief_talk_anim = cptn_talk.get_child(1)
	chief_idle_anim = cptn_idle.get_child(1)


func _process(delta):
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
			intro_objects.hide()
			intro_camera.current = false
			chief_container.show()
			player.show()
			dock_cutscene_objects.show()
			play_next_line()
			tutorial_text_ui.show()
	
	if animate_camera:
		camera_container.position.z -= (0.7 * delta)


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
		"line_10":
			return load("res://Audio/Tutorial Voice Lines/line_10.mp3")
		"line_11":
			return load("res://Audio/Tutorial Voice Lines/line_11.mp3")
		"line_12":
			return load("res://Audio/Tutorial Voice Lines/line_12.mp3")
		"line_13":
			return load("res://Audio/Tutorial Voice Lines/line_13.mp3")
		"line_14":
			return load("res://Audio/Tutorial Voice Lines/line_14.mp3")
		"line_15":
			return load("res://Audio/Tutorial Voice Lines/line_15.mp3")
		"line_16":
			return load("res://Audio/Tutorial Voice Lines/line_16.mp3")
	return load("res://Audio/Tutorial Voice Lines/line_2.mp3")


func match_text_display(line_string) -> String:
	match line_string:
		"line_1":
			return "So, you must be excited, not everyone gets an opportunity like this."
		"line_2":
			return ""
		"line_3":
			return "A silent type then? That's going to be a *joy* to work with."
		"line_4":
			return "Anyway, while we’re approaching the facility, I should probably go through this handy list of propagan-ah- sorry, list of things I should tell you."
		"line_5":
			return "I’m going to assume you know why we’re here. Those filthy pigs over in America drilled too much, and now we have to deal with the consequences."
		"line_6":
			return "Anyway, we’re short staffed right now so you’re going to have to be balancing a lot."
		"line_7":
			return "The facility requires constant configuration, and it was a challenge to do that with 20 men."
		"line_8":
			return "Anyway, the government has cut funds, and now we’re just two guys against cyclones."
		"line_9":
			return "This is going to be so much fun!"
		"line_10":
			return "Alright, we’re almost there…"
		"line_11":
			return "Alright, as you probably noticed, we’re here. Yippee."
		"line_12":
			return "I should probably disclose something… I was ordered to remove a couple vital ship parts once you arrived."
		"line_13":
			return "The last recruit deserted, and that was the higher ups’ best idea to prevent that from happening again."
		"line_14":
			return "I personally think that’s a terrible idea. What if a really powerful storm came and killed me with a lightning bolt, leaving you stranded here?"
		"line_15":
			return "Ha! that would never happen, as long as we put in the right codes..."
		"line_16":
			return "Ah well, orders are orders, so I better get to it. Go ahead and explore. I’ll meet you in the control room. NO PEEKING!"
	return ""


func update_line():
	Global.line_num += 1
	Global.voice_line = Global.default_audio_name + str(Global.line_num)


func play_next_line():
	voice_audio.set_stream(match_voice_line(Global.voice_line))
	voice_audio.play()
	tutorial_text_ui.set_text(match_text_display(Global.voice_line))


func _on_intro_animation_player_animation_finished(anim_name: StringName) -> void:
	boat_cptn_anim = boat_cptn_talk.get_child(1)
	boat_cptn_anim.play("animation")
	voice_audio.set_stream(match_voice_line(Global.voice_line))
	voice_audio.play()
	tutorial_text_ui.show()
	tutorial_text_ui.set_text(match_text_display(Global.voice_line))


func _on_voice_audio_finished():
	update_line()
	tutorial_text_ui.show()
	if Global.line_num < 11:
		play_next_line()
		boat_cptn_anim.play("animation")
		if Global.line_num == 2:
			tutorial_text_ui.hide()
			boat_cptn_anim.stop()
	
	if Global.line_num == 4:
		update_boat = true
		camera_container.position = Vector3(89.0, 8.0, 83.0)
		animate_camera = true
		intro_camera.rotation.x = deg_to_rad(10.0)
		intro_camera.rotation.y = deg_to_rad(58.0)
	
	if Global.line_num == 11:
		tutorial_text_ui.hide()
		chief_talk_anim.play("animation")
	
	if Global.line_num > 11 and Global.line_num < 17:
		play_next_line()
	
	if Global.line_num == 13:
		boat_parts.hide()
		chief_container.position.z += 0.8
		chief_container.position.x -= 0.3
		chief_container.rotation.y = deg_to_rad(1)
		boat_parts_dock.show()
	
	if Global.line_num == 17:
		player.has_control = true
		cptn_talk.queue_free()
		cptn_idle.show()
		chief_idle_anim.play("animation")
		tutorial_text_ui.hide()
