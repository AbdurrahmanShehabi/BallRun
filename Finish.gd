extends Area2D

func _ready():
	connect("body_enter", self, "_on_ball_body_enter")
	
	set_fixed_process(true)
	
	

	
func _on_ball_body_enter(body):
	get_tree().change_scene("res://LevelSelect.tscn")