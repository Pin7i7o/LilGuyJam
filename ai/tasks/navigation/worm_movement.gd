@tool
extends BTAction

var enemy: WormEnemy

func _generate_name() -> String:
	return "Moves the enemy, left or right, to a new point with %s units as max_distance" %enemy.max_distance

func _setup() -> void:
	enemy = agent as WormEnemy
	
func _enter() -> void:
	pass
	
func _tick(_delta: float) -> Status:
	enemy.move()
	
	return RUNNING
	
	
	
	
	
	
