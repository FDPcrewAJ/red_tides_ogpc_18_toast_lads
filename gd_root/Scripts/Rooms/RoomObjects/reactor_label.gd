extends Label3D

var coolant = 0
var call_once = true

func _process(_delta: float) -> void:
	text = "Pressure: " + str(coolant) + "/100"
	if coolant == 100 or Global.reactor_stable == true:
		text = "Stabilized"
		if call_once:
			Global._set_reactor_state(true)
			call_once = false
