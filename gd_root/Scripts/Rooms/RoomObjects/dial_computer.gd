extends MeshInstance3D

func _ready():
	if typeof(Global.lastpos) != TYPE_INT:
		$"../player"._set_last_pos()

func _process(_delta):
	if Global.current_object == "ConsoleBody":
		if Input.is_action_just_pressed("click"):
			Global.lastpos = $"../player".position
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Interfaces/dial_puzzle_interface.tscn")
