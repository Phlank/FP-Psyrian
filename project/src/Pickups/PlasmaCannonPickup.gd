class_name PlasmaCannonPickup
extends BasePickup

# Called when the node enters the scene tree for the first time.
func _ready():
	pickup_name = "PLASMA_CANNON_UPGRADE"

func _on_PlasmaCannonPickup_body_entered(body):
	if body.is_in_group("player"):
		$Sprite.queue_free()
		$AudioStreamPlayer.play()
		$CollisionShape2D.queue_free()

func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.stop()
	queue_free()
