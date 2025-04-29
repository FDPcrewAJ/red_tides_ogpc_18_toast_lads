extends Control

@onready var stopwatch_dial: TextureRect = $stopwatch_dial
@onready var label = $stopwatch_dial/stopwatch_countdown
@onready var needle = $stopwatch_dial/stopwatch_needle
@onready var list: Control = $checklist

# Checkboxes for the parts list
@onready var antenna_check: Label = $checklist/parts_list/antenna_check
@onready var battery_check: Label = $checklist/parts_list/battery_check
@onready var fuel_can_check: Label = $checklist/parts_list/fuel_can_check
@onready var motor_check: Label = $checklist/parts_list/motor_check
@onready var radar_check: Label = $checklist/parts_list/radar_check

#These variables are for the stopwatch
var rotation_speed = TAU / 60
var double_digit = 0
var single_digit = ""

#These variables are for the parts list
var list_open = true 


func _ready() -> void:
	set_time()
	
	if double_digit <= 0:
		Global.timer_active = false
		


func _input(_event) -> void:
	if Global.list_collected:
		if Input.is_action_just_pressed("open_list"):
			if list.visible:
				list.visible = false
			elif !list.visible:
				list.visible = true
				update_list()


func _physics_process(delta: float) -> void:
	# Watch Visibility Control
	if Global.watch_collected:
		stopwatch_dial.show()
	#Countdown activation
	if Global.timer_active:
		count_down(delta)
	
	update_list()


func set_time():
	double_digit = Global.time_left
	needle.rotation = deg_to_rad(Global.needle_rotation) 
	if double_digit < 10:
		single_digit = "0" + str(double_digit)
		label.text = str(single_digit)
	else:
		label.text = str(double_digit)


func count_down(delta):
	needle.rotate(rotation_speed * delta)
	Global.needle_rotation = needle.rotation_degrees
	if needle.rotation_degrees >= 360.0:
		needle.rotation_degrees = 1
		double_digit -= 1
		Global.time_left = double_digit
		if double_digit <= 0:
			label.text = "00"
		elif double_digit < 10:
			single_digit = "0" + str(double_digit)
			label.text = str(single_digit)
		else:
			label.text = str(double_digit)


func update_list():
	if Global.antennas_collected:
		antenna_check.visible = true
	if Global.battery_collected:
		battery_check.visible = true
	if Global.fuel_can_collected:
		fuel_can_check.visible = true
	if Global.motor_collected:
		motor_check.visible = true
	if Global.radar_collected:
		radar_check.visible = true
