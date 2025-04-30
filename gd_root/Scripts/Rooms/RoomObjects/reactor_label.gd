extends Label3D

var coolant = 0


func _process(_delta: float) -> void:
	text = "Pressure: " + str(coolant) + "/100"
	if coolant == 100 or Global.reactorStable == true:
		text = "Stabilized"
		Global.reactorStable = true
