extends Control

onready var scene_tree: = get_tree()
onready var pause_overlay: ColorRect = get_node("SpørgsmålMenu")

var paused: = false setget set_paused

func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
	
