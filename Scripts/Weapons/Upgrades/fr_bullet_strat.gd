extends BaseBulletStrategy
class_name FireRateBulletStrategy

@export var fire_rate: float = 0.15

var name: String = "Fr"

func apply_upgrade(bullet: Bullet, weapon: Node2D) -> void:
	weapon.fire_rate_timer.wait_time = fire_rate
	
