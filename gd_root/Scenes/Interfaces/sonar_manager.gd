extends AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../Timer".start(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
