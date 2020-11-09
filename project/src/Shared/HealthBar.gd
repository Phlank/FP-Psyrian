class_name HealthBar
extends Node2D

func set_max(value):
	$ProgressBar.max_value = value

func set_health(new_value):
	$ProgressBar.value = new_value
