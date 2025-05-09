extends Node3D

# Player and other control
@onready var player: Player = $"../player"
@onready var interactables_display: Control = $"../InteractablesDisplay"

# Boat Parts
@onready var fuel_can: Node3D = $boat_parts/fuel_can
@onready var battery: Node3D = $boat_parts/battery
@onready var radar: Node3D = $boat_parts/radar

# Part Sound nodes
@onready var fuel_can_sound: AudioStreamPlayer3D = $boat_parts/fuel_can/fuel_can_sound
@onready var battery_sound: AudioStreamPlayer3D = $boat_parts/battery/battery_sound
@onready var radar_sound: AudioStreamPlayer3D = $boat_parts/radar/radar_sound

var fuel_once = true
var battery_once = true
var radar_once = true

func _process(_delta: float) -> void:
	if Global.fire_puzzle_completed:
		# Puzzle Control
		# Radar Puzzle
		if Global.current_object == "first_floor_radar_puzzle":
			interactables_display._show_interactable()
			if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
				Global.lastpos = player.position
				Global.previous_scene = "res://Scenes/Final Levels/first_floor.tscn"
				get_tree().call_deferred("change_scene_to_file", "res://Scenes/Interfaces/radar_puzzle_interface.tscn")
		
		# Flow Puzzle
		if Global.current_object == "first_floor_flow_puzzle":
			interactables_display._show_interactable()
			if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
				Global.lastpos = player.position
				Global.previous_scene = "res://Scenes/Final Levels/first_floor.tscn"
				get_tree().call_deferred("change_scene_to_file", "res://Scenes/Interfaces/flow_puzzle_interface.tscn")
		
		# Keyoad Puzzle
		if Global.current_object == "StorageComputerBody":
			#Must correspond to the interactables display node in the current scene
			interactables_display._show_interactable()
			if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
				#This needs to correspond to the menu prompt node in the current scene.
				Global.previous_scene = "res://Scenes/Final Levels/first_floor.tscn"
				Global.lastpos = player.position
				get_tree().call_deferred("change_scene_to_file", "res://Scenes/Interfaces/storage_puzzle_interface.tscn")
		#lore
		if Global.current_object == "lore_rmail_01":
			interactables_display._show_interactable()
			if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
				Global.lastpos = player.position
				Global.previous_scene = "res://Scenes/Final Levels/first_floor.tscn"
				get_tree().call_deferred("change_scene_to_file", "res://Scenes/Interfaces/Lore/rmail_interface_01.tscn")
		
		if Global.current_object == "lore_rmail_02":
			interactables_display._show_interactable()
			if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
				Global.lastpos = player.position
				Global.previous_scene = "res://Scenes/Final Levels/first_floor.tscn"
				get_tree().call_deferred("change_scene_to_file", "res://Scenes/Interfaces/Lore/rmail_interface_02.tscn")
	
	# Boat Part Inventory and Interaction
	# Tile Puzzle / Fuel Can
	if Global.current_object == "fuel_can_col":
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			fuel_can.position = Vector3(0, -10, 0)
			Global.fuel_can_collected = true
			Global.checklist_scratch.play()
	
	# Battery
	if Global.current_object == "battery_col":
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			battery.position = Vector3(0, -10, 0)
			Global.battery_collected = true
			Global.checklist_scratch.play()
	
	# Radar
	if Global.current_object == "radar_col":
		interactables_display._show_interactable()
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("left_click"):
			radar.position = Vector3(0, -10, 0)
			Global.radar_collected = true
			Global.checklist_scratch.play()
	
	if Global.fuel_can_collected == true:
		fuel_can.position = Vector3(0, -10, 0)
		fuel_can_sound.stop()
	
	if Global.battery_collected == true:
		battery.position = Vector3(0, -10, 0)
		battery_sound.stop()
	
	if Global.radar_collected == true:
		radar.position = Vector3(0, -10, 0)
		radar_sound.stop()
	
	# Sound lure control
	if Global.keypad_positive:
		if fuel_once:
			fuel_can_sound.play()
			fuel_once = false
	
	if Global.flow_puzzle_completed:
		if battery_once:
			battery_sound.play()
			battery_once = false
	
	if Global.radar_puzzle_completed:
		if radar_once:
			radar_sound.play()
			radar_once = false
