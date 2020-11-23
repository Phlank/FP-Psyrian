class_name ShootingShip
extends BaseEnemy

var bullet = preload("res://src/Weapons/EnemyBullet.tscn")

export var velocity : Vector2
export var acceleration : Vector2

var is_active = false
var is_inflicting = false
var inflicting_body

onready var cooldown = 2
onready var last_fire = 2

signal bullet_fired(bullet, ship)

signal death(score)

func _ready():
	hitpoints = 150
	reward = 120
	contact_damage = 1

func _process(delta):
	last_fire += delta
	if is_inflicting:
		inflicting_body.inflict(1)
	if is_active:
		if last_fire >= cooldown:
			fire_bullet()
			last_fire = 0
	_process_physics(delta)

func _process_physics(delta):
	delta *= 10
	if is_active:
		move_and_slide(velocity * delta)
		velocity += acceleration * delta

func start_action():
	is_active = true

func stop_action():
	is_active = false

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

func fire_bullet():
	var bullet_instance = bullet.instance()
	bullet_instance.scroll_velocity = 200
	emit_signal("bullet_fired", bullet_instance, self)

func _on_Animation_animation_finished():
	if $Animation.animation == "death":
		queue_free()

func _on_HurtArea_body_entered(body):
	if body.is_in_group("player"):
		is_inflicting = true
		inflicting_body = body
		body.inflict(contact_damage)
	pass # Replace with function body.

func _on_HurtArea_body_exited(body):
	if body.is_in_group("player"):
		is_inflicting = false
