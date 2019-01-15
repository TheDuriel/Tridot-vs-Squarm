extends RigidBody2D

var n = load("res://Enemy/Enemy.tscn")

func _physics_process(delta):
	#distance timeout
	var player_pos = get_tree().get_nodes_in_group("player")[0].position
	if position.distance_to(player_pos) > 2048:
		queue_free()

func hit():
	var b = n.instance()
	get_parent().add_child(b)
	b.position = position
	var a = n.instance()
	get_parent().add_child(a)
	a.position = position + Vector2(10, 10)
	queue_free()