extends LimboState
class_name TurretStateManager

@export var animation_name: StringName

var enemy_stats: TurretEnemyStats
var marker_2d: Marker2D
var attack_cd_timer: Timer

func _enter() -> void:
	agent.animated_sprite_2d.play(animation_name)
	
	enemy_stats = agent.stats
	marker_2d = agent.marker_2d
	attack_cd_timer = agent.attack_cd

func _is_on_cooldown() -> bool:
	if attack_cd_timer.is_stopped():
		return false
	else:
		return true

func _shoot() -> void:
	if !_is_on_cooldown():
		var projectile: Projectile = agent.projectile_scene.instantiate()
		agent.projectile_parent.add_child(projectile)
		
		projectile.lifetime.start(5.0)
		projectile.position = marker_2d.global_position
		projectile.projectile_speed = enemy_stats.PROJECTILE_SPEED
		projectile.projectile_speed_multiplier = enemy_stats.PROJECTILE_SPEED_MULTIPLIER
		projectile.projectile_max_height = enemy_stats.PROJECTILE_MAX_HEIGHT
		projectile.atkbox_collision_shape_2d.shape.radius = enemy_stats.PROJECTILE_SCOUT_RANGE
		
		attack_cd_timer.start(enemy_stats.ATTACK_COOLDOWN)

func _take_damage() -> void:
	agent.hp -= 25

func _die() -> void:
	var random_upgrade: BaseBulletStrategy = agent.upgrades_array.pick_random()
	
	if random_upgrade != null:
		var upgrade: Upgrade = agent.upgrade_scene.instantiate()
		agent.upgrades_parent.add_child(upgrade)
		
		upgrade.bullet_strat = random_upgrade
		upgrade.sprite_2d.texture = random_upgrade.texture
		upgrade.position = agent.global_position
	
	agent.queue_free()
	
