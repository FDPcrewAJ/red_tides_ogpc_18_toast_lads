extends Node3D

var maxCoolant = 0
var coolantProvided = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if self.name == "pipe_valve":
		maxCoolant = 30
	if self.name == "pipe_valve2":
		maxCoolant = 60
	if self.name == "pipe_valve3":
		maxCoolant = 10
	if self.name == "pipe_valve4":
		maxCoolant = 80


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.current_object == "ValveBody":
		#Must correspond to the interactables display node in the current scene
		$"../../../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact"):
			if coolantProvided < maxCoolant:
				if self.name == "pipe_valve":
					$"../../../reactor/MeshInstance3D5/ReactorLabel".coolant += 10
					coolantProvided += 10
	if Global.current_object == "ValveBody2":
		#Must correspond to the interactables display node in the current scene
		$"../../../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact"):
			if coolantProvided < maxCoolant:
				if self.name == "pipe_valve2":
					$"../../../reactor/MeshInstance3D5/ReactorLabel".coolant += 15
					coolantProvided += 15
	if Global.current_object == "ValveBody3":
		#Must correspond to the interactables display node in the current scene
		$"../../../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact"):
			if coolantProvided < maxCoolant:
				if self.name == "pipe_valve3":
					$"../../../reactor/MeshInstance3D5/ReactorLabel".coolant += 2
					coolantProvided += 2
	if Global.current_object == "ValveBody4":
		#Must correspond to the interactables display node in the current scene
		$"../../../InteractablesDisplay"._show_interactable()
		if Input.is_action_just_pressed("interact"):
			if coolantProvided < maxCoolant:
				if self.name == "pipe_valve4":
					$"../../../reactor/MeshInstance3D5/ReactorLabel".coolant += 20
					coolantProvided += 20

func reset_pipe():
	coolantProvided = 0
