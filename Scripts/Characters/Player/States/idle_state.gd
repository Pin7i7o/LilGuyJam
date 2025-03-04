extends StateManager
#Idle state for the player character

func _update(_delta: float) -> void:
	var velocity: Vector2 = run()
	
	if not Vector2.ZERO.is_equal_approx(velocity):
		dispatch("&toMove")
