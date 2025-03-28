extends WormStateManager

func _update(delta: float) -> void:
	print("working")
	dispatch("&toPatrol")
