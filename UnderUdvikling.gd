extends Control



func _on_Button_pressed():
	get_tree().get_current_scene().get_node("CanvasLayer/UnderUdvikling").visible = false
