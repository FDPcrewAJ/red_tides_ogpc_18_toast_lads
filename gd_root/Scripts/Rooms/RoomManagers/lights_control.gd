extends Node3D

var lights
var skip_song_change = false


func _ready() -> void:
	Global.make_lights_normal.connect(reset_lights)
	Global.make_lights_red.connect(red_lights)
	lights = self.get_children()
	Global._set_time_left(Global.time_left)


func reset_lights():
	var control_light = lights[0]
	var old_color = control_light.light_color
	var new_color
	for l in lights:
		l.light_color = Color(0.998, 0.817, 0.416)
		new_color = l.light_color
	if skip_song_change:
		if !(old_color == new_color):
			Global.music_control.get_stream_playback().switch_to_clip(3)
	skip_song_change = true


func red_lights():
	var control_light = lights[0]
	var old_color = control_light.light_color
	var new_color
	for l in lights:
		l.light_color = Color(0.775, 0.084, 0)
		new_color = l.light_color
	if skip_song_change:
		if !(old_color == new_color):
			Global.music_control.get_stream_playback().switch_to_clip(2)
	skip_song_change = true
