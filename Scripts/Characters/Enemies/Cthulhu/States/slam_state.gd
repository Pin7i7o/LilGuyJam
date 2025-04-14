extends BossStateManager

func _enter() -> void:
	super()
	_spawn_hand()
	agent.sfx_scream.play()

func _update(_delta: float) -> void:
	if _check_slam_counter():
		dispatch("&toIdle")

func _exit() -> void:
	_despawn_hand()
