class_name PlayerBullet
extends Area2D

onready var speed = 400
onready var damage = 5
onready var is_impacted = false

func _ready():
	add_to_group("bullets")

func _physics_process(delta):
	position += -transform.y * speed * delta

func _on_PlayerBullet_body_entered(body):
	if (body.is_in_group("enemies") or body.is_in_group("bosses")) and !is_impacted:
		body.inflict(5)
		speed = 0
		$AnimatedSprite.play("impact")
		rotate(rand_range(0, 2 * PI))
		is_impacted = true

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "impact":
		queue_free()
