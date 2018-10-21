extends RigidBody2D

func _physics_process(delta):
	#distance timeout
	var player_pos = get_tree().get_nodes_in_group("player")[0].position
	if position.distance_to(player_pos) > 2048:
		queue_free()