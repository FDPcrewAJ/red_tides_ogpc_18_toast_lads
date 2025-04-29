extends Node3D


# Core access nodes
@onready var player: Player = $"../player"
@onready var voice_audio: AudioStreamPlayer3D = $cheif_container/voice_audio
@onready var tutorial_text_ui: Control = $"../tutorial_text_ui"
@onready var player_look_at: Node3D = $player_look_at

@onready var initiator: Area3D = $initiator

# Cutscene Camera
@onready var camera_container: Node3D = $camera_container
@onready var cinimatic_cam: Camera3D = $camera_container/cinimatic_cam

# Chief Scene Nodes
@onready var cheif_container: Node3D = $cheif_container
@onready var cptn_idle: Node3D = $cheif_container/cptn_idle
@onready var cptn_talk: Node3D = $cheif_container/cptn_talk

# Chief Animation access
var chief_talk_anim
var chief_idle_anim

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("devKey"):
		_on_voice_line_player_finished()


func _ready() -> void:
	chief_talk_anim = cptn_talk.get_child(1)
	chief_idle_anim = cptn_idle.get_child(1)
	chief_idle_anim.play("animation")


func _on_initiator_area_entered(_area: Area3D) -> void:
	player.has_control = false
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
	if Global.line_num < 20:
		play_next_line()
	
	# Allow player to move to next section after line 20
	if Global.line_num == 20:
		Global.watch_collected = true
		# Update player position and rotation
		player.position.x = cinimatic_cam.position.x - 0.2
		player.position.z = cinimatic_cam.position.z
		player.rotation.y = -90
		player.velocity = Vector3.ZERO
		# Clear initiator to prevent activation
		initiator.position.y = -20
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
	if Global.line_num == 21:
		play_next_line()
		tutorial_text_ui.show()
	
	# Hide text UI after caller line
	if Global.line_num == 22:
		tutorial_text_ui.hide()
		cptn_idle.show()
		cptn_talk.hide()
		chief_idle_anim.play("animation")

func play_next_line():
	voice_audio.set_stream(match_voice_line(Global.voice_line))
	voice_audio.play()
	tutorial_text_ui.set_text(match_text_display(Global.voice_line))


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
	return load("res://Audio/Tutorial Voice Lines/line_2.mp3")


func match_text_display(line_string) -> String:
	match line_string:
		"line_17":
			return "Took you long enough... So I’m supposed to tell you something, but I don’t know what it means. Ah Well"
		"line_18":
			return "'E'/'Left Click' to interact with terminals, 'Left Click' to interact in the puzzles, 'E'/'ESC' to exit"
		"line_19":
			return "Oh! I almost forgot! Take this stopwatch, it's linked to the systems so you know when to reconfigure."
		"line_20":
			return ""
		"line_21":
			return "Ok, come over here and “interact” with this machine."
		"line_22":
			return "A cloud has appeared above us, so we need to act fast."
		"line_23":
			return "What was the code again…? I think it’s 254, 78, 126"
		"line_24":
			return "*sigh* ok that was the right code, i was worried for some reason. or, ok, and we should be good… wait NO!!--"
	return ""
