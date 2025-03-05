extends CharacterBody2D

@export var animated_sprite_2d: AnimatedSprite2D
@export var stats: PlayerStats

var prev_velocity = Vector2.ZERO
var movement_input = Vector2.ZERO

func _ready():
	pass

func _physics_process(_delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() *_delta
