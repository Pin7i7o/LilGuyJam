extends PlayerStateManager

func _update(_delta: float) -> void:
	if agent.velocity.y > 0:
		_apply_gravity(true)
	else:
		_apply_gravity(false)
		
	_air_move()
	
	if !coyote_timer.is_stopped():
		if blackboard.get_var(BBNames.jump_input) && current_jump == 0:
			_jump()
	
	if agent.is_on_floor():
		dispatch("&toGround") 
	
	if blackboard.get_var(BBNames.attack_input):
		dispatch("&toAtk")
