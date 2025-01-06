extends Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.timer_started == true:
		$".".wait_time = Global.storm_time
	Global.timer_started = true
	$".".start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	Global.storm_time = int(time_left)
	if Global.storm_time < 1:
		get_tree().change_scene_to_file("res://Scenes/Menus/main_menu.tscn")
