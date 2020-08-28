extends KinematicBody2D

const FRICTION = 500
const ACCELERATION = 600
const MAX_SPEED = 140

var velocity = Vector2.ZERO

func _ready():
	pass # Replace with function body.

func _process(delta):
	map_inputs(delta)
	move()
	
func map_inputs(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)

func move():
	velocity = move_and_slide(velocity)
