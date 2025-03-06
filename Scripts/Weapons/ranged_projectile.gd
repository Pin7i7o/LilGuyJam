class_name RangedProjectile
extends RigidBody2D

@export var ranged_stats: WeaponStats

func _ready() -> void:
	linear_velocity.x = ranged_stats.R_BULLET_SPEED
