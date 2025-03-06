extends StateManager

func _enter() -> void:
	super()
	agent.velocity = Vector2.ZERO

func _update(_delta: float) -> void:
	print("PEW")
