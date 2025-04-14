extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = ""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"..".inputtedID.length() >= 4:
		if $"..".inputtedID == "8475":
			text = "Valid ID!"
			Global.keypadPositive = true;
			$"..".inputtedID = ""
		else:
			text = "Invalid ID."
			$"..".inputtedID = ""
