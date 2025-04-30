extends Button

var on = false
var wrong_button_name


func _process(_delta) -> void:
	if $"..".wrong_button == true:
		if self.name == wrong_button_name:
			if on == false:
				$".."._wrong_button_off()
	
	if button_pressed:
		on = true
	else:
		on = false
	
	if Global.tile_puzzle_level == 1:
		if self.name == "TileButton5" or self.name == "TileButton10" or self.name == "TileButton15" or self.name == "TileButton20" or self.name == "TileButton23" or self.name == "TileButton26" or self.name == "TileButton29":
			pass
		else:
			if on == true:
				$".."._wrong_button_on()
				wrong_button_name = self.name
	elif Global.tile_puzzle_level == 2:
		if self.name == "TileButton5" or self.name == "TileButton6" or self.name == "TileButton15" or self.name == "TileButton16" or self.name == "TileButton22" or self.name == "TileButton21" or self.name == "TileButton31" or self.name == "TileButton32":
			pass
		else:
			if on == true:
				$".."._wrong_button_on()
				wrong_button_name = self.name
	elif Global.tile_puzzle_level == 3:
		if self.name == "TileButton" or self.name == "TileButton2" or self.name == "TileButton5" or self.name == "TileButton6" or self.name == "TileButton9" or self.name == "TileButton10" or self.name == "TileButton7" or self.name == "TileButton8" or self.name == "TileButton31" or self.name == "TileButton32" or self.name == "TileButton35" or self.name == "TileButton35" or self.name == "TileButton33" or self.name == "TileButton29":
			pass
		else:
			if on == true:
				$".."._wrong_button_on()
				wrong_button_name = self.name
	else:
		if self.name == "TileButton4" or self.name == "TileButton5" or self.name == "TileButton11" or self.name == "TileButton20" or self.name == "TileButton22" or self.name == "TileButton29" or self.name == "TileButton32" or self.name == "TileButton36":
			pass
		else:
			if on == true:
				$".."._wrong_button_on()
				wrong_button_name = self.name
