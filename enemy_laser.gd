extends Area2D

@export var speed = 750
@export var ExplosionObj : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position += transform.x * speed * _delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func _on_body_entered(body):
	if body.is_in_group("Player") or body.is_in_group("meteor"):
		body.damage()
		var Ex = ExplosionObj.instantiate()
		Ex.position = self.global_position
		Ex.rotation = self.global_rotation
		get_parent().add_child(Ex)
		queue_free()


