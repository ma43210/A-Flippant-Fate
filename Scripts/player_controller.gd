extends CharacterBody2D
class_name PlayerController
@export var speed = 10.0
@export var jump_power = 10.0

var speed_multiplier = 30.0
var jump_multiplier = -30.0
var direction = 0
var flipped = false
var flipped_grav = 1
var dead = false :
	set(value):
		dead = value
		if value == true:
			trigger_death()
#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if flipped:
		flipped_grav = -1
		
	if not flipped:
		flipped_grav = 1
		
	if not is_on_floor():
		velocity += get_gravity() * flipped_grav * delta


	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power * jump_multiplier * flipped_grav

			
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed * speed_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)
	# Flips gravity.
	if Input.is_action_just_pressed("flip_grav") and is_on_floor():
		if not flipped:
			flipped = true
			up_direction = Vector2.DOWN
		elif flipped:
			flipped = false
			up_direction = Vector2.UP
	
	move_and_slide()
	
func trigger_death():
	if GameManager.checkpoint !=  Vector2(-999, 999):
		velocity.y = 0
		flipped = false
		up_direction = Vector2.UP
		global_position = GameManager.checkpoint
