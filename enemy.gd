extends CharacterBody2D

@export var rot_speed: float = 5.0
@export var EnemyLaser : PackedScene
@export var ExplosionObj : PackedScene
@export var cooldown = 0.75
var run_speed = 100
var player = null
var can_shoot = false
var eHealth = 3
var canFollow = false

func _physics_process(delta):
	shoot()
	velocity = Vector2.ZERO
	
	if player:
		var target_dir = (player.global_position - global_position).normalized()
		var current_dir = Vector2(1, 0).rotated(self.global_rotation)
		self.global_rotation = current_dir.lerp(target_dir, rot_speed * delta).angle()
		if canFollow == true:
			velocity = position.direction_to(player.position) * run_speed
	move_and_slide()
	if eHealth == 0:
		queue_free()
		Global.enemieskilled += 1

func _on_far_detection_body_entered(body):
	if body.is_in_group("Player"):
		player = body
		canFollow = true
		can_shoot = true

func _on_far_detection_body_exited(body):
	if body.is_in_group("Player"):
		canFollow = false
		player = null
		
func shoot():
	if can_shoot:
		$Fire1.play("enemyLaserShoot")
		$Fire2.play("enemyLaserShoot")
		var E = EnemyLaser.instantiate()
		owner.add_child(E)
		E.transform = $Shoot1.global_transform
		var E2 = EnemyLaser.instantiate()
		owner.add_child(E2)
		E2.transform = $Shoot2.global_transform
		$CoolDown.start()
		can_shoot = false

func _on_cool_down_timeout():
	can_shoot = true

func _on_fire_1_animation_finished():
	if $Fire1.animation == "enemyLaserShoot":
		$Fire1.animation = "enemyLoad"
		
func _on_fire_2_animation_finished():
	if $Fire2.animation == "enemyLaserShoot":
		$Fire2.animation = "enemyLoad"
		
func damage():
	eHealth -= 1





