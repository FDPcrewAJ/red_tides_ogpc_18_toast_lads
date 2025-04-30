extends Node

@onready var DEFAULT_SETTINGS : DefaultSettingsResource = preload("res://Scripts/Menus/settings/DefaultSettings.tres")
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
		keybind_resource.CROUCH : keybind_resource.crouch_key,
		keybind_resource.INTERACT : keybind_resource.interact_key,
		keybind_resource.OPEN_LIST : keybind_resource.open_list_key,
		keybind_resource.EXIT : keybind_resource.exit_key
	}
	return keybinds_container_dict


func get_window_mode_index() -> int:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_WINDOW_MODE_INDEX
	return window_mode_index


func get_resolution_index() -> int:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_RESOLUTION_INDEX
	return resolution_index


func get_master_volume() -> float:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_MASTER_VOLUME
	return master_volume


func get_music_volume() -> float:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_MUSIC_VOLUME
	return music_volume


func get_sfx_volume() -> float:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_SFX_VOLUME
	return sfx_volume


func get_voice_volume() -> float:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_VOICE_VOLUME
	return voice_volume


func get_keybind(action : String):
	if !loaded_data.has("keybinds"):
		match action:
			keybind_resource.MOVE_FORWARD:
				return keybind_resource.DEFAULT_MOVE_FORWARD_KEY
			keybind_resource.MOVE_BACKWARD:
				return keybind_resource.DEFAULT_MOVE_BACKWARD_KEY
			keybind_resource.MOVE_LEFT:
				return keybind_resource.DEFAULT_MOVE_LEFT_KEY
			keybind_resource.MOVE_RIGHT:
				return keybind_resource.DEFAULT_MOVE_RIGHT_KEY
			keybind_resource.JUMP:
				return keybind_resource.DEFAULT_JUMP_KEY
			keybind_resource.SPRINT:
				return keybind_resource.DEFAULT_SPRINT_KEY
			keybind_resource.CROUCH:
				return keybind_resource.DEFAULT_CROUCH_KEY
			keybind_resource.INTERACT:
				return keybind_resource.DEFAULT_INTERACT_KEY
			keybind_resource.OPEN_LIST:
				return keybind_resource.DEFAULT_OPEN_LIST_KEY
			keybind_resource.EXIT:
				return keybind_resource.DEFAULT_EXIT_KEY
	else:
		match action:
			keybind_resource.MOVE_FORWARD:
				return keybind_resource.move_forward_key
			keybind_resource.MOVE_BACKWARD:
				return keybind_resource.move_backward_key
			keybind_resource.MOVE_LEFT:
				return keybind_resource.move_left_key
			keybind_resource.MOVE_RIGHT:
				return keybind_resource.move_right_key
			keybind_resource.JUMP:
				return keybind_resource.jump_key
			keybind_resource.SPRINT:
				return keybind_resource.sprint_key
			keybind_resource.CROUCH:
				return keybind_resource.crouch_key
			keybind_resource.INTERACT:
				return keybind_resource.interact_key
			keybind_resource.OPEN_LIST:
				return keybind_resource.open_list_key
			keybind_resource.EXIT:
				return keybind_resource.exit_key


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


func set_keybind(action : String, event):
	match action:
		keybind_resource.MOVE_FORWARD:
			keybind_resource.move_forward_key = event
		keybind_resource.MOVE_BACKWARD:
			keybind_resource.move_backward_key = event
		keybind_resource.MOVE_LEFT:
			keybind_resource.move_left_key = event
		keybind_resource.MOVE_RIGHT:
			keybind_resource.move_right_key = event
		keybind_resource.JUMP:
			keybind_resource.jump_key = event
		keybind_resource.SPRINT:
			keybind_resource.sprint_key = event
		keybind_resource.CROUCH:
			keybind_resource.crouch_key = event
		keybind_resource.INTERACT:
			keybind_resource.interact_key = event
		keybind_resource.OPEN_LIST:
			keybind_resource.open_list_key = event
		keybind_resource.EXIT:
			keybind_resource.exit_key = event


func on_keybinds_loaded(data : Dictionary):
	var loaded_forward = InputEventKey.new()
	var loaded_backward = InputEventKey.new()
	var loaded_left = InputEventKey.new()
	var loaded_right = InputEventKey.new()
	var loaded_jump = InputEventKey.new()
	var loaded_sprint = InputEventKey.new()
	var loaded_crouch = InputEventKey.new()
	var loaded_interact = InputEventKey.new()
	var loaded_open_list = InputEventKey.new()
	var loaded_exit = InputEventKey.new()
	
	loaded_forward.set_physical_keycode(int(data.forward))
	loaded_backward.set_physical_keycode(int(data.backward))
	loaded_left.set_physical_keycode(int(data.left))
	loaded_right.set_physical_keycode(int(data.right))
	loaded_jump.set_physical_keycode(int(data.jump))
	loaded_sprint.set_physical_keycode(int(data.sprint))
	loaded_crouch.set_physical_keycode(int(data.crouch))
	loaded_interact.set_physical_keycode(int(data.interact))
	loaded_open_list.set_physical_keycode(int(data.open_list))
	loaded_exit.set_physical_keycode(int(data.exit))
	
	keybind_resource.move_forward_key = loaded_forward
	keybind_resource.move_backward_key = loaded_backward
	keybind_resource.move_left_key = loaded_left
	keybind_resource.move_right_key = loaded_right
	keybind_resource.jump_key = loaded_jump
	keybind_resource.sprint_key = loaded_sprint
	keybind_resource.crouch_key = loaded_crouch
	keybind_resource.interact_key = loaded_interact
	keybind_resource.open_list_key = loaded_open_list
	keybind_resource.exit_key = loaded_exit


func on_settings_data_loaded(data : Dictionary):
	loaded_data = data
	on_window_mode_selected(loaded_data.window_mode_index)
	on_resolution_selected(loaded_data.resolution_index)
	on_master_sound_set(loaded_data.master_volume)
	on_music_sound_set(loaded_data.music_volume)
	on_sfx_sound_set(loaded_data.sfx_volume)
	on_voice_sound_set(loaded_data.voice_volume)
	on_keybinds_loaded(loaded_data.keybinds)


func handle_signals():
	SignalBus.on_window_mode_selected.connect(on_window_mode_selected)
	SignalBus.on_resolution_selected.connect(on_resolution_selected)
	SignalBus.on_master_sound_set.connect(on_master_sound_set)
	SignalBus.on_music_sound_set.connect(on_music_sound_set)
	SignalBus.on_sfx_sound_set.connect(on_sfx_sound_set)
	SignalBus.on_voice_sound_set.connect(on_voice_sound_set)
	SignalBus.load_settings_data.connect(on_settings_data_loaded)
