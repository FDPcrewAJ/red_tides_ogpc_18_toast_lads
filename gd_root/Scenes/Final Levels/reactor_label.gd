extends Label3D

var coolant = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "Coolant: " + str(coolant) + "/100"
	if coolant == 100 or Global.reactorStable == true:
		text = "Stabilized"
		Global.reactorStable = true
