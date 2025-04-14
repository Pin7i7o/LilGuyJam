extends WormStateManager

@export var death_anim_timer: Timer

func _enter() -> void:
	super()
	death_anim_timer.start(0.5)
	agent.sfx_death.play()

func _on_death_anim_timeout() -> void:
	_die()
