extends Node2D

var fire_rate = 0.1
var since_last_fire : float

onready var score = 0
onready var scene_movement = 200
onready var bullet_scene = load("res://src/Shared/PlayerBullet.tscn")

func _ready():
	$Fade.fade_in()
	$HealthBar.set_health(100)
	since_last_fire = fire_rate
	$Player.constant_movement = Vector2(0, -scene_movement)

func _process(delta):
	$ScoreLabel.rect_position = $PlayerArea.position + Vector2(-500, -270)
	$HealthBar.position = $PlayerArea.position + Vector2(-450, -280)
	$Camera2D.position = $PlayerArea.position
	if Input.is_action_pressed("fire"):
		_process_attack(delta)
	_process_camera_movement(delta)

func _process_attack(delta):
	since_last_fire += delta
	if (Input.is_action_pressed("fire") and since_last_fire > fire_rate):
		since_last_fire = 0
		_fire()

func _fire():
	$FireSound.play()
	var spawns = get_tree().get_nodes_in_group("bulletspawns1")
	for spawn in spawns:
		var bullet = bullet_scene.instance()
		bullet.position = spawn.position
		bullet.scale.x = 3
		bullet.scale.y = 3
		add_child(bullet)
		bullet.add_to_group("bullets")

func _process_camera_movement(delta):
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
	pass # Replace with function body.

func _on_Player_health_changed(health):
	$HealthBar.set_health(health)

func _on_PlayerArea_body_entered(body):
	if body.is_in_group("enemies"):
		body.start_action()
	pass # Replace with function body.

func _on_Rotator_death(score_bonus):
	score += score_bonus
	$ScoreLabel.text = "Score: " + str(score)
	pass # Replace with function body.
