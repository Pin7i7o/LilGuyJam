extends StateManager
#Stand state for the player character
#Controls the player when he is standing, i.e: while moving or idling on the ground

@export var idle_anim: StringName
@export var run_anim: StringName


func _update(_delta: float) -> void:
	_apply_gravity(false)
	_run()
	
	if Vector2.ZERO.is_equal_approx(agent.velocity):
		agent.animated_sprite_2d.play(idle_anim)
	else:
		agent.animated_sprite_2d.play(run_anim)
	
	if agent.is_on_floor():
		if blackboard.get_var(BBNames.jump_input) && current_jump == 0:
			_jump()
	else:
		coyote_timer.start()
		dispatch("&toAir")
		
	if blackboard.get_var(BBNames.attack_input):
		dispatch("&toAtk")
	
	if blackboard.get_var(BBNames.ult_input):
		dispatch("&toUlt")
		
