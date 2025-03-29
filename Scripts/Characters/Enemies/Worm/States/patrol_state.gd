extends WormStateManager

@export var attack_preparation_timer: Timer

func _enter() -> void:
	super()
	_change_hitbox(false)

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

func _on_atkbox_body_entered(body: Node2D) -> void:
	if body is Player:
		attack_preparation_timer.start(0.5)
		dispatch("&toAtk")
	
