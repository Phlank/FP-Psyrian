class_name Level1
extends Node2D

var win = false

func _ready():
	$BaseLevel/Player.gun_weapon = $BaseLevel.weapon_info.WeaponNames.PLASMA_CANNON

func _process(delta):
	if !$BaseLevel.dead:
		$Camera2D.position = $BaseLevel/PlayerArea.position

func _on_PlayerArea_body_entered(body):
	if body.is_in_group("enemies"):
		body.start_action()

func _on_Player_died():
	$BackgroundMusic.stop()
	$BaseLevel.dead = true

func _on_Fade_faded_out():
	if $BaseLevel.dead:
		get_tree().change_scene("res://src/Levels/Level1.tscn")
	else:
		get_tree().change_scene("res://src/Shared/Level2.tscn")

func _on_WinArea_body_entered(body):
	if body.is_in_group("player"):
		win = true
		$BaseLevel/Fade.fade_out()


