extends KinematicBody2D
 
var input_direction = 0
var direction = 0
 
var speed_x = 950
var speed_y = 0
const MAX_SPEED = 950

var jump_count = 0
const MAX_JUMP_COUNT = 1

const JUMP_FORCE = 800
const GRAVITY = 2000
var velocity = Vector2()
var nyeh = false
 
func _ready():
	set_process(true)
	set_process_input(true)

func _input(event):
	#var ContactArea = preload("res://ContactArea.gd")
	#var a = ContactArea.new()
	#var nyeh = a.nyeh()
	if jump_count < MAX_JUMP_COUNT and event.is_action_pressed("jump") and nyeh == true:
		speed_y = -JUMP_FORCE
		jump_count = jump_count + 1	
		get_parent().play("JumpSound")
	if event.is_action_pressed("ExitLevel"):
		get_tree().change_scene("res://LevelSelect.tscn")
	
 
func _process(delta):
	if input_direction:
		direction = input_direction  
	if Input.is_action_pressed("ui_right"):
		input_direction = 1
 
	speed_x = clamp(speed_x, 0, MAX_SPEED) 
	speed_y += GRAVITY * delta
	
	velocity.x = speed_x * delta * direction
	velocity.y = speed_y * delta
	var movement_remainder = move(velocity)
	
	if is_colliding():
		var normal = get_collision_normal()
		var final_movement = normal.slide(movement_remainder)
		speed_y = normal.slide(Vector2(0, speed_y)).y
		
		move(final_movement)
		if normal == Vector2(0,-1):
			jump_count = 0

func _on_ContactArea_body_enter( body ):
	nyeh = true
	pass # replace with function body


func _on_ContactArea_body_exit( body ):
	nyeh = false
	pass # replace with function body
