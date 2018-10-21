extends Control

func _process(delta):
	var entity_count = get_tree().get_nodes_in_group("entity").size()
	$V/entity_count.text = str("Entities:	", entity_count)
	var projectile_count = get_tree().get_nodes_in_group("projectile").size()
	$V/projectile_count.text = str("Projectiles:	", projectile_count)