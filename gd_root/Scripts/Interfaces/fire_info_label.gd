extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.one_watered == true:
		if self.name == "fire_info_label1":
			text = "Watered by: Terminal Number " + str(Global.one_fire_acess)
	else:
		if self.name == "fire_info_label1":
			text = ""
	if Global.two_watered == true:
		if self.name == "fire_info_label2":
			text = "Watered by: Terminal Number " + str(Global.two_fire_acess)
	else:
		if self.name == "fire_info_label2":
			text = ""
	if Global.three_watered == true:
		if self.name == "fire_info_label3":
			text = "Watered by: Terminal Number " + str(Global.three_fire_acess)
	else:
		if self.name == "fire_info_label3":
			text = ""
	if Global.four_watered == true:
		if self.name == "fire_info_label4":
			text = "Watered by: Terminal Number " + str(Global.four_fire_acess)
	else:
		if self.name == "fire_info_label4":
			text = ""
	if Global.five_watered == true:
		if self.name == "fire_info_label5":
			text = "Watered by: Terminal Number " + str(Global.five_fire_acess)
	else:
		if self.name == "fire_info_label5":
			text = ""
	if Global.six_watered == true:
		if self.name == "fire_info_label6":
			text = "Watered by: Terminal Number " + str(Global.six_fire_acess)
	else:
		if self.name == "fire_info_label6":
			text = ""
