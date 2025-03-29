extends WormStateManager

@export var idle_timer: Timer

func _update(_delta: float) -> void:
	if agent.hp <= 0:
		_die()

func _exit() -> void:
	_change_hitbox(false)

func _on_attack_cd_timeout() -> void:
	_change_hitbox(true)
	idle_timer.start(2.0)

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Player:
		body._die()

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area is Bullet:
		area.curent_pierce_count +=1
		_take_damage()

func _on_idle_timer_timeout() -> void:
	dispatch("&toPatrol")
