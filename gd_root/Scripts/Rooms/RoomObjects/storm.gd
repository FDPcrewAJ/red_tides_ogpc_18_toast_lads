extends Timer


func _ready():
	if Global.timer_started == true:
		$".".wait_time = Global.storm_time
	Global.timer_started = true
	$".".start()


func _process(_delta):
	Global.storm_time = int(time_left)
	if Global.storm_time < 1:
		get_tree().change_scene_to_file("res://Scenes/Menus/main_menu.tscn")


func _timer_restart():
	wait_time = 120
	start()
