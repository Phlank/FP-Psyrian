class_name EnemyBullet
extends Area2D

onready var speed = 10
onready var damage = 0
onready var is_impacted = false

onready var scroll_velocity = 0
onready var angle = 0

func set_scroll_velocity(velocity):
	scroll_velocity = velocity

func _physics_process(delta):
	position += (speed * Vector2(1, 0) + Vector2(0, -scroll_velocity)).rotated(angle)

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "impact":
		queue_free()


func _on_EnemyBullet_body_entered(body):
	if body.is_in_group("player") and !is_impacted:
		body.inflict(5)
		speed = 0
		$AnimatedSprite.play("impact")
		rotate(rand_range(0, 2 * PI))
		is_impacted = true
