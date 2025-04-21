extends Label

var complete = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if complete == true:
		Global.flow_puzzle_completed = true
		text = "Flow Complete"
	else:
		Global.flow_puzzle_completed = true
		text = "Flow Incomplete"
