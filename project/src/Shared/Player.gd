extends KinematicBody2D

export var constant_movement : Vector2
export var max_velocity_orthogonal : float
export var acceleration : float
export var deceleration : float

var base_movement : Vector2

func _ready():
	base_movement = Vector2(0, 0)
	pass # Replace with function body.

func _process(delta):
	_process_movement()
	pass

func _process_movement():
	if Input.is_action_pressed("move_left"):
		base_movement.x = clamp(base_movement.x - acceleration, -max_velocity_orthogonal, max_velocity_orthogonal)
	elif !Input.is_action_pressed("move_right"):
		base_movement.x = clamp(base_movement.x + deceleration, -max_velocity_orthogonal, 0)
	if Input.is_action_pressed("move_right"):
		base_movement.x = clamp(base_movement.x + acceleration, -max_velocity_orthogonal, max_velocity_orthogonal)
	elif !Input.is_action_pressed("move_left"):
		base_movement.x = clamp(base_movement.x - deceleration, 0, max_velocity_orthogonal)
	if Input.is_action_pressed("move_up"):
		base_movement.y = clamp(base_movement.y + acceleration, -max_velocity_orthogonal, max_velocity_orthogonal)
	elif !Input.is_action_pressed("move_down"):
		base_movement.y = clamp(base_movement.y - deceleration, 0, max_velocity_orthogonal)
	if Input.is_action_pressed("move_down"):
		base_movement.y = clamp(base_movement.y - acceleration, -max_velocity_orthogonal, max_velocity_orthogonal)
	elif !Input.is_action_pressed("move_up"):
		base_movement.y = clamp(base_movement.y + deceleration, -max_velocity_orthogonal, 0)
	move_and_slide(base_movement + constant_movement, Vector2(0, 0), false, 10, 0.7, false)
	_process_sprite_change()

func _process_sprite_change():
	if base_movement.x < -max_velocity_orthogonal / 2:
		$AnimatedSprite.play("left_max")
	elif base_movement.x < 0:
		$AnimatedSprite.play("left")
	elif base_movement.x == 0:
		$AnimatedSprite.play("idle")
	elif base_movement.x <= max_velocity_orthogonal / 2:
		$AnimatedSprite.play("right")
	else:
		$AnimatedSprite.play("right_max")
