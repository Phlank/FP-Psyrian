class_name WeaponInfo
extends Node

enum WeaponNames { PLASMA_CANNON }

var plasma_cannon_lvl_1_scene = preload("res://src/Weapons/PlasmaCannonLvl1.tscn")
var plasma_cannon_lvl_2_scene = preload("res://src/Weapons/PlasmaCannonLvl2.tscn")
var plasma_cannon_lvl_3_scene = preload("res://src/Weapons/PlasmaCannonLvl3.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func get_projectile(weapon, level: int) -> Node2D:
	if (weapon == WeaponNames.PLASMA_CANNON):
		if level == 1:
			return plasma_cannon_lvl_1_scene.instance()
		if level == 2:
			return plasma_cannon_lvl_2_scene.instance()
		if level == 3:
			return plasma_cannon_lvl_3_scene.instance()
	print("Could not find weapon " + str(weapon) + " with level " + str(level) + " in WeaponInfo")
	return plasma_cannon_lvl_1_scene.instance()
