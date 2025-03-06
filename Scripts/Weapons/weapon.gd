class_name Weapon
extends Node2D

@export var ranged_projectile: PackedScene
@export var group_names: GroupNames

var projectiles_parent: Node2D

func _ready() -> void:
	projectiles_parent = get_tree().get_first_node_in_group(group_names.projectiles_parent_group)
	assert(projectiles_parent != null, "No projectiles node found")
	
	
func shoot() -> void:
	var projectile = ranged_projectile.instantiate() as Area2D
	projectiles_parent.add_child(projectile)
	
	projectile.position = global_position
