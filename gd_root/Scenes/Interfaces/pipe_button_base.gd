extends Button

var active1 = false
var active2 = false
var active3 = false
var full = false
var startFull = false
var neighbor1
var neighbor2
var neighbor3
var reset = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func reset_water():
	get_child(0).reset()
	get_child(1).reset()
	get_child(2).reset()
	full = false
	active1 = false
	active2 = false
	active3 = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if startFull == true:
		full = true
		
	if active1 == true or active2 == true or active3:
		full = true
	else:
		full = false
	
	if full == true:
		add_theme_color_override("font_disabled_color", Color(0, 1, 0, 1))
		add_theme_color_override("font_color", Color(0, 1, 0, 1))
		add_theme_color_override("font_outline_color", Color(0, 1, 0, 1))
		add_theme_color_override("font_focus_color", Color(0, 1, 0, 1))
		add_theme_color_override("font_hover_color", Color(0, 1, 0, 1))
		add_theme_color_override("font_hover_pressed_color", Color(0, 1, 0, 1))
		add_theme_color_override("font_pressed_color", Color(0, 1, 0, 1))
	else:
		add_theme_color_override("font_disabled_color", Color(1, 1, 1, 1))
		add_theme_color_override("font_color", Color(1, 1, 1, 1))
		add_theme_color_override("font_outline_color", Color(1, 1, 1, 1))
		add_theme_color_override("font_focus_color", Color(1, 1, 1, 1))
		add_theme_color_override("font_hover_color", Color(1, 1, 1, 1))
		add_theme_color_override("font_hover_pressed_color", Color(1, 1, 1, 1))
		add_theme_color_override("font_pressed_color", Color(1, 1, 1, 1))
