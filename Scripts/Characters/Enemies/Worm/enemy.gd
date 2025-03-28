extends Enemy
class_name WormEnemy

func move() -> void:
	if wall_ray.is_colliding():
		_change_direction()
	
	if direction.is_equal_approx(Vector2.RIGHT):
		if global_position.x >= right_bound.x:
			_change_direction()
	
	if direction.is_equal_approx(Vector2.LEFT):
		if global_position.x <= left_bound.x:
			_change_direction()
	
	velocity.x = move_toward(velocity.x, enemy_stats.SPEED * direction.x, enemy_stats.ACCELERATION)
	move_and_slide()

func _change_direction() -> void:
	direction.x = -direction.x
	wall_ray.position.x = -wall_ray.position.x 
	wall_ray.rotation_degrees += 180
