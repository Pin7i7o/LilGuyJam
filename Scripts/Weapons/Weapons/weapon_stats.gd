class_name WeaponStats
extends Resource
#Resource file for the several weapons stats

@export var weapon_sprite: Texture2D
@export var weapon_type: WeaponTypes

@export var damage: float 
@export var bullet_speed: float
@export var fire_rate: float
@export var has_ammo: bool
@export var ammo: float
@export var weapon_range: RangeTypes

@export var bullet_scene: PackedScene

enum WeaponTypes {
	DEFAULT,
	EXPLOSIVE,
	LASER,
	MELEE
}

enum RangeTypes {
	EXTRA_SMALL,
	SMALL,
	MEDIUM,
	HIGH,
}
