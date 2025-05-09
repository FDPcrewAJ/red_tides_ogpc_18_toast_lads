extends Node2D


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_exit_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", Global.previous_scene)

func _input(_event: InputEvent):
	if Input.is_action_pressed("exit"):
		get_tree().call_deferred("change_scene_to_file", Global.previous_scene)

func reset_all_pipes():
	$PipeButtonNode/PipeButton.reset_water()
	$PipeButtonNode2/PipeButton2.reset_water()
	$PipeButtonNode3/PipeButton3.reset_water()
	$PipeButtonNode4/PipeButton4.reset_water()
	$PipeButtonNode5/PipeButton5.reset_water()
	$PipeButtonNode6/PipeButton6.reset_water()
	$PipeButtonNode7/PipeButton7.reset_water()
	$PipeButtonNode8/PipeButton8.reset_water()
	$PipeButtonNode9/PipeButton9.reset_water()
	$PipeButtonNode10/PipeButton10.reset_water()
	$PipeButtonNode11/PipeButton11.reset_water()
	$PipeButtonNode12/PipeButton12.reset_water()
	$PipeButtonNode13/PipeButton13.reset_water()
	$PipeButtonNode14/PipeButton14.reset_water()
	$PipeButtonNode15/PipeButton15.reset_water()
	$PipeButtonNode16/PipeButton16.reset_water()
	
