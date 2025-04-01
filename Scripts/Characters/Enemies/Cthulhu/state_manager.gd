extends LimboState
class_name BossStateManager

@export var animation_name: StringName

var enemy_stats: BossEnemyStats
var damage_taken: float
var next_phase: bool


func _enter() -> void:
	agent.animated_sprite_2d.play(animation_name)
	enemy_stats = agent.stats
	
	next_phase = false
	damage_taken = 0
	
func _physics_process(_delta: float) -> void:
	if damage_taken >= 300:
		next_phase = true

func _spawn_hand() -> void:
	var hand: Hand = agent.hand_scene.instantiate()
	agent.hand_parent.add_child(hand)
	
	hand.apply_scale(Vector2(13, 13))
	hand.slam_downwards_speed = enemy_stats.SLAM_DOWNWARDS_SPEED
	hand.slam_upwards_speed = enemy_stats.SLAM_UPWARDS_SPEED

	match agent.slam_phase_counter:
		1.0:
			hand.slam_cooldown = enemy_stats.SLAM_COOLDOWN
			hand.slam_downwards_speed_multiplier = 1.0
		2.0:
			hand.slam_cooldown = enemy_stats.SLAM_COOLDOWN * enemy_stats.SLAM_2_COOLDOWN_MULTIPLIER
			hand.slam_downwards_speed_multiplier = enemy_stats.SLAM_2_DOWNWARDS_SPEED_MULTIPLIER	
		3.0:
			hand.slam_cooldown = enemy_stats.SLAM_COOLDOWN * enemy_stats.SLAM_3_COOLDOWN_MULTIPLIER
			hand.slam_downwards_speed_multiplier = enemy_stats.SLAM_3_DOWNWARDS_SPEED_MULTIPLIER
		_:
			pass

func _despawn_hand() -> void:
	if agent.hand_parent.get_child_count() > 0:
		agent.hand_parent.get_child(0).queue_free()

func _check_slam_counter() -> bool:
	if EventsManager.get_slam_counter() >= 1.0:
		EventsManager.set_slam_counter(0.0)
		return true
		
	return false

func _get_random_direction() -> int:
	return (randi() % 2) * 2 -1

func _spawn_worms() -> void:
	var markers: Array[Node] = agent.worm_markers.get_children()
	
	for marker in markers:
		var worm: EnemyWorm = agent.worm_scene.instantiate()
		agent.worm_parent.add_child(worm)
		
		worm.global_position = marker.global_position
		worm.has_bounds = false
		worm.direction = Vector2(_get_random_direction(), 0)

func _check_worms() -> bool:
	if agent.worm_parent.get_child_count() == 0:
		return false
		
	return true

func _spawn_turrets() -> void:
	var markers: Array[Node] = agent.turret_markers.get_children()
	
	for marker in markers:
		var turret: EnemyTurret = agent.turret_scene.instantiate()
		agent.turret_parent.add_child(turret)
		
		turret.global_position = marker.global_position

func _check_turrets() -> bool:
	if agent.turret_parent.get_child_count() == 0:
		return false
		
	return true

func _take_damage() -> void:
	agent.hp -= 25
	damage_taken += 25

func _get_next_phase() -> void:
	match agent.enemy_phase.front():
		"slam1":
			agent.slam_phase_counter += 1
			dispatch("&toSlam")
			agent.enemy_phase.pop_front()
		"slam2":
			agent.slam_phase_counter += 1
			dispatch("&toSlam")
			agent.enemy_phase.pop_front()
		"slam3":
			agent.slam_phase_counter += 1
			dispatch("&toSlam")
			agent.enemy_phase.pop_front()
		"worm":
			dispatch("&toWorm")
			agent.enemy_phase.pop_front()
		"turret":
			dispatch("&toTurret")
			agent.enemy_phase.pop_front()
		"death":
			dispatch("&toDeath")
			agent.enemy_phase.pop_front()
		_:
			print("cant get a match")
