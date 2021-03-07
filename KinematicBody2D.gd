extends KinematicBody2D

const DREJ = 180
const MOVE = 150
const ACCELERATION = 0.05
const DECELERATION = 0.03

var motion = Vector2(0,0)

var screen_size
var screen_buffer = 8


func _ready():
	screen_size = get_viewport_rect().size


func _process(delta):
	if Input.is_action_pressed("ui_left"):
		rotation_degrees -= DREJ * delta
	if Input.is_action_pressed("ui_right"):
		rotation_degrees += DREJ * delta	
	
	var movedir = Vector2(1,0).rotated(rotation)
	
	if Input.is_action_pressed("ui_up"):
		motion = motion.linear_interpolate(movedir, ACCELERATION)
	else:
		motion = motion.linear_interpolate(Vector2(0,0), DECELERATION)
		
	position += motion * MOVE * delta
	
	position.x = wrapf(position.x, -screen_buffer, screen_size.x + screen_buffer)
	position.y = wrapf(position.y, -screen_buffer, screen_size.y + screen_buffer)



func _on_Hitbox_area_entered(area):
	if area.is_in_group("ironMeteor"):
		get_tree().get_current_scene().get_node("UserInterface/userInterface").visible = true
		get_tree().paused = true
		Global.score += 5
		area.damage(1)
		print(Global.score)
