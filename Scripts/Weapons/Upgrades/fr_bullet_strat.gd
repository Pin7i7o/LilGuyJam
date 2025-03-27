extends BaseBulletStrategy
class_name FireRateBulletStrategy

@export var fire_rate: float

var name: String = "Fire_Rate+"

func apply_weapon_mod(weapon: BaseWeapon) -> void:
	weapon.fire_rate_timer.wait_time = fire_rate
	
