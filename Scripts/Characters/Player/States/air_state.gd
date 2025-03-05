extends StateManager

var current_jump: int = 0

func _update(_delta: float) -> void:
	if !coyote_timer.is_stopped():
		if blackboard.get_var(BBNames.jump_input) && current_jump == 0:
			jump()
			current_jump = 0
	
	_apply_gravity(false)
	air_move()
	
	if agent.velocity.y > 0:
		_apply_gravity(true)
		
	print(agent.velocity.y)
	
	if agent.is_on_floor():
		dispatch("&toGround") 
	
func air_move() -> void:
	var direction: Vector2 = blackboard.get_var(BBNames.direction_var)

	if not is_zero_approx(direction.x):
		agent.velocity.x = move_toward(agent.velocity.x, player_stats.SPEED * direction.x, player_stats.AIR_ACCELERATION)
		agent.animated_sprite_2d.flip_h = direction.x < 0
	else:
		agent.velocity.x = move_toward(agent.velocity.x, 0, player_stats.AIR_FRICTION)
		
	agent.move_and_slide()
	
func jump() -> void:
	if current_jump < player_stats.MAX_JUMPS:
		agent.velocity.y = -player_stats.JUMP
		current_jump += 1

	
