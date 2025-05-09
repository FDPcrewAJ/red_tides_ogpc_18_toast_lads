extends Label


func _process(_delta: float) -> void:
	if $"../RadarDot".puzzle_complete == true:
		text = "Calibration Complete"
		Global._set_radar_puzzle(true)
	else:
		text = "Calibration Incomplete"
