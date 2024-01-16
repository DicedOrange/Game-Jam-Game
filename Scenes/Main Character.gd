extends CharacterBody2D


const max_speed = 400
const acceleration = 1000
const friction = 800

var input = Vector2.ZERO

func _physics_process(delta):
	player_movement(delta)

func get_input():
	input.x = int(input.is_action_pressed("ui_right")) - int(input.is_action_pressed("ui_left"))
	input.y = int(input.is_action_pressed("ui_down")) - int(input.is_action_pressed("ui_up"))
	return input.normalized()

func player_movement(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * delta * acceleration)
		velocity = velocity.limit_length(max_speed)
		
		move_and_slide()
