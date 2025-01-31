extends Node2D

var mHealth = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if mHealth <= 0:
		queue_free()
	
func damage():
	mHealth -= 1
