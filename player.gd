extends KinematicBody2D

const SPEED_X = 950
var speed_y = 0

var pressed

var jump_count = 0
const MAX_JUMP_COUNT = 1

const JUMP_FORCE = 800
const GRAVITY = 2000

var velocity = Vector2()

func _ready():
	set_process(true)
	set_process_input(true)
	pressed = false

func _input(event):
	if jump_count < MAX_JUMP_COUNT and event.is_action_pressed("jump"):
		speed_y = -JUMP_FORCE
		jump_count = jump_count + 1	
		get_parent().play("JumpSound")
	if event.is_action_pressed("ExitLevel"):
		get_tree().change_scene("res://LevelSelect.tscn")
	
	pass

func _process(delta):
	var direction = Vector2()

	if (Input.is_action_pressed("ui_right") or pressed == true):
		pressed = true
		direction.x +=  SPEED_X 

	set_pos(get_pos() + direction.normalized() * SPEED_X * delta)
	
	speed_y += GRAVITY * delta
	velocity.y = speed_y * delta
	var movement_remainder = move(velocity)
	
	if is_colliding():
		var normal = get_collision_normal()
		var final_movement = normal.slide(movement_remainder)
		speed_y = normal.slide(Vector2(0, speed_y)).y
		
		move(final_movement)
		if normal == Vector2(0,-1):
			jump_count = 0