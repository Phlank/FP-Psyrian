class_name BaseLevel
extends Node2D

onready var weapon_info = load("res://src/Weapons/WeaponInfo.gd").new()
onready var since_last_fire = 0.0

onready var dead = false
onready var dead_time = 0.0
onready var dead_fade_started = false

onready var scene_movement = 200

signal faded_out()
signal faded_in()
signal player_died()

func _ready():
	$Hud/Fade.fade_in()
	$Hud/HealthBar.set_max($Player.health)
	$Hud/HealthBar.set_health($Player.health)
	$Player.constant_movement = Vector2(0, -scene_movement)

func _process(delta):
	if !dead:
		if Input.is_action_pressed("fire"):
			_process_attack(delta)
		_process_area_movement(delta)
	else:
		dead_time += delta
		if dead_time > 3 and !dead_fade_started:
			$Hud/Fade.fade_out()

func _process_attack(delta):
	var weapon = $Player.gun_weapon
	var fire_rate = weapon_info.get_weapon_delay(weapon)
	since_last_fire += delta
	if (Input.is_action_pressed("fire") and since_last_fire > fire_rate) and !dead:
		since_last_fire = 0
		_fire()

func _fire():
	$FireSoundStreamPlayer.play()
	var projectile = weapon_info.get_projectile($Player.gun_weapon, $Player.gun_level)
	add_child(projectile)
	projectile.position = $Player/BulletSpawnLocation.get_global_position()

func _process_area_movement(delta):
	$PlayerArea.position.y -= scene_movement * delta
	_ensure_player_inside_bounds()

func _ensure_player_inside_bounds():
	var top = $PlayerArea.position.y - 300 + 20
	var bottom = $PlayerArea.position.y + 300 - 20
	var left = $PlayerArea.position.x - 512 + 20
	var right = $PlayerArea.position.x + 512 - 20
	
	# Horizontal bounds
	if $Player.position.x < left:
		$Player.position.x = left
	elif $Player.position.x > right:
		$Player.position.x = right
	# Vertical bounds
	if $Player.position.y < top:
		$Player.position.y = top
	elif $Player.position.y > bottom:
		$Player.position.y = bottom

func _on_PlayerArea_area_exited(area):
	# Bullets
	if area.is_in_group("bullets"):
		area.queue_free()
	if area.is_in_group("enemy_bullets"):
		area.queue_free()

func _on_Player_health_changed(health):
	$Hud/HealthBar.set_health(health)

func _on_PlayerArea_body_entered(body):
	if body.is_in_group("enemies"):
		body.start_action()

func _on_PlayerArea_body_exited(body):
	if body.is_in_group("enemies"):
		body.queue_free()

func _on_Player_died():
	$BackgroundMusicStreamPlayer.stop()
	dead = true
	emit_signal("player_died")

func _on_Hud_faded_out():
	emit_signal("faded_out")

func _on_ShootingShip_bullet_fired(bullet, ship):
	add_child(bullet)
	bullet.position = ship.position
	var ship_position = ship.position
	var player_position = $Player.position
	var angle = Vector2(0, 1).angle_to(ship_position - player_position) - PI / 2
	bullet.angle = angle



