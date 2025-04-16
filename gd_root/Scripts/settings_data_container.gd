extends Node

var window_mode_index : int = 0
var resolution_index : int = 0
var master_volume : float = 0.0
var music_volume : float = 0.0
var sfx_volume : float = 0.0
var voice_volume : float = 0.0


func _ready() -> void:
	handle_signals()
	create_storage_dictionary()


func create_storage_dictionary() -> Dictionary:
	var settings_container_dict : Dictionary = {
		"window_mode_index" : window_mode_index,
		"resolution_index" : resolution_index,
		"master_volume" : master_volume,
		"music_volume" : music_volume,
		"sfx_volume" : sfx_volume,
		"voice_volume" : voice_volume,
		"forward" : InputMap.action_get_events("forward"),
		"left" : InputMap.action_get_events("left"),
		"backward" : InputMap.action_get_events("backward"),
		"right" : InputMap.action_get_events("right"),
		"jump" : InputMap.action_get_events("jump"),
		"sprint" : InputMap.action_get_events("sprint"),
		"crouch" : InputMap.action_get_events("crouch"),
		"interact" : InputMap.action_get_events("interact"),
		"exit" : InputMap.action_get_events("exit"),
		"open_list" : InputMap.action_get_events("open_list")
	}
	return settings_container_dict


func handle_signals():
	SignalBus.on_window_mode_selected.connect(on_window_mode_selected)
	SignalBus.on_resolution_selected.connect(on_resolution_selected)
	SignalBus.on_master_sound_set.connect(on_master_sound_set)
	SignalBus.on_music_sound_set.connect(on_music_sound_set)
	SignalBus.on_sfx_sound_set.connect(on_sfx_sound_set)
	SignalBus.on_voice_sound_set.connect(on_voice_sound_set)


func on_window_mode_selected(index : int):
	window_mode_index = index


func on_resolution_selected(index : int):
	resolution_index = index


func on_master_sound_set(value : float):
	master_volume = value


func on_music_sound_set(value : float):
	music_volume = value


func on_sfx_sound_set(value : float):
	sfx_volume = value


func on_voice_sound_set(value : float):
	voice_volume = value
