extends MeshInstance3D

@onready var interactables_display: Control = $"../../../InteractablesDisplay"
@onready var reactor_label: Label3D = $"../../../reactor_main/central_column/MeshInstance3D5/ReactorLabel"

@onready var pipe_valve: Node3D = $"../../Pipeline/pipe_valve"
@onready var pipe_valve_2: Node3D = $"../../Pipeline2/pipe_valve2"
@onready var pipe_valve_3: Node3D = $"../../Pipeline3/pipe_valve3"
@onready var pipe_valve_4: Node3D = $"../../Pipeline4/pipe_valve4"


func _process(_delta: float) -> void:
	if Global.fire_puzzle_completed:
		if Global.current_object == "ButtonBody":
			#Must correspond to the interactables display node in the current scene
			interactables_display._show_interactable()
			if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
				pipe_valve.reset_pipe()
				pipe_valve_2.reset_pipe()
				pipe_valve_3.reset_pipe()
				pipe_valve_4.reset_pipe()
				reactor_label.coolant = 0
