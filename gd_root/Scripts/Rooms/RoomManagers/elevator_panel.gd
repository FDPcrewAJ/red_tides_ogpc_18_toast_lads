extends Node3D

# Floor Button Text
@onready var floor_5_label: Label3D = $label_sprite/button_5/floor_5_label
@onready var floor_4_label: Label3D = $label_sprite/button_4/floor_4_label
@onready var floor_3_label: Label3D = $label_sprite/button_3/floor_3_label
@onready var floor_2_label: Label3D = $label_sprite/button_2/floor_2_label
@onready var floor_1_label: Label3D = $label_sprite/button_1/floor_1_label
@onready var floor_x_label: Label3D = $label_sprite/button_x/floor_x_label

# Floor Label
@onready var floor_label: Label3D = $floor_feedback/floor_label

# Sound Effect
@onready var b_sound: AudioStreamPlayer = $e_button_sound

func _process(_delta: float) -> void:
	if Global.next_floor == "Water Processing":
		floor_label.text = "Water Pumping"
	if Global.next_floor == "Entrance":
		floor_label.text = "Entrance"
	if Global.next_floor == "First Floor":
		floor_label.text = "Main Floor 1"
	if Global.next_floor == "Second Floor":
		floor_label.text = "Main Floor 2"
	if Global.next_floor == "Control":
		floor_label.text = "Control"
	if Global.next_floor == "null":
		floor_label.text = ")_%()*%#-0!$"
	
	# Floor 1
	if Global.current_object == "button_1":
		$"../../InteractablesDisplay"._show_interactable()
		floor_1_label.modulate = Color(1, 0, 0)
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.next_floor = "Water Processing"
			b_sound.play()
	else:
		floor_1_label.modulate = Color(0.54, 0, 0)
	
	# Floor 2
	if Global.current_object == "button_2":
		$"../../InteractablesDisplay"._show_interactable()
		floor_2_label.modulate = Color(1, 0, 0)
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.next_floor = "Entrance"
			b_sound.play()
	else:
		floor_2_label.modulate = Color(0.54, 0, 0)
	
	# Floor 3
	if Global.current_object == "button_3":
		$"../../InteractablesDisplay"._show_interactable()
		floor_3_label.modulate = Color(1, 0, 0)
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.next_floor = "First Floor"
			b_sound.play()
	else:
		floor_3_label.modulate = Color(0.54, 0, 0)
	
	# Floor 4
	if Global.current_object == "button_4":
		$"../../InteractablesDisplay"._show_interactable()
		floor_4_label.modulate = Color(1, 0, 0)
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.next_floor = "Second Floor"
			b_sound.play()
	else:
		floor_4_label.modulate = Color(0.54, 0, 0)
	
	# Floor 5
	if Global.current_object == "button_5":
		$"../../InteractablesDisplay"._show_interactable()
		floor_5_label.modulate = Color(1, 0, 0)
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.next_floor = "Control"
			b_sound.play()
	else:
			floor_5_label.modulate = Color(0.54, 0, 0)
	
	# Off Limits FLoor
	if Global.current_object == "button_x":
		$"../../InteractablesDisplay"._show_interactable()
		floor_x_label.modulate = Color(1, 0, 0)
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.next_floor = "null"
			floor_label.text = ")_%()*%#-0!$"
			b_sound.play()
	else:
			floor_x_label.modulate = Color(0.54, 0, 0)
