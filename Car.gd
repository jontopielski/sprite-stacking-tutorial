extends KinematicBody2D

const SPEED = 130
const ACCELERATION = 5

var velocity = Vector2.ZERO

func _physics_process(delta):
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity = lerp(velocity, input * SPEED, ACCELERATION * delta)
	move_and_slide(velocity)
	if input != Vector2.ZERO:
		$StackedSprite.set_rotation(velocity.angle() - deg2rad(90))
