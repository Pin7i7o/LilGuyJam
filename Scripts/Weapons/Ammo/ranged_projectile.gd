class_name BaseProjectile
extends Area2D

var projectile_speed: float
var projectile_direction = Vector2.RIGHT

func _process(delta: float) -> void:
	position += projectile_direction * projectile_speed
	
func _on_body_entered(body: Node2D) -> void:
	queue_free()
