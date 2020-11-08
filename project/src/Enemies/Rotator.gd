class_name Rotator
extends BaseEnemy

export var velocity : float
export var acceleration : float

onready var is_inflicting = false
var inflicting_body

func _ready():
	hitpoints = 100
	reward = 50
	contact_damage = 1

func _process(delta):
	if is_inflicting:
		inflicting_body.inflict(1)

func start_action():
	pass

func stop_action():
	pass

func inflict(damage):
	hitpoints = clamp(hitpoints - damage, 0, 9999)
	print("Remaining hitpoints: ", hitpoints)
	if (hitpoints == 0):
		_kill()

func _kill():
	$CollisionShape2D.queue_free()
	$Animation.play("death")

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
