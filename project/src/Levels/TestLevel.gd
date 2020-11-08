extends Node2D

var fire_rate = 0.15
var since_last_fire : float

var bullet_scene = load("res://src/Shared/PlayerBullet.tscn")

func _ready():
	since_last_fire = fire_rate

func _process(delta):
	$Camera2D.position = $Player.position
	if Input.is_action_pressed("fire"):
		_process_attack(delta)
	pass


func _process_attack(delta):
	since_last_fire += delta
	if (Input.is_action_pressed("fire") and since_last_fire > fire_rate):
		since_last_fire = 0
		_fire()

func _fire():
	var spawns = get_tree().get_nodes_in_group("bulletspawns1")
	for spawn in spawns:
		var bullet = bullet_scene.instance()
		bullet.position = spawn.position
		bullet.scale.x = 3
		bullet.scale.y = 3
		add_child(bullet)
		print("bullet created")
