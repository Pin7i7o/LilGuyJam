extends Resource
class_name BaseBulletStrategy

@export var texture: Texture2D = preload("res://Assets/Characters/Weapons/Player/laser.png")

func apply_bullet_upgrade(_bullet: Bullet) -> void:
	pass

func apply_weapon_mod(_weapon: BaseWeapon) -> void:
	pass
