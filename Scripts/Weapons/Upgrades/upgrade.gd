extends Area2D

@export var bullet_strat: BaseBulletStrategy


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.weapon.upgrades.append(bullet_strat)
		body.weapon.upgrades_lifetime_timer.start()
		queue_free()
