extends Control

@onready var label = $stopwatch_dial/stopwatch_countdown
@onready var needle = $stopwatch_dial/stopwatch_needle
var rotation_speed = TAU #/ 60
var double_digit = 0
var single_digit = ""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
#node.rotate(Vector3(0, 0, 1), deg2rad(90))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	count_up(delta)
	#count_down(delta)
	
func count_up(delta):
	needle.rotate(rotation_speed * delta)
	if needle.rotation_degrees >= 360:
		needle.rotation_degrees = 1
		double_digit += 1
		if double_digit < 10:
			single_digit = "0" + str(double_digit)
			label.text = str(single_digit)
		else:
			label.text = str(double_digit)
	
func count_down(delta):
	needle.rotate(rotation_speed * delta)
	if needle.rotation_degrees >= 360:
		needle.rotation_degrees = 1
		double_digit -= 1
		if double_digit < 10:
			single_digit = "0" + str(double_digit)
			label.text = str(single_digit)
		else:
			label.text = str(double_digit)	
	
