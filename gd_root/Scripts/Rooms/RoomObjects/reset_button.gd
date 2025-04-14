extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.current_object == "ButtonBody":
		#Must correspond to the interactables display node in the current scene
		$"../../../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact"):
			$"../../Pipeline/pipe_valve".reset_pipe()
			$"../../Pipeline2/pipe_valve2".reset_pipe()
			$"../../Pipeline3/pipe_valve3".reset_pipe()
			$"../../Pipeline4/pipe_valve4".reset_pipe()
			$"../../../reactor/MeshInstance3D5/ReactorLabel".coolant = 0
