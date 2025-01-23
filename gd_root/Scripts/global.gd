extends Node

var new_game = false

var room_completed = false

var previous_scene = "res://Scenes/Testing Rooms/dev_testing_room.tscn"

var storm_time = "0"

var timer_started = false

var current_object = "none"

var one_watered = false
var two_watered = false
var three_watered = false
var four_watered = false
var five_watered = false
var six_watered = false

func _process(_delta):
	if new_game == true:
		room_completed = false
		new_game = false
