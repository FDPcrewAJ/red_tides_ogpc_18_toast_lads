extends Control

@onready var label = $stopwatch_dial/stopwatch_countdown
@onready var needle = $stopwatch_dial/stopwatch_needle
@onready var list = $parts_list
#These variables are for the stopwatch
var rotation_speed = TAU #/ 60
var double_digit = 0
var single_digit = ""
var countdown_active = true
#These variables are for the parts list
var list_open = true 


func _ready() -> void:
	Global.storm_timer.connect("timeout", _on_storm_timer_timeout)
	update_time()
	
	if double_digit <= 0:
		countdown_active = false
		
	label.text = str(double_digit)


func _input(_event) -> void:
	
	if Global.list_in_hand:
		if Input.is_action_just_pressed("open_list"):
			if list.visible:
				list.visible = false
			elif !list.visible:
				list.visible = true


func _physics_process(delta: float) -> void:
	
	#Countdown activation
	if countdown_active:
		count_down(delta)

func update_time():
	double_digit = Global.time_left
	Global.storm_timer.wait_time = double_digit

func count_down(delta):
	needle.rotate(rotation_speed * delta)
	if needle.rotation_degrees >= 360.0:
		needle.rotation_degrees = 1
		double_digit -= 1
		if double_digit <= 0:
			countdown_active = false
			label.text = "00"
		elif double_digit < 10:
			single_digit = "0" + str(double_digit)
			label.text = str(single_digit)
		else:
			label.text = str(double_digit)


func _on_storm_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/Menus/title_screen.tscn")
