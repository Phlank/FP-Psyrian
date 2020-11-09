extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Tween.interpolate_property($TitleLabel, "rect_scale", Vector2(1, 1), Vector2(2, 2), 2, Tween.TRANS_LINEAR, Tween.EASE_IN)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
