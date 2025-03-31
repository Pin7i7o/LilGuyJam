extends WormStateManager

@export var attack_preparation_timer: Timer
@export var direction_change_timer: Timer

func _update(_delta: float) -> void:
	_patrol()
	if can_change_direction:
		if left_wall_ray.is_colliding() or right_wall_ray.is_colliding():
			_change_direction()
			direction_change_timer.start(1.0)
	
	if agent.has_bounds:
		if agent.direction.is_equal_approx(Vector2.RIGHT):
			if agent.global_position.x >= agent.right_bound.x:
				print("right bound")
				_change_direction()
		
		if agent.direction.is_equal_approx(Vector2.LEFT):
			if agent.global_position.x <= agent.left_bound.x:
				print("left bound")
				_change_direction()

func _on_atkbox_body_entered(body: Node2D) -> void:
	if body is Player:
		attack_preparation_timer.start(0.5)
		dispatch("&toAtk")

func _on_direction_change_timer_timeout() -> void:
	can_change_direction = true
