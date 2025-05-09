extends Control

@onready var timer: Timer = $"ending UI/Timer"
@onready var text_1: Label = $"ending UI/text_1"
@onready var text_2: Label = $"ending UI/text_2"
@onready var main_menu_button: Button = $"ending UI/main_menu_button"
@onready var death_video: VideoStreamPlayer = $death_video


var time_num = 0

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Global.music_control.playing = false

func _on_death_video_finished() -> void:
	timer.start()
	death_video.queue_free()


func _on_timer_timeout() -> void:
	match time_num:
		0:
			pass
		1:
			text_1.show()
		2:
			text_2.show()
		3:
			main_menu_button.show()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	time_num += 1


func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/title_screen.tscn")
