extends BossStateManager

func _enter() -> void:
	super()
	_spawn_turrets()

func _update(_delta: float) -> void:
	if !_check_turrets():
		dispatch("&toIdle")
