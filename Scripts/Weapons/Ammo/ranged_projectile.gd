class_name BaseProjectile
extends Area2D

var projectile_speed: float
var projectile_direction = Vector2.RIGHT

func _process(_delta: float) -> void:
	position += transform.x * projectile_speed
	
func _on_body_entered(_body: Node2D) -> void:
	queue_free()
