extends Label

var filled = true
var complete = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if complete == true:
		text = "Flow Complete"
		Global.flow_puzzle_completed = true
	else:
		text = "Flow Incomplete"
		Global.flow_puzzle_completed = false
