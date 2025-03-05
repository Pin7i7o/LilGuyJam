extends StateManager
#Stand state for the player character
#Controls the player when he is standing, i.e: while moving or idling on the ground

@export var idle_anim: StringName
@export var run_anim: StringName

var current_jump: int = 0

func _update(_delta: float) -> void:
	_apply_gravity(false)
	run()
	
	if Vector2.ZERO.is_equal_approx(agent.velocity):
		agent.animated_sprite_2d.play(idle_anim)
	else:
		agent.animated_sprite_2d.play(run_anim)
	
	if agent.is_on_floor():
		if blackboard.get_var(BBNames.jump_input) && current_jump == 0:
			jump()
			current_jump = 0
	else:
		coyote_timer.start()
		dispatch("&toAir")

func jump() -> void:
	if current_jump < player_stats.MAX_JUMPS:
		agent.velocity.y = -player_stats.JUMP
		current_jump += 1
		
func run() -> void:
	var direction: Vector2 = blackboard.get_var(BBNames.direction_var)

	if not is_zero_approx(direction.x):
		agent.velocity.x = move_toward(agent.velocity.x, player_stats.SPEED * direction.x, player_stats.ACCELERATION)
		agent.animated_sprite_2d.flip_h = direction.x < 0
	else:
		agent.velocity.x = move_toward(agent.velocity.x, 0, player_stats.DECELERATION)
	
	agent.move_and_slide()
