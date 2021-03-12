extends Area2D

var mouse_over = false

func _input(event):
	if mouse_over and event.is_pressed() and event.button_index == BUTTON_LEFT:
		print("Clicked2")
		get_tree().change_scene("res://Tutorial.tscn")
		


func _on_Area2D4_mouse_entered():
	mouse_over = true


func _on_Area2D4_mouse_exited():
	mouse_over = false

