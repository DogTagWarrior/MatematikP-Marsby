extends Area2D

var mouse_over = false

func _input(event):
	if mouse_over and event.is_pressed() and event.button_index == BUTTON_LEFT:
		print("Clicked")
		get_tree().get_current_scene().get_node("CanvasLayer/UnderUdvikling").visible = true

func _on_Area2D_mouse_entered():
	mouse_over = true
	
func _on_Area2D_mouse_exited():
	mouse_over = false
