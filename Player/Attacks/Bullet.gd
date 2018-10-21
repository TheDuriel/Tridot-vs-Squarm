extends KinematicBody2D

export(int) var speed = 10
export(int) var lifetime = 300


func _physics_process(delta):
	#motion
	var velocity = Vector2()
	velocity.y += speed
	velocity = velocity.rotated(rotation)
	
	var collision = move_and_collide(velocity)
	
	#collission
	if collision:
		if collision.collider.is_in_group("enemy"):
			collision.collider.queue_free()
			queue_free()
	
	#timeout
	lifetime -= 1
	if lifetime <= 0:
		queue_free()