extends Control
#This should be above any interactable nodes
@onready var label: Label = $Label


func _ready() -> void:
	update_text()


func update_text():
	var event_array = InputMap.action_get_events("interact")
	var event = event_array[0]
	var interact_key = OS.get_keycode_string(event.physical_keycode)
	label.text = "Press " + str(interact_key) + " or Left Mouse to interact"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$Label.hide()

func _show_interactable():
	update_text()
	$Label.show()
