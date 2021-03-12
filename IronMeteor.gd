extends Area2D
export var minSpeed: float = 40
export var maxSpeed: float = 60
export var minRotationRate: float = -30
export var maxRotationRate: float = 30
export var life: int = 0 


var speed: float = 0
var rotationRate: float = 0

func _ready():
	speed = rand_range(minSpeed, maxSpeed)
	rotationRate = rand_range(minRotationRate, maxRotationRate) 
	
func _physics_process(delta):
	rotation_degrees += rotationRate * delta
	
	
	position.y += speed * delta

func damage(amount: int):
	life -= amount
	if life <= 0:
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
