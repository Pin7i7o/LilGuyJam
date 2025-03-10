class_name Weapon
extends Node2D

@export var ranged_projectile: PackedScene
@export var group_names: GroupNames
@export var player_input: PlayerInput
@export var fire_rate_timer: Timer
@export var weapon_stats: WeaponStats

var projectiles_parent: Node2D

func _ready() -> void:
	projectiles_parent = get_tree().get_first_node_in_group(group_names.projectiles_parent_group)
	assert(projectiles_parent != null, "No projectiles node found")
	
	fire_rate_timer.wait_time = weapon_stats.FIRE_RATE

func _get_projectile_direction(direction: Vector2) -> Vector2:
	if direction.is_zero_approx():
		return player_input.input_direction_history.front()
	else: 
		return direction
		
func _is_on_cooldown() -> bool:
	if fire_rate_timer.is_stopped():
		return false
	else:
		return true
	
func shoot() -> void:
	if !_is_on_cooldown():
		var projectile: Area2D = ranged_projectile.instantiate()
		projectiles_parent.add_child(projectile)
		
		var direction: Vector2 = _get_projectile_direction(player_input.input_direction)
		
		projectile.position = global_position
		projectile.projectile_direction = direction
		projectile.rotation = direction.angle()
		
		fire_rate_timer.start()
