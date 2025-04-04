extends Timer



func _ready() -> void:
	wait_time = Global.storm_time
	if Global.storm_active:
		start()
