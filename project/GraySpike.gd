class_name GraySpike
extends BaseEnemy

onready var is_inflicting = false
var inflicting_body

# Called when the node enters the scene tree for the first time.
func _ready():
	hitpoints = 120
	reward = 100

func _process(delta):
	if is_inflicting:
		inflicting_body.inflict(1)

func inflict(damage):
	hitpoints = clamp(hitpoints - damage, 0, 9999)
	print("Remaining hitpoints: ", hitpoints)
	if (hitpoints == 0):
		_kill()

func _kill():
	$CollisionShape2D.queue_free()
	$Animation.play("death")
	rotate(rand_range(0, 2 * PI))
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

func _on_HurtArea_body_exited(body):
	if body.is_in_group("player"):
		is_inflicting = false
