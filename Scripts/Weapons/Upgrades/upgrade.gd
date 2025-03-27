extends Node2D

@export var bullet_strat: BaseBulletStrategy
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	sprite_2d.texture = bullet_strat.texture
	
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.weapon.upgrades.append(bullet_strat)
		body.weapon.upgrades_lifetime_timer.start()
		queue_free()
