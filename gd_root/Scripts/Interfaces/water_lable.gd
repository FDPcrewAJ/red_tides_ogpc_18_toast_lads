extends Label


func _process(_delta):
	text = "Water: " + str(Global.water_amount)
