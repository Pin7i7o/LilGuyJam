class_name RangedProjectile
extends Area2D

@export var stats: WeaponStats
@export var group_names: GroupNames

var projectile_direction = Vector2.RIGHT

func _process(delta: float) -> void:
	position += projectile_direction * stats.R_BULLET_SPEED

	
