extends Node3D

@onready var interactables_display: Control = $"../InteractablesDisplay"


func _ready() -> void:
	pass # Replace with function body.



func _process(delta: float) -> void:
	if not Global.fire_puzzle_completed:
		if Global.current_object == "end_fire_switch":
			#Must correspond to the interactables display node in the current scene
			interactables_display._show_interactable()
			if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
				Global.fire_puzzle_completed = true
				flip_switch()


func flip_switch():
	self.rotation.z = deg_to_rad(-180)
