class_name BaseProjectile
extends Projectile
	
func _on_body_entered(_body: Node2D) -> void:
	queue_free()
