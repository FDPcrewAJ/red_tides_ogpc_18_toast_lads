extends Label


func _ready() -> void:
	text = ""


func _process(_delta: float) -> void:
	if $"..".inputtedID.length() >= 4:
		if $"..".inputtedID == "8475":
			text = "Valid ID!"
			Global.keypad_positive = true;
			$"..".inputtedID = ""
		else:
			text = "Invalid ID."
			$"..".inputtedID = ""
