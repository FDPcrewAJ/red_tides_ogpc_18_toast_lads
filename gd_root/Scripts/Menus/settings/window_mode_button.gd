extends Control

@onready var button: OptionButton = $HBoxContainer/OptionButton

const WINDOW_MODE_ARRAY : Array[String] = [
	"Fullscreen",
	"Windowed",
	"Borderless Window",
	"Borderless Fullscreen"
]

func _ready():
	add_window_mode_items()
	button.item_selected.connect(on_window_mode_selected)
	load_data()


func load_data():
	on_window_mode_selected(SettingsContainer.get_window_mode_index())
	button.select(SettingsContainer.get_window_mode_index())


func add_window_mode_items() -> void:
	for window_mode in WINDOW_MODE_ARRAY:
		button.add_item(window_mode)


func on_window_mode_selected(index : int) -> void:
	SignalBus.emit_on_window_mode_selected(index)
	match index:
		0: #Fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		1: #Windowed
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		2: #Borderless Window
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		3: #Borderless Fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
