extends Label

var filled = true
var complete = false


func _process(_delta: float) -> void:
	if complete == true:
		text = "Flow Complete"
		Global._set_flow_puzzle(true)
	else:
		text = "Flow Incomplete"
		Global.flow_puzzle_completed = false
