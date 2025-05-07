extends Node3D

@onready var screensavers = $".".get_children()

func _ready():
	for s in screensavers:
		s.play("screensaver")
	if Global.tutorial_completed == false:
		if Global.next_floor != "Control":
			position = Vector3(0, -10, 0)
