extends LimboState
class_name WormStateManager

@export var animation_name: StringName

var enemy_stats: WormEnemyStats
var wall_ray: RayCast2D
var hitbox: CollisionShape2D

var direction: Vector2 = Vector2.RIGHT


func _enter() -> void:
	agent.animated_sprite_2d.play(animation_name)
	
	enemy_stats = agent.stats
	wall_ray = agent.wall_ray
	hitbox = agent.hitbox

func _change_direction() -> void:
	direction.x = -direction.x
	wall_ray.position.x = -wall_ray.position.x 
	wall_ray.rotation_degrees += 180
	
func _change_hitbox(is_attacking: bool) -> void:
	if is_attacking:
		hitbox.shape.set_size(Vector2(32, 61))
	else:
		hitbox.shape.set_size(Vector2.ZERO)
		hitbox.position.y = 0.0

func _patrol() -> void:
	agent.velocity.x = move_toward(agent.velocity.x, enemy_stats.SPEED * direction.x, enemy_stats.ACCELERATION)
	agent.move_and_slide()
	
func _take_damage() -> void:
	agent.hp -= 25

func _die() -> void:
	var random_upgrade: BaseBulletStrategy = agent.upgrades_array.pick_random()
	print(random_upgrade.name)
	
	if random_upgrade != null:
		var upgrade: Upgrade = agent.upgrade_scene.instantiate()
		agent.upgrades_parent.add_child(upgrade)
		
		upgrade.bullet_strat = random_upgrade
		upgrade.sprite_2d.texture = random_upgrade.texture
		upgrade.position = agent.global_position
	
	agent.queue_free()
	
