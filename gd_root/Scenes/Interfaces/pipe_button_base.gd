extends Button

var active1 = false
var active2 = false
var active3 = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if active1 == true or active2 == true or active3 == true:
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
