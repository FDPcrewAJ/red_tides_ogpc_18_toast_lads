extends Node3D

@onready var boat_part_sound: AudioStreamPlayer3D = $"../motor/boat_part_sound"

func _ready() -> void:
	Global.update_part_sound.connect(on_part_sound)

func _process(_delta: float) -> void:
		# Motor
	if Global.current_object == "motor_col":
		$"../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			$"../motor".position = Vector3(0, -10, 0)
			Global.motor_collected = true
			Global.checklist_scratch.play()
	
	if Global.motor_collected == true:
		$"../motor".position = Vector3(0, -10, 0)
		boat_part_sound.stop()


func on_part_sound(part_name):
	if part_name == "motor":
		boat_part_sound.play()
