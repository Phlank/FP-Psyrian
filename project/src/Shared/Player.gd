class_name Player
extends KinematicBody2D

export var health : int
export var constant_movement : Vector2
export var max_velocity_orthogonal : float
export var acceleration : float
export var deceleration : float
var gun_level : int

var base_movement : Vector2

onready var vulnerable = true
onready var dead = false

var bullet_scene = load("res://src/Shared/PlayerBullet.tscn")

signal health_changed(health)
signal died()

func _ready():
	gun_level = 1
	base_movement = Vector2(0, 0)
	pass # Replace with function body.

func _process(delta):
	if !dead:
		_process_movement(delta)
		_process_bullet_spawns()
		

func _process_movement(delta):
	if Input.is_action_pressed("move_left"):
		base_movement.x = clamp(base_movement.x - acceleration, -max_velocity_orthogonal, max_velocity_orthogonal)
	if Input.is_action_pressed("move_right"):
		base_movement.x = clamp(base_movement.x + acceleration, -max_velocity_orthogonal, max_velocity_orthogonal)
	if not Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		if base_movement.x > 0:
			base_movement.x = clamp(base_movement.x - deceleration, 0, max_velocity_orthogonal)
		elif base_movement.x < 0:
			base_movement.x = clamp(base_movement.x + deceleration, -max_velocity_orthogonal, 0)
	if Input.is_action_pressed("move_up"):
		base_movement.y = clamp(base_movement.y - acceleration, -max_velocity_orthogonal, max_velocity_orthogonal)
	if Input.is_action_pressed("move_down"):
		base_movement.y = clamp(base_movement.y + acceleration, -max_velocity_orthogonal, max_velocity_orthogonal)
	if not Input.is_action_pressed("move_down") and not Input.is_action_pressed("move_up"):
		if base_movement.y < 0:
			base_movement.y = clamp(base_movement.y + deceleration, -max_velocity_orthogonal, 0)
		elif base_movement.y > 0:
			base_movement.y = clamp(base_movement.y - deceleration, 0, max_velocity_orthogonal)
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

func _process_bullet_spawns():
	$BulletSpawn1.position = position + Vector2(-5, 0)
	$BulletSpawn2.position = position + Vector2(5, 0)

func inflict(damage):
	if vulnerable:
		health = clamp(health - damage, 0, 9999)
		print(health)
		emit_signal("health_changed", health)
		if (health == 0):
			_kill()

func bound_position(new_position : Vector2):
	position = new_position
	base_movement = Vector2(0, 0)

func _kill():
	dead = true
	vulnerable = false
	emit_signal("died")
	$AnimatedSprite.play("death")
	$DeathSound.play()
