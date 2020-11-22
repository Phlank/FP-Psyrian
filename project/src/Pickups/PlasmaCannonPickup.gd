class_name PlasmaCannonPickup
extends BasePickup

# Called when the node enters the scene tree for the first time.
func _ready():
	pickup_name = "PLASMA_CANNON_UPGRADE"




func _on_PlasmaCannonPickup_body_entered(body):
	if body.is_in_group("player"):
		$AudioStreamPlayer.play()
	pass # Replace with function body.
