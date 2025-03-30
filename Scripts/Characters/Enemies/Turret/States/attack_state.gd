extends TurretStateManager

func _update(_delta: float) -> void:
	_shoot()
	
	if agent.hp <= 0:
		_die()

func _on_atkbox_body_exited(body: Node2D) -> void:
	if body is Player:
		dispatch("&toScout")

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Player:
		body._die()

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area is Bullet:
		area.curent_pierce_count +=1
		_take_damage()
