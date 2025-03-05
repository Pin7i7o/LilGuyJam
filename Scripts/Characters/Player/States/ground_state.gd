extends StateManager
#Stand state for the player character
#Controls the player when he is standing, i.e: while moving or idling on the ground

@export var idle_anim: StringName
@export var run_anim: StringName

var current_jump: int = 0

func _update(_delta: float) -> void:
	var velocity: Vector2 = run()
	
	if Vector2.ZERO.is_equal_approx(velocity):
		agent.animated_sprite_2d.play(idle_anim)
	else:
		agent.animated_sprite_2d.play(run_anim)
		
	if blackboard.get_var(BBNames.jump_var) && agent.is_on_floor() && current_jump == 0:
		jump()
		current_jump = 0

func jump():
	if current_jump < player_stats.MAX_JUMPS:
		agent.velocity.y = -player_stats.JUMP
		current_jump += 1
