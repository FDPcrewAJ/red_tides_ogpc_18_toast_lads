extends MeshInstance3D

@onready var water_rush: AudioStreamPlayer = $"../../../audio/water_rush"

var play_once = true

func _process(_delta: float) -> void:
	if Global.reactorStable == false:
		position.y = 2.655
	else:
		if play_once:
			water_rush.play()
			play_once = false
		position.y = 0.951
