extends Node3D

signal fire_stopped

@onready var interactables_display: Control = $"../InteractablesDisplay"
@onready var fire_console: CSGMesh3D = $"../hub_room/FireConsole"
@onready var fire_console_2: CSGMesh3D = $"../hub_room/FireConsole2"
@onready var fire_console_3: CSGMesh3D = $"../hub_room/FireConsole3"
@onready var lights: Node3D = $"../lights"


func _process(_delta: float) -> void:
	if not Global.fire_puzzle_completed:
		if Global.current_object == "end_fire_switch":
			#Must correspond to the interactables display node in the current scene
			interactables_display._show_interactable()
			if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
				Global.fire_puzzle_completed = true
				Global.tutorial_completed = true
				self.rotation.z = deg_to_rad(-180)
				lights.reset_lights()
				Global.music_control.get_stream_playback().switch_to_clip(3)
				fire_stopped.emit()
				fire_console.queue_free()
				fire_console_2.queue_free()
				fire_console_3.queue_free()
