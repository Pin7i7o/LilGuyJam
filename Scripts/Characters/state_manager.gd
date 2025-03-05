class_name StateManager
extends LimboState

@export var animation_name: StringName

var player_stats: PlayerStats
var coyote_timer: Timer

func _enter() -> void:
	agent.animated_sprite_2d.play(animation_name)
	player_stats = agent.stats
	coyote_timer = agent.timer
	print(player_stats.DEFAULT_GRAVITY)
	print(player_stats.JUMP)
	
func _apply_gravity(multiplier: bool) -> void:
	if not agent.is_on_floor():
		if not multiplier:
			agent.velocity.y += player_stats.DEFAULT_GRAVITY
		else:
			agent.velocity.y += player_stats.DEFAULT_GRAVITY * player_stats.GRAVITY_MULTIPLIER
