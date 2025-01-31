extends StaticBody2D

var speed = 10
var mHealth = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
#	$CollisionPolygon2D.position = $CollisionPolygon2D.position.move_toward(Vector2(550,350), speed)
	if position.y != 350:
		speed -= 0.1
		$CollisionPolygon2D.rotate(.01)
	if mHealth <= 0:
		queue_free()
	
func damage():
	mHealth -= 1
