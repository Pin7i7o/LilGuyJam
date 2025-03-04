class_name StateManager
extends LimboState

@export var animation_name: StringName

var player_stats: PlayerStats

func _enter() -> void:
	agent.animated_sprite_2d.play(animation_name)
	player_stats = agent.stats

func run() -> Vector2:
	var direction: Vector2 = blackboard.get_var(BBNames.direction_var)

	if not is_zero_approx(direction.x):
		agent.velocity.x = move_toward(agent.velocity.x, player_stats.SPEED * direction.x, player_stats.ACCELERATION)
		agent.animated_sprite_2d.flip_h = direction.x < 0
	else:
		agent.velocity.x = move_toward(agent.velocity.x, 0, player_stats.DECELERATION)
	
	agent.move_and_slide()
	return agent.velocity
