extends Node3D

@onready var interactables_display = $"../InteractablesDisplay"

func _process(_delta):
	if Global.current_object == "doorCol":
		interactables_display._show_interactable()
		Global.tutorial_completed = true
