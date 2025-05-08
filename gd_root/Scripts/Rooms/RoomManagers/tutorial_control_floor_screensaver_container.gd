extends Node3D

@onready var screensavers = $".".get_children()

func _ready():
	for s in screensavers:
		s.play("screensaver")
