class_name Boss
extends BaseEnemy

enum State {DIVING_LEFT, DIVING_RIGHT, DIVING_FORWARD, IDLE_BULLETS}

var state = State.IDLE_BULLETS
var state_finished = false
var active = false
var velocity = Vector2(0, 0)
var acceleration = Vector2(0, 0)
var large_gun_cooldown = 1.0
var small_gun_cooldown = 0.2
var large_gun_last_shot = 1.0
var small_gun_last_shot = 0.2
var large_gun_active = true
var small_gun_active = true
var state_time_elapsed = 0
var is_inflicting = false
var inflicting_body

signal fire_large_gun
signal fire_small_gun
signal death

var starting_x
var starting_y

var boss_bullet = preload("res://src/Weapons/BossBullet.tscn")
var enemy_bullet = preload("res://src/Weapons/EnemyBullet.tscn")

func _ready():
	hitpoints = 3000
	reward = 1000
	contact_damage = 2
	starting_x = self.global_position.x
	starting_y = self.global_position.y

func _process(delta):
	if is_inflicting:
		inflicting_body.inflict(contact_damage)
	if active:
		large_gun_last_shot += delta
		small_gun_last_shot += delta
		if (state_finished):
			change_state()
		else:
			process_state(delta)
		if large_gun_last_shot >= large_gun_cooldown and large_gun_active:
			emit_signal("fire_large_gun")
			large_gun_last_shot = 0.0
		if small_gun_last_shot >= small_gun_cooldown and small_gun_active:
			emit_signal("fire_small_gun")
			small_gun_last_shot = 0.0
		_process_physics(delta)
	else:
		pass

func change_state():
	# Force the next state to be different than the previous one
	state_time_elapsed = 0
	var current_state = state
	while (state == current_state):
		state = State.values()[randi() % State.size()]
	print("Boss state changed to " + str(state))
	# Set up state initial conditions
	state_finished = false
	if (state == State.DIVING_LEFT):
		velocity = Vector2(-30000, 0)
		acceleration = -velocity
		small_gun_active = false
	elif (state == State.DIVING_RIGHT):
		velocity = Vector2(30000, 0)
		acceleration = -velocity
		small_gun_active = false
	elif (state == State.DIVING_FORWARD):
		velocity = Vector2(0, 30000)
		acceleration = -velocity
		small_gun_active = false
	elif (state == State.IDLE_BULLETS):
		velocity = Vector2(0, 0)
		acceleration = Vector2(0, 0)
		small_gun_active = true

func _process_physics(delta):
	move_and_slide(velocity * delta)
	velocity += acceleration * delta

func process_state(delta):
	state_time_elapsed += delta
	if (state == State.IDLE_BULLETS and state_time_elapsed > 4.0):
		state_finished = true
	elif state == State.DIVING_FORWARD and position.y < starting_y:
		position.y = starting_y
		velocity = Vector2(0, 0)
		acceleration = Vector2(0, 0)
		state_finished = true
	elif state == State.DIVING_LEFT and position.x > starting_x:
		position.x = starting_x
		velocity = Vector2(0, 0)
		acceleration = Vector2(0, 0)
		state_finished = true
	elif state == State.DIVING_RIGHT and position.x < starting_x:
		position.x = starting_x
		velocity = Vector2(0, 0)
		acceleration = Vector2(0, 0)
		state_finished = true
	pass

func inflict(damage):
	hitpoints = clamp(hitpoints - damage, 0, 9999)
	if (hitpoints == 0):
		_kill()

func _kill():
	$CollisionPolygon2D.disabled = true
	$Animation.hide()
	$Animation.rotate(rand_range(0, 2 * PI))
	$HurtArea.disconnect("area_entered", self, "_on_HurtArea_body_entered")
	emit_signal("death")
	$CollisionPolygon2D.disabled = true
	$HurtArea/CollisionPolygon2D2.disabled = true
	active = false

func _on_HurtArea_body_entered(body):
	if body.is_in_group("player"):
		is_inflicting = true
		inflicting_body = body
		body.inflict(contact_damage)
	pass # Replace with function body.

func _on_HurtArea_body_exited(body):
	if body.is_in_group("player"):
		is_inflicting = false

