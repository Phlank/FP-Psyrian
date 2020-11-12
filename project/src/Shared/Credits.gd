class_name Credits
extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		$Fade.fade_out()

func _on_RichTextLabel_meta_clicked(meta):
	OS.shell_open(meta)

func _on_Fade_faded_out():
	get_tree().change_scene("res://src/Shared/Title.tscn")
