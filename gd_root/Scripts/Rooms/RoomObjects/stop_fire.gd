extends Node3D

signal fire_stopped

@onready var interactables_display: Control = $"../InteractablesDisplay"
@onready var fire_console: CSGMesh3D = $"../hub_room/FireConsole"
@onready var fire_console_2: CSGMesh3D = $"../hub_room/FireConsole2"
@onready var fire_console_3: CSGMesh3D = $"../hub_room/FireConsole3"
@onready var lights: Node3D = $"../lights"
@onready var world_env: WorldEnvironment = $"../WorldEnv"
@onready var sprinkler_6: GPUParticles3D = $"../hub_room/Sprinkler6"
@onready var sprinkler_5: GPUParticles3D = $"../hub_room/Sprinkler5"
@onready var sprinkler_4: GPUParticles3D = $"../hub_room/Sprinkler4"


func _process(_delta: float) -> void:
	if not Global.fire_puzzle_completed:
		if Global.current_object == "end_fire_switch":
			#Must correspond to the interactables display node in the current scene
			interactables_display._show_interactable()
			if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
				world_env.environment.fog_enabled = false
				Global.fire_puzzle_completed = true
				Global.tutorial_completed = true
				self.rotation.z = deg_to_rad(-180)
				lights.reset_lights()
				Global.music_control.get_stream_playback().switch_to_clip(3)
				fire_stopped.emit()
				fire_console.queue_free()
				fire_console_2.queue_free()
				fire_console_3.queue_free()
				sprinkler_4.queue_free()
				sprinkler_5.queue_free()
				sprinkler_6.queue_free()
