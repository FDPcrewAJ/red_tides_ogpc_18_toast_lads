extends Control

@onready var devTools = $"Level Select"

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _process(_delta):
	if Input.is_action_pressed("devKey"):
		devTools.visible = true
	else:
		devTools.visible = false


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Final Levels/facility_exterior.tscn")
	Global.new_game = true


func _on_continue_pressed() -> void:
	pass


func _on_settings_pressed() -> void:
	Global.previous_scene = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file("res://Scenes/Menus/settings.tscn")


func _on_level_select_pressed() -> void:
	Global.previous_scene = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file("res://Scenes/Menus/level_select_menu.tscn")
