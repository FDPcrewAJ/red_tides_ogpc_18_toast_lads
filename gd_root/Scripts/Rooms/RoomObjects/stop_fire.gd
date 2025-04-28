extends Node3D

@onready var interactables_display: Control = $"../InteractablesDisplay"
@onready var fire_console: CSGMesh3D = $"../Rooms/hub_room/FireConsole"
@onready var fire_console_2: CSGMesh3D = $"../Rooms/hub_room/FireConsole2"
@onready var fire_console_3: CSGMesh3D = $"../Rooms/hub_room/FireConsole3"



signal fire_stopped

func _process(_delta: float) -> void:
	if not Global.fire_puzzle_completed:
		if Global.current_object == "end_fire_switch":
			#Must correspond to the interactables display node in the current scene
			interactables_display._show_interactable()
			if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
				Global.fire_puzzle_completed = true
				self.rotation.z = deg_to_rad(-180)
				fire_stopped.emit()
				fire_console.queue_free()
				fire_console_2.queue_free()
				fire_console_3.queue_free()
