extends Node

@onready var keybind_resource : KeybindResource = preload("res://Scripts/Menus/settings/PlayerKeybindDefault.tres")
		  
var window_mode_index : int = 0
var resolution_index : int = 0
var master_volume : float = 0.0
var music_volume : float = 0.0
var sfx_volume : float = 0.0
var voice_volume : float = 0.0

var loaded_data : Dictionary = {}


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
		"keybinds" : create_keybinds_dictionary()
		#"forward" : InputMap.action_get_events("forward"),
		#"left" : InputMap.action_get_events("left"),
		#"backward" : InputMap.action_get_events("backward"),
		#"right" : InputMap.action_get_events("right"),
		#"jump" : InputMap.action_get_events("jump"),
		#"sprint" : InputMap.action_get_events("sprint"),
		#"crouch" : InputMap.action_get_events("crouch"),
		#"interact" : InputMap.action_get_events("interact"),
		#"exit" : InputMap.action_get_events("exit"),
		#"open_list" : InputMap.action_get_events("open_list")
	}
	return settings_container_dict


func create_keybinds_dictionary() -> Dictionary:
	var keybinds_container_dict = {
		keybind_resource.MOVE_FORWARD : keybind_resource.move_forward_key,
		keybind_resource.MOVE_BACKWARD : keybind_resource.move_backward_key,
		keybind_resource.MOVE_LEFT : keybind_resource.move_left_key,
		keybind_resource.MOVE_RIGHT : keybind_resource.move_right_key,
		keybind_resource.JUMP : keybind_resource.jump_key,
		keybind_resource.SPRINT : keybind_resource.sprint_key,
		keybind_resource.CROUCH : keybind_resource.exit_key,
		keybind_resource.INTERACT : keybind_resource.interact_key,
		keybind_resource.OPEN_LIST : keybind_resource.open_list_key,
		keybind_resource.EXIT : keybind_resource.exit_key
	}
	return keybinds_container_dict


func handle_signals():
	SignalBus.on_window_mode_selected.connect(on_window_mode_selected)
	SignalBus.on_resolution_selected.connect(on_resolution_selected)
	SignalBus.on_master_sound_set.connect(on_master_sound_set)
	SignalBus.on_music_sound_set.connect(on_music_sound_set)
	SignalBus.on_sfx_sound_set.connect(on_sfx_sound_set)
	SignalBus.on_voice_sound_set.connect(on_voice_sound_set)
	SignalBus.load_settings_data.connect(on_settings_data_loaded)


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


func on_settings_data_loaded(data : Dictionary):
	loaded_data = data
	on_window_mode_selected(loaded_data.window_mode_index)
	on_resolution_selected(loaded_data.resolution_index)
