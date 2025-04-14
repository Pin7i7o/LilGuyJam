extends BossStateManager

@export var spawner_timer: Timer

func _enter() -> void:
	super()
	agent.sfx_scream.play()
	call_deferred("_spawn_worms")

func _update(_delta: float) -> void:
	if !_check_worms():
		dispatch("&toIdle")
