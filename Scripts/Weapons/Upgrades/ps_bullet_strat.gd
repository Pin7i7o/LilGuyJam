extends BaseBulletStrategy
class_name PierceSpeedBulletStrategy

@export var pierce_count: float
@export var bullet_speed: float

var name: String = "Pierce_Speed"

func apply_upgrade(bullet: Bullet, _weapon: Node2D) -> void:
	bullet.max_pierce_count = pierce_count
	bullet.bullet_speed *= bullet_speed 
	
