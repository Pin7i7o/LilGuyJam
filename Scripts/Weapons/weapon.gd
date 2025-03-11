class_name Weapon
extends Node2D

@export var group_names: GroupNames
@export var player_input: PlayerInput
@export var fire_rate_timer: Timer
@export var weapon_stats: WeaponStats

@onready var sprite_2d: Sprite2D = $Sprite2D

var projectiles_parent: Node2D

func _ready() -> void:
	projectiles_parent = get_tree().get_first_node_in_group(group_names.projectiles_parent_group)
	assert(projectiles_parent != null, "No projectiles node found")
	
	fire_rate_timer.wait_time = weapon_stats.fire_rate
	sprite_2d.texture = weapon_stats.weapon_sprite
	#sprite_2d.position = Vector2(17.0, 0.0)

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())

func _get_player_direction(direction: Vector2) -> Vector2:
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
		var projectile: BaseProjectile = weapon_stats.bullet_scene.instantiate()
		projectiles_parent.add_child(projectile)
		
		
		var direction: Vector2 = _get_player_direction(player_input.input_direction)
		
		projectile.position = sprite_2d.global_position
		projectile.rotation = rotation
		projectile.projectile_speed = weapon_stats.bullet_speed
		
		fire_rate_timer.start()
