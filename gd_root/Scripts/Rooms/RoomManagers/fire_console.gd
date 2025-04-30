extends CSGMesh3D

@onready var interactables_display: Control = $"../../InteractablesDisplay"
@onready var player: Player = $"../../player"


func _process(_delta):
	if Global.current_object == "ConsoleBody":
		#Must correspond to the interactables display node in the current scene
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.lastpos = player.position
			if Global.current_object_parent == "FireConsole":
				Global.fire_console_number = 1
			if Global.current_object_parent == "FireConsole2":
				Global.fire_console_number = 2
			if Global.current_object_parent == "FireConsole3":
				Global.fire_console_number = 3
			get_tree().change_scene_to_file("res://Scenes/Interfaces/fire_control_interface.tscn")
