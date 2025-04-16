extends Control

@onready var button: OptionButton = $HBoxContainer/OptionButton

const RESOLUTION_DICTIONARY : Dictionary = {
	"1920 x 1080" : Vector2i(1920, 1080),
	"1280 x 720" : Vector2i(1280, 720),
	"2560 x 1440" : Vector2i(2560, 1440),
	"3840 x 2160" : Vector2i(3840, 2160)
}

func _ready() -> void:
	button.item_selected.connect(on_resolution_selected)
	add_resolution_items()


func add_resolution_items() -> void:
	for resolution_text in RESOLUTION_DICTIONARY:
		button.add_item(resolution_text)


func on_resolution_selected(index : int) -> void:
	DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[index])
