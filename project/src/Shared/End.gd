extends Node2D

func _ready():
	$Fade.fade_in()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		$Fade.fade_out()

func _on_Fade_faded_out():
	get_tree().change_scene("res://src/Shared/Title.tscn")
