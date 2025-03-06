extends StateManager

func _update(_delta: float) -> void:
	_apply_gravity(false)
	_run()
	_shoot()
	
	if !blackboard.get_var(BBNames.attack_input):
		dispatch("&toGround")
	
	if agent.is_on_floor():
		if blackboard.get_var(BBNames.jump_input) && current_jump == 0:
			_jump()
	else:
		coyote_timer.start()
		dispatch("&toAir")
