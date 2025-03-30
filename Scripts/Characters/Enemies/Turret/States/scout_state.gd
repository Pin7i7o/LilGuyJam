extends TurretStateManager

func _update(_delta: float) -> void:
	if agent.hp <= 0:
		_die()

func _on_atkbox_body_entered(body: Node2D) -> void:
	if body is Player:
		dispatch("&toAtk")
