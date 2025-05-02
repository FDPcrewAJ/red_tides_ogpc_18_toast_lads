extends GPUParticles3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.name == "Sprinkler1":
		if Global.one_watered == true:
			visible = true
		else:
			visible = false
	if self.name == "Sprinkler2":
		if Global.two_watered == true:
			visible = true
		else:
			visible = false
	if self.name == "Sprinkler3":
		if Global.three_watered == true:
			visible = true
		else:
			visible = false
	if self.name == "Sprinkler4":
		if Global.four_watered == true:
			visible = true
		else:
			visible = false
	if self.name == "Sprinkler5":
		if Global.five_watered == true:
			visible = true
		else:
			visible = false
	if self.name == "Sprinkler6":
		if Global.six_watered == true:
			visible = true
		else:
			visible = false
