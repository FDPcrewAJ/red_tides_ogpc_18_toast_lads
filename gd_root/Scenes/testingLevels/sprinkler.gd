extends GPUParticles3D


func _process(_delta: float) -> void:
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
