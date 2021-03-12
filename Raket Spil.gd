extends Node

func _process(delta):
	if Global.score == 3:
		get_tree().change_scene("res://youWon.tscn")

