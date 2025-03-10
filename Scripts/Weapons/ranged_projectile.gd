class_name BaseProjectile
extends Area2D

@export var stats: WeaponStats

var projectile_direction = Vector2.RIGHT

func _process(delta: float) -> void:
	position += projectile_direction * stats.BULLET_SPEED
	
func _on_body_entered(body: Node2D) -> void:
	queue_free()
