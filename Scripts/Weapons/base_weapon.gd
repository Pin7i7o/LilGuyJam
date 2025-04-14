extends Node2D
class_name BaseWeapon

@export var weapon_stats: WeaponStats
@export var group_names: GroupNames
@export var player_input: PlayerInput

@onready var upgrades_lifetime_timer: Timer = $Timers/UpgradesLifetime
@onready var fire_rate_timer: Timer = $Timers/FireRate
@onready var marker_2d: Marker2D = $Marker2D
@onready var sfx_fireball: AudioStreamPlayer2D = $Fireball

var bullet_scene: PackedScene = preload("res://Scenes/Weapons/bullet.tscn")
var bullet_parent: Node2D

var upgrades: Array[BaseBulletStrategy] = []

var has_spread: bool = false
var rotation_offset: float = 0

func _ready() -> void:
	bullet_parent = get_tree().get_first_node_in_group(group_names.bullets_parent_group)
	assert(bullet_parent != null, "No bullet node found")
	
	fire_rate_timer.wait_time = weapon_stats.fire_rate

func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	
	if !upgrades.is_empty():
		for upgrade in upgrades:
			upgrade.apply_weapon_mod(self)

func _get_player_direction(direction: Vector2) -> Vector2:
	if direction.is_zero_approx():
		return player_input.input_direction_history.front()
	else: 
		return direction
		
func _is_on_cooldown() -> bool:
	if fire_rate_timer.is_stopped():
		return false
	else:
		return true

func shoot() -> void:
	if !_is_on_cooldown():
		if has_spread:
			spawn_bullet(-rotation_offset)
			spawn_bullet(0.0)
			spawn_bullet(rotation_offset)
		else :
			spawn_bullet(0.0)
		
		fire_rate_timer.start()

func spawn_bullet(_rotation_offset: float) -> void:
	var bullet: Bullet = bullet_scene.instantiate()
	bullet_parent.add_child(bullet)
	
	bullet.position = marker_2d.global_position
	bullet.rotation_degrees = rotation_degrees + _rotation_offset
	bullet.bullet_speed = weapon_stats.bullet_speed
	
	if has_spread:
		bullet.lifetime.start(0.5)
	else:
		bullet.lifetime.start(3.0)
	
	for upgrade in upgrades:
		upgrade.apply_bullet_upgrade(bullet)
	
	sfx_fireball.play()

func _on_upgrades_lifetime_timeout() -> void:
	if upgrades.is_empty():
		return
	else:
		upgrades.clear()
		fire_rate_timer.wait_time = weapon_stats.fire_rate
		has_spread = false
		
