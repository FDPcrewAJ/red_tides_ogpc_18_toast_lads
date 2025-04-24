extends Control

@onready var text_label = $text_label

func set_text(text):
	text_label.text = text
