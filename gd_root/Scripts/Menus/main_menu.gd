extends Control

@onready var devTools: Button = $"MarginContainer/HBoxContainer/VBoxContainer/Level Select"
@onready var settings: Control = $settings
@onready var credits = $credits
@onready var tutorial_skip: Control = $tutorial_skip


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	Global.music_control.playing = false
	Global.reset_game()


func _process(_delta):
	if Input.is_action_pressed("devKey"):
		devTools.visible = true
	else:
		devTools.visible = false


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_new_game_pressed() -> void:
	tutorial_skip.show()


func _on_continue_pressed() -> void:
	pass


func _on_settings_pressed() -> void:
	settings.visible = true
	#Global.previous_scene = get_tree().current_scene.scene_file_path
	#get_tree().change_scene_to_file("res://Scenes/Menus/settings.tscn")


func _on_level_select_pressed() -> void:
	Global.previous_scene = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file("res://Scenes/Menus/level_select_menu.tscn")


func _on_credits_pressed():
	credits.visible = true


func _on_yes_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/testingLevels/fire_puzzle.tscn")
	Global.list_collected = true
	Global.watch_collected = true
	Global.timer_active = true
	Global.music_control.playing = true
	Global.music_control.get_stream_playback().switch_to_clip(3)


func _on_no_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Final Levels/tutorial_facility_exterior.tscn")
	Global.new_game = true
	Global.music_control.playing = true
	Global.music_control.get_stream_playback().switch_to_clip(1)
