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

var dial_puzzle_completed = false

var dial_puzzle = false
var tile_puzzle = false
var fire_puzzle = false

var consistent_positioning = true
var new_position = 0

var in_menu = false

var one_fire_acess = 0
var two_fire_acess = 0
var three_fire_acess = 0
var four_fire_acess = 0
var five_fire_acess = 0
var six_fire_acess = 0

var floor = "null"

func _process(_delta):
	if new_game == true:
		room_completed = false
		new_game = false
