extends Label


func _process(_delta: float) -> void:
	if $"../RadarDot".puzzle_complete == true:
		text = "Calibration Complete"
		Global.radar_puzzle_completed = true
	else:
		text = "Calibration Incomplete"
