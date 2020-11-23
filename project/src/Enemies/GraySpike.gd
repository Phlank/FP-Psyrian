class_name GraySpike
extends BaseEnemy

onready var is_inflicting = false
var inflicting_body

signal death(score)

# Called when the node enters the scene tree for the first time.
func _ready():
	hitpoints = 120
	reward = 100

func _process(delta):
	if is_inflicting:
		inflicting_body.inflict(1)

func start_action():
	pass

func inflict(damage):
	hitpoints = clamp(hitpoints - damage, 0, 9999)
	if (hitpoints == 0):
		_kill()

func _kill():
	$CollisionShape2D.disabled = true
	$Animation.play("death")
	$Animation.rotate(rand_range(0, 2 * PI))
	$HurtArea.disconnect("area_entered", self, "_on_HurtArea_body_entered")
	emit_signal("death", reward)

func _on_Animation_animation_finished():
	if $Animation.animation == "death":
		queue_free()

func _on_HurtArea_body_entered(body):
	if body.is_in_group("player"):
		is_inflicting = true
		inflicting_body = body
		body.inflict(contact_damage)

func _on_HurtArea_body_exited(body):
	if body.is_in_group("player"):
		is_inflicting = false
