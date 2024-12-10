extends Node

var new_game = false

var room_completed = false

var previous_scene = "res://Scenes/Testing Rooms/dev_testing_room.tscn"

var storm_time = "0"

var timer_started = false

func _process(delta: float) -> void:
	if new_game == true:
		room_completed = false
		new_game = false
