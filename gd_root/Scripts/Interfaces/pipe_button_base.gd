extends Button

var active1 = false
var active2 = false
var active3 = false
var active4 = false
var full = false
var startFull = false
var neighbor1
var neighbor2
var neighbor3
var reset = false
var children = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func reset_water():
	children = get_child_count()
	for n in children:
		get_child(n).reset()
	full = false
	active1 = false
	active2 = false
	active3 = false
	active4 = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if startFull == true:
		full = true
		
	if active1 == true or active2 == true or active3 or active4 == true:
		full = true
	else:
		full = false
	
	if full == true:
		add_theme_color_override("icon_disabled_color", Color(0, 1, 0, 1))
		add_theme_color_override("icon_focus_color", Color(0, 1, 0, 1))
		add_theme_color_override("icon_hover_color", Color(0, 1, 0, 1))
		add_theme_color_override("icon_hover_pressed_color", Color(0, 1, 0, 1))
		add_theme_color_override("icon_normal_color", Color(0, 1, 0, 1))
		add_theme_color_override("icon_pressed_color", Color(0, 1, 0, 1))
	else:
		add_theme_color_override("icon_disabled_color", Color(1, 1, 1, 1))
		add_theme_color_override("icon_focus_color", Color(1, 1, 1, 1))
		add_theme_color_override("icon_hover_color", Color(1, 1, 1, 1))
		add_theme_color_override("icon_hover_pressed_color", Color(1, 1, 1, 1))
		add_theme_color_override("icon_normal_color", Color(1, 1, 1, 1))
		add_theme_color_override("icon_pressed_color", Color(1, 1, 1, 1))
