extends WormStateManager

func _update(_delta: float) -> void:
	if wall_ray.is_colliding():
		_change_direction()
	
	if direction.is_equal_approx(Vector2.RIGHT):
		if agent.global_position.x >= agent.right_bound.x:
			_change_direction()
	
	if direction.is_equal_approx(Vector2.LEFT):
		if agent.global_position.x <= agent.left_bound.x:
			_change_direction()
			
	_patrol()
	
	if vision_cone_ray.is_colliding():
		dispatch("&toPursuit")
