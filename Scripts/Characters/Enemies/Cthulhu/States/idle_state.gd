extends BossStateManager

func _enter() -> void:
	super()
	agent.hitbox.monitoring = true

func _update(delta: float) -> void: 
	if next_phase:
		_get_next_phase()

func _exit() -> void:
	agent.hitbox.monitoring = false

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area is Bullet:
		_take_damage()
