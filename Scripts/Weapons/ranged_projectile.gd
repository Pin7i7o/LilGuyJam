class_name RangedProjectile
extends Area2D

@export var stats: WeaponStats

func _process(delta: float) -> void:
	position += transform.x * stats.R_BULLET_SPEED
