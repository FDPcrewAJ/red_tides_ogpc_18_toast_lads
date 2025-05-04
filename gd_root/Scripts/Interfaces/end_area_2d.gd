extends Area2D

var filled = false


func _process(_delta: float) -> void:
	if has_overlapping_areas() == true:
		if get_overlapping_areas()[0].filled == true:
			$"../FlowPuzzleLevelLabel".complete = true
