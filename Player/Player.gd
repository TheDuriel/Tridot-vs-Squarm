extends KinematicBody2D


	#movement settings
export(int) var move_speed = 200
export(int) var strafe_speed = 150

	#ability settings
export(float) var primary_cooldown = 0.2
var primary_ready = true

var velocity = Vector2()


func _ready():
	$Timers/Primary.wait_time = primary_cooldown


func _physics_process(delta):
	get_ability_input()
	get_movement_input()
	move_and_slide(velocity)


func get_movement_input():

	look_at(get_global_mouse_position())
	rotation -= PI / 2

	velocity = Vector2()

	if Input.is_action_pressed("move_up"):
		velocity.y += move_speed
	if Input.is_action_pressed("move_down"):
		velocity.y -= move_speed
	if Input.is_action_pressed("move_left"):
		velocity.x += strafe_speed
	if Input.is_action_pressed("move_right"):
		velocity.x -= strafe_speed
	
	velocity = velocity.rotated(rotation)


func get_ability_input():
	if Input.is_action_pressed("attack_primary") and primary_ready:
	
		var n = preload("res://Player/Attacks/Bullet.tscn").instance()
		get_parent().add_child(n)
		n.position = position
		n.rotation = rotation
		
		primary_ready = false


func cooldown_finished(type):
	if type == 0: #primary
		primary_ready = true


func hitbox_hit_by_body(body):
	pass


func hitbox_hit_by_area(area):
	pass # replace with function body
