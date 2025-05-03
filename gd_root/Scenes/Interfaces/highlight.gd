extends Sprite2D


func _ready() -> void:
	if Global.tutorial_completed == false:
		visible = true
	else:
		visible = false
