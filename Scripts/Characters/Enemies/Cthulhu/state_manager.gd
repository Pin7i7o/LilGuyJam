extends LimboState
class_name BossStateManager

@export var animation_name: StringName

var enemy_stats: BossEnemyStats
var damage_taken: float
var next_phase: bool

var slam_phase_counter: float = 0

func _enter() -> void:
	enemy_stats = agent.stats
	
	next_phase = false
	damage_taken = 0
	
func _physics_process(_delta: float) -> void:
	if damage_taken == 300:
		next_phase = true

func _spawn_hand() -> void:
	var hand: Hand = agent.hand_scene.instantiate()
	agent.hand_parent.add_child(hand)
	
	hand.apply_scale(Vector2(13, 13))
	hand.slam_cooldown = enemy_stats.SLAM_COOLDOWN
	hand.slam_downwards_speed = enemy_stats.SLAM_DOWNARDS_SPEED
	hand.slam_upwards_speed = enemy_stats.SLAM_UPWARDS_SPEED

	match slam_phase_counter:
		2:
			hand.slam_cooldown_multiplier = enemy_stats.SLAM_2_COOLDOWN_MULTIPLIER
			hand.slam_downwards_speed_multiplier = enemy_stats.SLAM_2_DOWNARDS_SPEED_MULTIPLIER	
		3:
			hand.slam_cooldown_multiplier = enemy_stats.SLAM_3_COOLDOWN_MULTIPLIER
			hand.slam_downwards_speed_multiplier = enemy_stats.SLAM_3_DOWNARDS_SPEED_MULTIPLIER
		_:
			pass

func _despawn_hand() -> void:
	if agent.hand_parent.get_child_count() > 0:
		agent.hand_parent.get_child(0).queue_free()

func _check_slam_counter() -> bool:
	if GlobalVariables.slam_counter >= 5:
		GlobalVariables.slam_counter = 0
		return true
		
	return false

func _take_damage() -> void:
	agent.hp -= 25
	damage_taken += 25
	print("HP: ", agent.hp)
	print("Dmg Taken: ", damage_taken)

func _get_next_phase() -> void:
	match agent.enemy_phase.front():
		"slam1":
			dispatch("&toSlam")
			slam_phase_counter += 1
		"slam2":
			dispatch("&toSlam")
			slam_phase_counter += 1
		"slam3":
			dispatch("&toSlam")
			slam_phase_counter += 1
		"worm":
			dispatch("&toWorm")
		"turret":
			dispatch("&toTurret")
		_:
			print("can get a match")
