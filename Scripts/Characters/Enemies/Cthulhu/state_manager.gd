extends LimboState
class_name BossStateManager

@export var animation_name: StringName

var enemy_stats: BossEnemyStats
var damage_taken: float
var next_phase: bool
var slam_counter: float

func _enter() -> void:
	agent.animated_sprite_2d.play(animation_name)
	
	enemy_stats = agent.stats
	
	next_phase = false
	damage_taken = 0
	
func _physics_process(_delta: float) -> void:
	if damage_taken == 300:
		next_phase = true

func _take_damage() -> void:
	agent.hp -= 25
	damage_taken += 25
	print(agent.hp)
	print(damage_taken)

func _get_next_phase() -> void:
	match agent.enemy_phase.front():
		"slam1":
			dispatch("&toSlam")
			slam_counter += 1
		"slam2":
			dispatch("&toSlam")
			slam_counter += 1
		"slam3":
			dispatch("&toSlam")
			slam_counter += 1
		"worm":
			dispatch("&toWorm")
		"turret":
			dispatch("&toTurret")
		_:
			print("can get a match")
