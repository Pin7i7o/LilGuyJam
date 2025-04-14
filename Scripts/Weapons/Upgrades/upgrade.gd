extends Node2D
class_name Upgrade

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var sfx_pickup: AudioStreamPlayer2D = $Sfx
@onready var pick_up_timer: Timer = $Timer

var bullet_strat: BaseBulletStrategy

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		sfx_pickup.play()
		body.weapon.upgrades.append(bullet_strat)
		body.weapon.upgrades_lifetime_timer.start()
		pick_up_timer.start(0.1)

func _on_timer_timeout() -> void:
	queue_free()
