extends Node3D

@onready var interactables_display: Control = $"../../../InteractablesDisplay"
@onready var reactor_label: Label3D = $"../../../reactor_main/central_column/MeshInstance3D5/ReactorLabel"
@onready var valve_anims: AnimationPlayer = $"../../../valve_anims"

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
func _process(_delta) -> void:
	if Global.fire_puzzle_completed:
		if Global.current_object == "ValveBody":
			#Must correspond to the interactables display node in the current scene
			interactables_display._show_interactable()
			if !valve_anims.is_playing():
				if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
					if coolantProvided < maxCoolant:
						if self.name == "pipe_valve":
							valve_anims.play("pipe_1_turn")
							reactor_label.coolant += 10
							coolantProvided += 10
		if Global.current_object == "ValveBody2":
			#Must correspond to the interactables display node in the current scene
			interactables_display._show_interactable()
			if !valve_anims.is_playing():
				if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
					if coolantProvided < maxCoolant:
						if self.name == "pipe_valve2":
							valve_anims.play("pipe_2_turn")
							reactor_label.coolant += 15
							coolantProvided += 15
		if Global.current_object == "ValveBody3":
			#Must correspond to the interactables display node in the current scene
			interactables_display._show_interactable()
			if !valve_anims.is_playing():
				if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
					if coolantProvided < maxCoolant:
						if self.name == "pipe_valve3":
							valve_anims.play("pipe_3_turn")
							reactor_label.coolant += 2
							coolantProvided += 2
		if Global.current_object == "ValveBody4":
			#Must correspond to the interactables display node in the current scene
			interactables_display._show_interactable()
			if !valve_anims.is_playing():
				if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
					if coolantProvided < maxCoolant:
						if self.name == "pipe_valve4":
							valve_anims.play("pipe_4_turn")
							reactor_label.coolant += 20
							coolantProvided += 20

func reset_pipe():
	coolantProvided = 0
