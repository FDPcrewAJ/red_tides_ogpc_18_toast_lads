extends Node3D

@onready var player: Player = $"../player"
@onready var voice_audio: AudioStreamPlayer3D = $cheif_container/voice_audio
@onready var tutorial_text_ui: Control = $"../tutorial_text_ui"

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


func _ready() -> void:
	chief_talk_anim = cptn_talk.get_child(1)
	chief_idle_anim = cptn_idle.get_child(1)
	chief_idle_anim.play("animation")


func _on_initiator_area_entered(_area: Area3D) -> void:
	player.has_control = false
	player.hide()
	cinimatic_cam.current = true


func _on_voice_line_player_finished() -> void:
	pass # Replace with function body.


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
			return "Ok, come over here and “interact” with this machine."
		"line_21":
			return "A cloud has appeared above us, so we need to act fast."
		"line_22":
			return "What was the code again…? I think it’s 254, 78, 126"
		"line_23":
			return "*sigh* ok that was the right code, i was worried for some reason. OR ok, and we should be good… wait NO!!--"
	return ""
