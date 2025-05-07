extends Node3D

signal interaction_ready

# Core access nodes
@onready var player = $"../player"
@onready var voice_audio: AudioStreamPlayer3D = $cheif_container/voice_audio
@onready var tutorial_text_ui: Control = $"../tutorial_text_ui"

@onready var initiator: Area3D = $initiator
@onready var dial_puzzle_interface: Node2D = $"../puzzle_interaction/dial_puzzle_interface"

# Death animation control
@onready var lightning_strike: Node3D = $cheif_container/lightning_strike
@onready var lighting_timer: Timer = $cheif_container/lighting_timer
@onready var cheif_fling_animator: AnimationPlayer = $cheif_fling_animator
@onready var black_screen: ColorRect = $black_screen/black_screen_rect
@onready var blackout_timer: Timer = $black_screen/blackout_timer
@onready var wake_up_label: Label = $black_screen/wake_up_label

@onready var fire_container: Node3D = $fire_container
@onready var lights: Node3D = $"../world/building/lights"
@onready var world_env: WorldEnvironment = $"../WorldEnv"

# Cutscene Camera
@onready var camera_container: Node3D = $camera_container
@onready var cinimatic_cam: Camera3D = $camera_container/cinimatic_cam

# Chief Scene Nodes
@onready var cheif_container: Node3D = $cheif_container
@onready var cptn_idle: Node3D = $cheif_container/cptn_idle
@onready var cptn_talk: Node3D = $cheif_container/cptn_talk
@onready var cptn_fling_loop: Node3D = $cheif_container/cptn_fling_loop
@onready var cptn_fling_end: Node3D = $cheif_container/cptn_fling_end
@onready var cptn_dead: Node3D = $cheif_container/cptn_dead


# Chief Animation access
var chief_talk_anim
var chief_idle_anim
var chief_fling_loop
var chief_fling_end
var chief_dead

var lightning_count = 0

func _unhandled_input(_event: InputEvent) -> void:
	pass
	#if Input.is_action_just_pressed("devKey"):
		#_on_voice_line_player_finished()


func _ready() -> void:
	chief_talk_anim = cptn_talk.get_child(1)
	chief_idle_anim = cptn_idle.get_child(1)
	chief_fling_loop = cptn_fling_loop.get_child(1)
	chief_fling_end = cptn_fling_end.get_child(1)
	chief_dead = cptn_dead.get_child(1)
	chief_idle_anim.play("animation")


func _on_initiator_area_entered(_area: Area3D) -> void:
	player.has_control = false
	player.velocity = Vector3.ZERO
	player.hide()
	cinimatic_cam.current = true
	tutorial_text_ui.show()
	match_text_display(Global.voice_line)
	cptn_idle.hide()
	chief_idle_anim.stop()
	cptn_talk.show()
	chief_talk_anim.play("animation")
	play_next_line()


func _on_voice_line_player_finished() -> void:
	update_line()
	if Global.line_num < 22:
		play_next_line()
	
	# Allow player to move to next section after line 20
	if Global.line_num == 22:
		Global.watch_collected = true
		Global.timer_active = true
		play_next_line()
		
	if Global.line_num == 23:
		# Clear initiator to prevent activation
		initiator.position.y = -20
		# Update player position and rotation
		player.position.x = camera_container.position.x - 0.2
		player.position.z = camera_container.position.z
		player.rotation.y = -90
		player.velocity = Vector3.ZERO
		# Change back to player cam and hide UI
		player.show()
		cinimatic_cam.current = false
		player.has_control = true
		tutorial_text_ui.hide()
		play_next_line()
		# Move captain to new area
		cheif_container.position = Vector3(9.1, 0.5, -4.55)
		cheif_container.rotation.y = -122
		
	
	# Autoplay the caller line
	if Global.line_num == 24:
		play_next_line()
		tutorial_text_ui.show()
	
	# Hide text UI after caller line
	if Global.line_num == 25:
		tutorial_text_ui.hide()
		cptn_idle.show()
		cptn_talk.hide()
		chief_idle_anim.play("animation")
		interaction_ready.emit()
	
	# Play lines inside the Puzzle UI
	if Global.line_num > 25 and Global.line_num < 27:
		play_next_line()
	
	# Hide UI text after puzzle voice lines finish
	if Global.line_num == 27:
		tutorial_text_ui.hide()
	
	# finish the death cutscene after the final voice line
	if Global.line_num == 28:
		tutorial_text_ui.hide()
		cptn_talk.hide()
		chief_fling_loop.play("animation")
		cptn_fling_loop.show()
		lightning_strike.show()
		lighting_timer.start()
		cheif_fling_animator.active = true
		cheif_fling_animator.play("chief_fling")

