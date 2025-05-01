extends Node

var new_game = false

var room_completed = false

var previous_scene = "res://Scenes/Menus/title_screen.tscn"

# Storm system control 
var time_left = 8
var watch_collected = false
var timer_active = false
var needle_rotation = 1

#List pickup boolean
var list_collected = false


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

var entry_door_open = false

# Tile Puzzle
var tile_puzzle_level = 1

var dial_puzzle_completed = false
var tile_puzzle_completed = false
var radar_puzzle_completed = false
var fire_puzzle_completed = false
var flow_puzzle_completed = false

var consistent_positioning = true
var new_position = 0

var in_menu = false

var next_floor = "null"

var reactorStable = false

var keypadPositive = false

# Inventory System
var fuel_can_collected = false
var antennas_collected = false
var battery_collected = false
var motor_collected = false
var radar_collected = false

# Tutorial Control var
var default_audio_name = "line_"
var line_num =0
var voice_line = ""

var entry_position = true

var code_degrees1 = 0
var code_degrees2 = 0
var code_degrees3 = 0


func _process(_delta):
	if timer_active && time_left == 0:
		queue_free()
		get_tree().change_scene_to_file("res://Scenes/Menus/death.tscn")
	if new_game == true:
		room_completed = false
		new_game = false
