extends Node2D

var selection

func _ready():
	$Fade.fade_in()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		selection = "start"
		$Fade.fade_out()
	if Input.is_action_just_pressed("ui_cancel"):
		selection = "credits"
		$Fade.fade_out()

func _on_Fade_faded_out():
	if selection == "start":
		get_tree().change_scene("res://src/Levels/Level1Story.tscn")
	elif selection == "credits":
		get_tree().change_scene("res://src/Shared/Credits.tscn")
			
