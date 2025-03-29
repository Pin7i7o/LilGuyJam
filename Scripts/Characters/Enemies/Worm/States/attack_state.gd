extends WormStateManager

@export var idle_timer: Timer

func _on_attack_cd_timeout() -> void:
	_change_hitbox(true)
	idle_timer.start(3.0)

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Player:
		print("SHING SHING")

func _on_idle_timer_timeout() -> void:
	dispatch("&toPatrol")
