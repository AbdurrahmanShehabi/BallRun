extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	
	pass
	
func _pressed():
	get_tree().change_scene("res://World2.tscn")
