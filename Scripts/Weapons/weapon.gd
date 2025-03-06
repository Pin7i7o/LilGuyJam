class_name Weapon
extends Node2D

@export var ranged_projectile: PackedScene
@export var group_names: GroupNames
@export var player_input: PlayerInput

var projectiles_parent: Node2D

func _ready() -> void:
	projectiles_parent = get_tree().get_first_node_in_group(group_names.projectiles_parent_group)
	assert(projectiles_parent != null, "No projectiles node found")

func _get_projectile_direction(direction: Vector2) -> Vector2:
	if direction.is_zero_approx():
		return player_input.input_direction_history.front()
	else: 
		return direction

func shoot() -> void:
	var projectile = ranged_projectile.instantiate() as Area2D
	projectiles_parent.add_child(projectile)
	
	projectile.position = global_position
	projectile.projectile_direction = _get_projectile_direction(player_input.input_direction)
