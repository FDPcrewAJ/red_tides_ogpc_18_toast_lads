extends Control
#This should be above any interactable nodes


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.hide()

func _show_interactable():
	$Label.show()
