extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if has_overlapping_areas() == true:
		if self.name == "Area2D":
			get_parent().active1 = true
		if self.name == "Area2D2":
			get_parent().active2 = true
		if self.name == "Area2D3":
			get_parent().active3 = true
	else:
		if self.name == "Area2D":
			get_parent().active1 = false
		if self.name == "Area2D2":
			get_parent().active2 = false
		if self.name == "Area2D3":
			get_parent().active3 = false
