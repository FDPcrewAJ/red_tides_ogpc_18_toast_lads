extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.tutorial_completed == false:
		visible = true
	else:
		visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
