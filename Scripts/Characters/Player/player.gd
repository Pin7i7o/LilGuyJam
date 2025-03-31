extends CharacterBody2D
class_name Player

@export var animated_sprite_2d: AnimatedSprite2D
@export var stats: PlayerStats
@export var coyote_time_timer: Timer
@export var weapon: Node2D

func _ready():
	pass

func _die() -> void:
	EventsManager.decrease_lives()
