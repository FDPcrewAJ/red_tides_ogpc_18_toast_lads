extends Area2D

var filled = false

func reset():
	filled = false


func _process(_delta: float) -> void:
	if get_parent().full == true:
		filled = true
	else:
		filled = false
	
	if has_overlapping_areas() == true:
		if get_overlapping_areas()[0].filled == true:
			if self.name == "Area2D":
				get_parent().active1 = true
				get_parent().neighbor1 = get_overlapping_areas()[0].get_parent()
		if get_overlapping_areas()[0].filled == true:
			if self.name == "Area2D2":
				get_parent().active2 = true
				get_parent().neighbor2 = get_overlapping_areas()[0].get_parent()
		if get_overlapping_areas()[0].filled == true:
			if self.name == "Area2D3":
				get_parent().active3 = true
				get_parent().neighbor3 = get_overlapping_areas()[0].get_parent()
		if get_overlapping_areas()[0].filled == true:
			if self.name == "Area2D4":
				get_parent().active4 = true
				get_parent().neighbor3 = get_overlapping_areas()[0].get_parent()
	else:
		if self.name == "Area2D":
			get_parent().active1 = false
		if self.name == "Area2D2":
			get_parent().active2 = false
		if self.name == "Area2D3":
			get_parent().active3 = false
	if overlaps_area($"../../../StartArea2D") == true:
		get_parent().startFull = true
