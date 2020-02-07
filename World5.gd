extends Node


func _ready():
	#OS.set_window_size(Vector2(1280, 720))
	OS.set_window_resizable(false)
	set_process_input(true)
	
	pass
func _input(event):
	if event.is_action_pressed("Restart"):
		get_tree().change_scene("res://World5.tscn")
	
	pass