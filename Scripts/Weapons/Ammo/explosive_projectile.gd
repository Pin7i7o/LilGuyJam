extends Projectile
class_name ExplosiveProjectile

@onready var hurtbox: Area2D = $Hurtbox
@onready var collision_shape_2d: CollisionShape2D = $Hurtbox/CollisionShape2D

@onready var sprite_2d: Sprite2D = $Sprite2D

func _on_body_entered(_body: Node2D) -> void:
	call_deferred("_enable_hurtbox")
	
	timer.start(0.5)
	projectile_speed = 0.0
	sprite_2d.visible = false
	
	for entity in hurtbox.get_overlapping_bodies():
		print("BOOOOM")

func _enable_hurtbox() -> void:
	hurtbox.visible = true
