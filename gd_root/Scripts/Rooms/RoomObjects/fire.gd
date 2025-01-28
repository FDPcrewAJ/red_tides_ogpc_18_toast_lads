extends MeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.one_watered == true:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_3d_area_entered(area: Area3D) -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/main_menu.tscn")
