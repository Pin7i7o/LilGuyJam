extends BossStateManager

func _enter() -> void:
	super()
	_spawn_worms()

func _update(_delta: float) -> void:
	if !_check_worms():
		dispatch("&toIdle")
