extends TurretStateManager

@export var death_anim_timer: Timer

func _enter() -> void:
	super()
	death_anim_timer.start(1.5)

func _on_death_anim_timeout() -> void:
	_die()
