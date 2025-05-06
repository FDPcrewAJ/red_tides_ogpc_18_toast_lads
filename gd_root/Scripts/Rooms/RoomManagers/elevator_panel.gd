extends Node3D

# Floor Button Text
@onready var floor_5_label: Label3D = $label_sprite/button_5/floor_5_label
@onready var floor_4_label: Label3D = $label_sprite/button_4/floor_4_label
@onready var floor_3_label: Label3D = $label_sprite/button_3/floor_3_label
@onready var floor_2_label: Label3D = $label_sprite/button_2/floor_2_label
@onready var floor_1_label: Label3D = $label_sprite/button_1/floor_1_label

# Floor Label
@onready var floor_label: Label3D = $floor_feedback/floor_label

func _process(_delta: float) -> void:
	# Floor 1
	if Global.current_object == "button_1":
		$"../../InteractablesDisplay"._show_interactable()
		floor_1_label.modulate = Color(1, 0, 0)
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.next_floor = "Water Processing"
			floor_label.text = "Water Pumping"
	else:
		floor_1_label.modulate = Color(0.54, 0, 0)
	
	# Floor 2
	if Global.current_object == "button_2":
		$"../../InteractablesDisplay"._show_interactable()
		floor_2_label.modulate = Color(1, 0, 0)
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.next_floor = "Entrance"
			floor_label.text = "Entrance"
	else:
		floor_2_label.modulate = Color(0.54, 0, 0)
	
	# Floor 3
	if Global.current_object == "button_3":
		$"../../InteractablesDisplay"._show_interactable()
		floor_3_label.modulate = Color(1, 0, 0)
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.next_floor = "First Floor"
			floor_label.text = "Main Floor 1"
	else:
		floor_3_label.modulate = Color(0.54, 0, 0)
	
	# Floor 4
	if Global.current_object == "button_4":
		$"../../InteractablesDisplay"._show_interactable()
		floor_4_label.modulate = Color(1, 0, 0)
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.next_floor = "Second Floor"
			floor_label.text = "Main Floor 2"
	else:
		floor_4_label.modulate = Color(0.54, 0, 0)
	
	# Floor 5
	if Global.current_object == "button_5":
		$"../../InteractablesDisplay"._show_interactable()
		floor_5_label.modulate = Color(1, 0, 0)
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			Global.next_floor = "Control"
			floor_label.text = "Control"
	else:
			floor_5_label.modulate = Color(0.54, 0, 0)
