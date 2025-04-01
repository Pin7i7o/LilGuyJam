extends BossStateManager

@export var death_anim_timer: Timer

func _enter() -> void:
	super()
	death_anim_timer.start(3.0)

func _on_death_timer_timeout() -> void:
	GameManager.finish_game()
