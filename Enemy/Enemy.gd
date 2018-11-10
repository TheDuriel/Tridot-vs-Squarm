extends RigidBody2D

var n = load("res://Enemy/Enemy.tscn")

func _physics_process(delta):
	#distance timeout
	var player_pos = get_tree().get_nodes_in_group("player")[0].position
	if position.distance_to(player_pos) > 2048:
		queue_free()

func hit():
	for i in range(2):
		var b = n.instance()
		get_parent().add_child(n)
		n.position = position
	queue_free()