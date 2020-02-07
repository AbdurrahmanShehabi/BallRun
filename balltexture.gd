extends Sprite

const ROTATION_SPEED = 6
var pressed

func _ready():
	set_process(true)
	pressed = false
	pass
	
func _process(delta):
	if (Input.is_action_pressed("ui_right") or pressed == true):
		rotate( -1 * ROTATION_SPEED * delta)
		pressed = true
