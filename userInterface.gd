extends Control



func _on_A_pressed():
	get_tree().paused = false
	visible = false


func _on_B_pressed():
	Global.score += 1
	get_tree().paused = false
	get_tree().get_current_scene().get_node("userInterface").visible = false
