class_name Fade
extends Node2D

signal faded_in
signal faded_out

func _ready():
	pass # Replace with function body.

func play(value):
	$AnimationPlayer.play(value)

func fade_in():
	$AnimationPlayer.play("fade_in")
	hide()

func fade_out():
	show()
	$AnimationPlayer.play("fade_out")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_in":
		emit_signal("faded_in")
	else:
		emit_signal("faded_out")
