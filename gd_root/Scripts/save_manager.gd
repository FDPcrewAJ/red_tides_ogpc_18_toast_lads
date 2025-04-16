extends Node

const SETTINGS_SAVE_PATH : String = "user://SettingsData.save"

var settings_data_dict : Dictionary = {}

func _ready():
	SignalBus.set_settings_dictionary.connect(on_settings_save)


func on_settings_save(data: Dictionary):
	var save_settings_data_file = FileAccess.open(SETTINGS_SAVE_PATH, FileAccess.WRITE)
	
	var json_data_string = JSON.stringify(data)
	
	save_settings_data_file.store_line(json_data_string)