func play_next_line():
	voice_audio.set_stream(match_voice_line(Global.voice_line))
	voice_audio.play()
	tutorial_text_ui.set_text(match_text_display(Global.voice_line))


func play_death_cutscene():
	player.has_control = false
	player.hide()
	camera_container.position = Vector3(7.545, 2.414, -6.614)
	camera_container.rotation.y = deg_to_rad(-157)
	player.position.x = camera_container.position.x
	player.position.z = camera_container.position.z
	player.rotation.y = camera_container.rotation.y
	cinimatic_cam.current = true
	cptn_idle.hide()
	cptn_talk.show()
	dial_puzzle_interface.hide()
	tutorial_text_ui.show()
	play_next_line()

func update_line():
	Global.line_num += 1
	Global.voice_line = Global.default_audio_name + str(Global.line_num)


func match_voice_line(line_string) -> AudioStream:
	match line_string:
		"line_17":
			return load("res://Audio/Tutorial Voice Lines/line_17.mp3")
		"line_18":
			return load("res://Audio/Tutorial Voice Lines/line_18.mp3")
		"line_19":
			return load("res://Audio/Tutorial Voice Lines/line_19.mp3")
		"line_20":
			return load("res://Audio/Tutorial Voice Lines/line_20.mp3")
		"line_21":
			return load("res://Audio/Tutorial Voice Lines/line_21.mp3")
		"line_22":
			return load("res://Audio/Tutorial Voice Lines/line_22.mp3")
		"line_23":
			return load("res://Audio/Tutorial Voice Lines/line_23.mp3")
		"line_24":
			return load("res://Audio/Tutorial Voice Lines/line_24.mp3")
		"line_25":
			return load("res://Audio/Tutorial Voice Lines/line_25.mp3")
		"line_26":
			return load("res://Audio/Tutorial Voice Lines/line_26.mp3")
		"line_27":
			return load("res://Audio/Tutorial Voice Lines/line_27.mp3")
	return load("res://Audio/Tutorial Voice Lines/line_23.mp3")


func match_text_display(line_string) -> String:
	match line_string:
		"line_17":
			return "Took you long enough..."
		"line_18":
			return "The computers on this floor allow us to push back the incoming storms, so that they don't destroy the facility and kill us."
		"line_19":
			return "The terminal behind me finds coordinates of incoming storms. You use these coordinates to calibrate the systems at the other machine."
		"line_20":
			return "I have already found coordinates of an incoming storm, so come meet me at the other computer."
		"line_21":
			return "Oh, I almost forgot, take this stopwatch."
		"line_22":
			return "It's linked to the systems so that you know how much time you have left before a storm reaches us."
		"line_23":
			return ""
		"line_24":
			return "Ok, come over here and interact with this machine."
		"line_25":
			return "A cloud has appeared above us, so we need to act fast."
		"line_26":
			return "What was the code again…? I think it’s 254, 78, 126"
		"line_27":
			return "*sigh* ok that was the right code, I was worried for some reason. or, ok, and we should be good… wait NO!!--"
	return ""


func _on_puzzle_interaction_start_dial_voice_lines() -> void:
	play_next_line()
	tutorial_text_ui.show()
	player.has_control = false


func _on_dial_puzzle_interface_dial_puzzle_completed() -> void:
	play_death_cutscene()


func _on_lighting_timer_timeout() -> void:
	lightning_strike.hide()
	lightning_count += 1
	if lightning_count == 2:
		player.has_control = false
		black_screen.show()
		blackout_timer.start()


func _on_cheif_fling_animator_animation_finished(_anim_name: StringName) -> void:
	cptn_fling_loop.hide()
	cptn_fling_end.show()
	chief_fling_end.play("animation")
	lightning_strike.show()
	lighting_timer.start()


func _on_blackout_timer_timeout() -> void:
	if lightning_count == 2:
		wake_up_label.show()
		lightning_count += 1
		blackout_timer.start()
	else:
		world_env.environment.fog_enabled = true
		cinimatic_cam.current = false
		player.show()
		lights.red_lights()
		black_screen.hide()
		wake_up_label.hide()
		fire_container.position.y = 0
		player.has_control = true
