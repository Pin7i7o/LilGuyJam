extends BaseBulletStrategy
class_name FireRateBulletStrategy

@export var fire_rate: float

var name: String = "Fire_Rate+"

func apply_upgrade(_bullet: Bullet, weapon: Node2D) -> void:
	weapon.fire_rate_timer.wait_time = fire_rate
	
