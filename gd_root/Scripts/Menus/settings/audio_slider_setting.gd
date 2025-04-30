extends Control

@onready var audio_name: Label = $master_vol_cont/audio_name
@onready var audio_slider: HSlider = $master_vol_cont/audio_slider

@export_enum("Master", "Music", "Sfx", "Voice") var bus_name : String

var bus_index : int = 0

func _ready():
	get_bus_index_name()
	load_data()
	set_label_text()
	set_slider_value()


func load_data():
	match bus_name:
		"Master":
			_on_audio_slider_value_changed(SettingsContainer.get_master_volume())
		"Music":
			_on_audio_slider_value_changed(SettingsContainer.get_music_volume())
		"Sfx":
			_on_audio_slider_value_changed(SettingsContainer.get_sfx_volume())
		"Voice":
			_on_audio_slider_value_changed(SettingsContainer.get_voice_volume())


func set_label_text():
	audio_name.text = str(bus_name) + " Volume"


func get_bus_index_name():
	bus_index = AudioServer.get_bus_index(bus_name)


func set_slider_value():
	audio_slider.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))


func _on_audio_slider_value_changed(value: float):
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	
	match bus_index:
		0:
			SignalBus.emit_on_master_sound_set(value)
		1:
			SignalBus.emit_on_music_sound_set(value)
		2:
			SignalBus.emit_on_sfx_sound_set(value)
		3:
			SignalBus.emit_on_voice_sound_set(value)
