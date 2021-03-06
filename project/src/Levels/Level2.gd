class_name Level2
extends Node2D

var win = false

func _ready():
	$BaseLevel/Player.gun_weapon = $BaseLevel.weapon_info.WeaponNames.PLASMA_CANNON
	$BaseLevel/Player.gun_level = 2

func _process(delta):
	if !$BaseLevel.dead:
		$Camera2D.position = $BaseLevel/PlayerArea.position

func _on_WinArea_body_entered(body):
	print("Winner!")
	if body.is_in_group("player"):
		win = true
		$BaseLevel/Hud/Fade.fade_out()

func _on_BaseLevel_faded_out():
	print("Faded out!")
	if $BaseLevel.dead:
		get_tree().change_scene("res://src/Levels/Level2.tscn")
	else:
		print("Changing scene to level 3")
		get_tree().change_scene("res://src/Levels/Level3.tscn")
