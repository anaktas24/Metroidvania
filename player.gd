extends CharacterBody2D

#Declaring Variables
const SPEED = 550
const jump_power = -2000
const acc = 50
const friction = 70
var gravity =120
const max_jumps = 2
var current_jumps = 1


func _physics_process(delta):
	var input_direction: Vector2 = input()
	if input_direction != Vector2.ZERO:
		accelerate(input_direction)
		#play_animation()
	else:
		add_friction()
		#play_animation()
	player_movement()
	jump()

func input()-> Vector2:
	var input_direction = Vector2.ZERO
	input_direction.x =  Input.get_axis("ui_left", "ui_right")
	input_direction = input_direction.normalized()
	return input_direction
func accelerate(direction):
	velocity = velocity.move_toward(SPEED * direction, acc)

func add_friction():
	velocity = velocity.move_toward(Vector2.ZERO, friction)
	#func play_animation():
func player_movement():
	move_and_slide()
	
func jump():
	if Input.is_action_just_pressed("ui_up"):
		if current_jumps < max_jumps:
			velocity.y = jump_power
			current_jumps += 1
	else:
		velocity.y += gravity
	if is_on_floor():
		current_jumps = 1
