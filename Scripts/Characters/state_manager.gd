class_name StateManager
extends LimboState

@export var animation_name: StringName

var player_stats: PlayerStats
var coyote_timer: Timer
var current_jump: int
var weapon: Weapon

func _enter() -> void:
	agent.animated_sprite_2d.play(animation_name)
	
	player_stats = agent.stats
	coyote_timer = agent.timer
	current_jump = 0
	weapon = agent.weapon

func _apply_gravity(multiplier: bool) -> void:
	if not agent.is_on_floor():
		if not multiplier:
			agent.velocity.y += player_stats.DEFAULT_GRAVITY
		else:
			agent.velocity.y += player_stats.DEFAULT_GRAVITY * player_stats.GRAVITY_MULTIPLIER

func _jump() -> void:
	if current_jump < player_stats.MAX_JUMPS:
		agent.velocity.y = -player_stats.JUMP
		current_jump += 1
		
func _run() -> void:
	var direction: Vector2 = blackboard.get_var(BBNames.direction_input)

	if not is_zero_approx(direction.x):
		agent.velocity.x = move_toward(agent.velocity.x, player_stats.SPEED * direction.x, player_stats.ACCELERATION)
		agent.animated_sprite_2d.flip_h = direction.x < 0
	else:
		agent.velocity.x = move_toward(agent.velocity.x, 0, player_stats.DECELERATION)
	
	agent.move_and_slide()
	
func _air_move() -> void:
	var direction: Vector2 = blackboard.get_var(BBNames.direction_input)

	if not is_zero_approx(direction.x):
		agent.velocity.x = move_toward(agent.velocity.x, player_stats.SPEED * direction.x, player_stats.AIR_ACCELERATION)
		agent.animated_sprite_2d.flip_h = direction.x < 0
	else:
		agent.velocity.x = move_toward(agent.velocity.x, 0, player_stats.AIR_FRICTION)
		
	agent.move_and_slide()
	
func _shoot() -> void:
	weapon.shoot()
	
