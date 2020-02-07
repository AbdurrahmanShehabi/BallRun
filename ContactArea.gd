extends Area2D
var nyeh = false

func _on_ContactArea_body_enter( body ):
	nyeh = true
	pass # replace with function body


func _on_ContactArea_body_exit( body ):
	nyeh = false
	pass # replace with function body
	
func nyeh():
	return nyeh
