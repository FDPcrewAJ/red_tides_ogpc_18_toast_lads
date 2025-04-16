extends Node

signal on_window_mode_selected(index : int)
signal on_resolution_selected(index: int)

signal on_master_sound_set(value : float)
signal on_music_sound_set(value : float)
signal on_sfx_sound_set(value : float)
signal on_voice_sound_set(value : float)

signal set_settings_dictionary(settings_dict : Dictionary)


func emit_set_settings_dictionary(settings_dict : Dictionary):
	set_settings_dictionary.emit(settings_dict)


func emit_on_window_mode_selected(index : int):
	on_window_mode_selected.emit(index)


func emit_on_resolution_selected(index: int):
	on_resolution_selected.emit(index)


func emit_on_master_sound_set(value : float):
	on_master_sound_set.emit(value)


func emit_on_music_sound_set(value : float):
	on_music_sound_set.emit(value)


func emit_on_sfx_sound_set(value : float):
	on_sfx_sound_set.emit(value)


func emit_on_voice_sound_set(value : float):
	on_voice_sound_set.emit(value)
