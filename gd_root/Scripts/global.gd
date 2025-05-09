extends Node

signal make_lights_red
signal make_lights_normal
signal update_part_sound(part)

# In game music and checklist scratch off sound
@onready var music_control = preload("res://Scenes/music_control.tscn").instantiate()
var checklist_scratch

var new_game = false

var room_completed = false

# Scene to load back into when exiting a UI
var previous_scene = "res://Scenes/Menus/title_screen.tscn"

# Storm system control 
var time_left = 10: set = _set_time_left
var watch_collected = false
var timer_active = false
var needle_rotation = 1

#List pickup boolean
var list_collected = false

# If the tutorial is completed control
var tutorial_completed = false

# Player ray cast collision range for interaction
var current_object = "none"
var current_object_parent = "none"

# Fire puzzle section states
var one_watered = false
var two_watered = false
var three_watered = false
var four_watered = false
var five_watered = false
var six_watered = false

# Players position for scene changes
var lastpos = 0

# Fire Puzzle 
var water_amount = 1

var fire_console_number = 0

var fire_console_one_water = 1
var fire_console_two_water = 1
var fire_console_three_water = 1

var one_fire_acess = 0
var two_fire_acess = 0
var three_fire_acess = 0
var four_fire_acess = 0
var five_fire_acess = 0
var six_fire_acess = 0

# Dial puzzle dial rotation
var dial_1_rotation = 0
var dial_2_rotation = 0
var dial_3_rotation = 0

# Dial Puzzle Codes
var code_degrees1 = 0
var code_degrees2 = 0
var code_degrees3 = 0

# Tile Puzzle
var tile_puzzle_level = 1

# Puzzle status Control
var dial_puzzle_completed = false
var tile_puzzle_completed = false : set = _set_tile_puzzle
var radar_puzzle_completed = false : set = _set_radar_puzzle
var fire_puzzle_completed = false
var flow_puzzle_completed = false : set = _set_flow_puzzle

var entry_door_open = false : set = _set_entry_door
var reactor_stable = false : set = _set_reactor_state

# Player position update when spawning control
var consistent_positioning = true
var new_position = 0

# If player is in a menu
var in_menu = false

# Floor to load in elevator
var next_floor = "null"

var keypad_positive = false

# Inventory System
var fuel_can_collected = false
var antennas_collected = false
var battery_collected = false
var motor_collected = false
var radar_collected = false

# Tutorial Control var
var default_audio_name = "line_"
var line_num = 0
var voice_line = ""

var entry_position = true


func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("time_up"):
		_set_time_left(Global.time_left + 1)
	if Input.is_action_just_pressed("time_down"):
		_set_time_left(Global.time_left - 1)


func _ready() -> void:
	add_child(music_control)
	music_control.playing = false
	checklist_scratch = music_control.get_child(0)


func _process(_delta):
	if timer_active && time_left == 0:
		queue_free()
		get_tree().change_scene_to_file("res://Scenes/Menus/death.tscn")
	if new_game == true:
		room_completed = false
		new_game = false


# Setter Functions
func _set_time_left(new_time):
	time_left = new_time
	if time_left <= 2:
		make_lights_red.emit()
	else:
		make_lights_normal.emit()


func _set_tile_puzzle(tile_state):
	tile_puzzle_completed = tile_state
	emit_signal("update_part_sound", "antennas")


func _set_radar_puzzle(radar_state):
	radar_puzzle_completed = radar_state
	emit_signal("update_part_sound", "radar")


func _set_flow_puzzle(flow_state):
	flow_puzzle_completed = flow_state
	emit_signal("update_part_sound", "battery")


func _set_entry_door(door_state):
	entry_door_open = door_state
	emit_signal("update_part_sound", "fuel")


func _set_reactor_state(react_state):
	reactor_stable = react_state
	emit_signal("update_part_sound", "motor")
