extends Node2D

export (Color,RGB) var mouse_out
export (Color,RGB) var mouse_over


func _process(delta):
	if Global.score == 3:
		$Sprite2.hide()
		$Sprite.show()


func _on_Area2D4_mouse_entered():
	set_modulate(mouse_over)


func _on_Area2D4_mouse_exited():
	set_modulate(mouse_out)
	
