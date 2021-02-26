extends Node2D

export (Color,RGB) var mouse_out
export (Color,RGB) var mouse_over




func _on_Area2D2_mouse_entered():
	
	set_modulate(mouse_over)
	pass
	



func _on_Area2D2_mouse_exited():
	set_modulate(mouse_out)
	pass
	
