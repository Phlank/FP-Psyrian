class_name Level3
extends Node2D

var win = false
var rng = RandomNumberGenerator.new()
var boss_death_explosions = 0
var max_death_explosions = 20
var boss_dead = false
var boss_dead_time = 0.0

onready var boss_bullet = load("res://src/Weapons/BossBullet.tscn")
onready var enemy_bullet = load("res://src/Weapons/EnemyBullet.tscn")
onready var explosion = load("res://src/Shared/Explosion.tscn")

func _ready():
	$BaseLevel/Player.gun_weapon = $BaseLevel.weapon_info.WeaponNames.PLASMA_CANNON
	$BaseLevel/Player.gun_level = 3

func _process(delta):
	if !$BaseLevel.dead:
		$Camera2D.position = $BaseLevel/PlayerArea.position
	if boss_dead:
		boss_dead_time += delta
		if boss_death_explosions < max_death_explosions:
			make_boss_explosion()
	if boss_dead_time > 5:
		$BaseLevel/Hud/Fade.fade_out()

func make_boss_explosion():
	var position_x = rng.randi_range(-170, 170)
	var position_y = rng.randi_range(-60, 60)
	var local_pos = Vector2(position_x, position_y)
	var global_pos = local_pos + $Boss.global_position
	var angle = rng.randf_range(0, 2 * PI)
	var instance = explosion.instance()
	add_child(instance)
	instance.position = global_pos
	instance.rotation = angle
	boss_death_explosions += 1
	if !$BossDeathPlayer.playing:
		$BossDeathPlayer.play()

func _on_BaseLevel_faded_out():
	if $BaseLevel.dead:
		get_tree().change_scene("res://src/Levels/Level3.tscn")
	else:
		get_tree().change_scene("res://src/Shared/End.tscn")

func _on_Boss_fire_large_gun():
	var bullet1 = boss_bullet.instance()
	var bullet2 = boss_bullet.instance()
	add_child(bullet1)
	add_child(bullet2)
	bullet1.position = $Boss/Gun1.global_position
	bullet2.position = $Boss/Gun2.global_position
	print("Fired large gun")
	$BigBulletSound.play()

func _on_Boss_fire_small_gun():
	var angle1 = rng.randf_range(3 * PI / 4, PI / 4)
	var angle2 = rng.randf_range(3 * PI / 4, PI / 4)
	var bullet1 = enemy_bullet.instance()
	var bullet2 = enemy_bullet.instance()
	add_child(bullet1)
	add_child(bullet2)
	bullet1.position = $Boss/Gun1.global_position
	bullet2.position = $Boss/Gun2.global_position
	bullet1.angle = angle1
	bullet2.angle = angle2
	$SmallBulletSound.play()

func _on_Boss_death():
	boss_dead = true
