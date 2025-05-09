extends AudioStreamPlayer2D



func _ready() -> void:
	$"../Timer".start(1)



func _process(_delta: float) -> void:
	if !Global.radar_puzzle_completed:
		if $"../Timer".time_left <= 0:
			self.play()
			if $"../RadarDot".status == "green":
				$"../Timer".start(0.1)
			if $"../RadarDot".status == "yellow":
				$"../Timer".start(0.3)
			if $"../RadarDot".status == "orange":
				$"../Timer".start(0.5)
			if $"../RadarDot".status == "red":
				$"../Timer".start(1)
