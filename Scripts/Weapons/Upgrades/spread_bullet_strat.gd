extends BaseBulletStrategy
class_name SpreadBulletStrategy

@export var rotation_offset: float

var name: String = "Spread"

func apply_weapon_mod(weapon: BaseWeapon) -> void:
	weapon.has_spread = true
	weapon.rotation_offset = rotation_offset
