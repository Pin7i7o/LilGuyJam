extends CharacterBody2D
class_name Player

@export var animated_sprite_2d: AnimatedSprite2D
@export var stats: PlayerStats
@export var coyote_time_timer: Timer
@export var weapon: Node2D
@export var sfx_dmg_taken: AudioStreamPlayer2D
@export var sfx_jump: AudioStreamPlayer2D

var previous_safe_position: Vector2 = Vector2.ZERO

func _ready():
	pass

func _deathzone_hit() -> void:
	sfx_dmg_taken.play()
	global_position = previous_safe_position
	EventsManager.decrease_lives()

func _die() -> void:
	sfx_dmg_taken.play()
	animated_sprite_2d.play("dmg")
	EventsManager.decrease_lives()
