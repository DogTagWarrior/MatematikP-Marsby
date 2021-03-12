extends KinematicBody2D

const DREJ = 180
const MOVE = 150
const ACCELERATION = 0.05
const DECELERATION = 0.03

var motion = Vector2(0,0)

var screen_size
var screen_buffer = 8
var rng = RandomNumberGenerator.new()

func _ready():
	screen_size = get_viewport_rect().size


func _process(delta):
	if Input.is_action_pressed("ui_left"):
		rotation_degrees -= DREJ * delta
	if Input.is_action_pressed("ui_right"):
		rotation_degrees += DREJ * delta	
	
	var movedir = Vector2(1,0).rotated(rotation)
	
	if Input.is_action_just_pressed("ui_up"):
		$raketLyd.play()
	if Input.is_action_just_released("ui_up"):
		$raketLyd.stop()
	
	
	if Input.is_action_pressed("ui_up"):
		motion = motion.linear_interpolate(movedir, ACCELERATION)
	else:
		motion = motion.linear_interpolate(Vector2(0,0), DECELERATION)
		
	position += motion * MOVE * delta
	
	position.x = wrapf(position.x, -screen_buffer, screen_size.x + screen_buffer)
	position.y = wrapf(position.y, -screen_buffer, screen_size.y + screen_buffer)
func _on_Hitbox_area_entered(area):
	rng.randomize()
	var my_random_number = rng.randf_range(1, 3)
	if area.is_in_group("ironMeteor"):
		get_tree().get_current_scene().get_node("UserInterface/userInterface" + str(int(my_random_number))).visible = true
		get_tree().paused = true
		area.damage(1)
		print(Global.score)
	
	if area.is_in_group("Meteor"):
		get_tree().get_current_scene().get_node("UserInterface/userInterface5").visible = true
		queue_free()
		Global.score = 0


func _on_A_pressed():
	get_tree().get_current_scene().get_node("UserInterface/userInterface1").visible = false 
	get_tree().paused = false

func _on_B_pressed():
	get_tree().get_current_scene().get_node("UserInterface/userInterface1").visible = false 
	get_tree().paused = false
	Global.score += 1


func _on_A2_pressed():
	get_tree().get_current_scene().get_node("UserInterface/userInterface2").visible = false 
	get_tree().paused = false
	Global.score += 1


func _on_B2_pressed():
	get_tree().get_current_scene().get_node("UserInterface/userInterface2").visible = false 
	get_tree().paused = false


func _on_C2_pressed():
	get_tree().get_current_scene().get_node("UserInterface/userInterface2").visible = false 
	get_tree().paused = false


func _on_A3_pressed():
	get_tree().get_current_scene().get_node("UserInterface/userInterface3").visible = false 
	get_tree().paused = false



func _on_B3_pressed():
	get_tree().get_current_scene().get_node("UserInterface/userInterface3").visible = false 
	get_tree().paused = false
	Global.score += 1


func _on_C3_pressed():
	get_tree().get_current_scene().get_node("UserInterface/userInterface3").visible = false 
	get_tree().paused = false


func _on_A4_pressed():
	get_tree().change_scene("res://Main world.tscn")
