extends CharacterBody2D
class_name EnemyBoss

@export var stats: BossEnemyStats
@export var enemy_phase: Array[StringName]
@export var animated_sprite_2d: AnimatedSprite2D
@export var hitbox: Area2D

var hp: float

func _ready() -> void:
	hp = stats.HP
