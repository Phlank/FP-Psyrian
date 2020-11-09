class_name Rotator
extends BaseEnemy

export var velocity : Vector2
export var acceleration : Vector2

onready var is_active = false
onready var is_inflicting = false
var inflicting_body

signal death(score)

func _ready():
	hitpoints = 20
	reward = 50
	contact_damage = 1
	$Animation.play("idle")

func _process(delta):
	if is_inflicting:
		inflicting_body.inflict(1)
	
	if is_active:
		move_and_slide(velocity)
		velocity += acceleration

#func _process_physics(delta):

func start_action():
	is_active = true

func stop_action():
	is_active = false

func inflict(damage):
	hitpoints = clamp(hitpoints - damage, 0, 9999)
	print("Remaining hitpoints: ", hitpoints)
	if (hitpoints == 0):
		_kill()

func _kill():
	$CollisionShape2D.queue_free()
	$Animation.play("death")
	emit_signal("death", reward)

func _on_Animation_animation_finished():
	if $Animation.animation == "death":
		queue_free()

func _on_HurtArea_body_entered(body):
	print("Body in hurtarea")
	if body.is_in_group("player"):
		is_inflicting = true
		inflicting_body = body
		body.inflict(contact_damage)
	pass # Replace with function body.

func _on_HurtArea_body_exited(body):
	if body.is_in_group("player"):
		is_inflicting = false
