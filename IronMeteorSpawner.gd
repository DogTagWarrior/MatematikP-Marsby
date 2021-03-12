extends Node


var asteroid_scene = load("res://IronMeteor.tscn")

func _ready() -> void:
	_spawn_asteroid()
	
func _spawn_asteroid():
	var asteroid = asteroid_scene.instance()
	
	_set_astoroid_position(asteroid)
	
	add_child(asteroid)


func _set_astoroid_position(asteroid):
	var rect = get_viewport().size
	asteroid.position = Vector2(rand_range(0, rect.x), -100)


func _on_SpawnTimer2_timeout():
	_spawn_asteroid()
