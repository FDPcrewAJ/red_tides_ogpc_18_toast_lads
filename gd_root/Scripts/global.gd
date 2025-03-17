extends Node

var new_game = false

var room_completed = false

var previous_scene = "res://Scenes/Testing Rooms/dev_testing_room.tscn"

# Storm system control 
var storm_time = "0"
var timer_started = false

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

var lastpos = 0

var water_amount = 1

# Fire Puzzle 
var fire_console_number = 0

var fire_console_one_water = 1
var fire_console_two_water = 1
var fire_console_three_water = 1

var entry_door_open = false

# Tile Puzzle
var tile_puzzle_level = 1

# Dial Puzzle
var dial_1_rotation = 0
var dial_2_rotation = 0
var dial_3_rotation = 0

var dial_puzzle_completed = false

func _process(_delta):
	if new_game == true:
		room_completed = false
		new_game = false
