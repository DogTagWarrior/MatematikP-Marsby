extends CollisionShape2D

var mouse_over = false

func _input(event):
	if mouse_over and event.is_pressed() and event.button_index == BUTTON_LEFT:
		print("Clicked")
		
func _on_castle_mouse_entered():
	mouse_over = true	
	
func _on_castle_mouse_exited():
	mouse_over = false
