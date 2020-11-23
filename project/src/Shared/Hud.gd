class_name Hud
extends CanvasLayer

signal faded_out()
signal faded_in()

func _ready():
	$Fade.fade_in()
	$HealthBar.set_health(100)

func _on_Fade_faded_in():
	emit_signal("faded_in")

func _on_Fade_faded_out():
	emit_signal("faded_out")

func set_health(value: int):
	$HealthBar.set_health(value)
