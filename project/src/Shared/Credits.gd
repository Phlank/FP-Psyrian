class_name Credits
extends Node2D

func _on_RichTextLabel_meta_clicked(meta):
	OS.shell_open(meta)
