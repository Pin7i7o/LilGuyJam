extends CharacterBody2D
class_name EnemyWorm

@export var stats: WormEnemyStats
@export var animated_sprite_2d: AnimatedSprite2D

@export var wall_ray: RayCast2D

@export var max_distance: float

@onready var hitbox: CollisionShape2D = $Hitbox/CollisionShape2D

var right_bound: Vector2 = Vector2.ZERO
var left_bound: Vector2 = Vector2.ZERO
var hp: float

func _ready() -> void:
	right_bound = global_position + Vector2(max_distance, 0)
	left_bound = global_position + Vector2(-max_distance, 0)
	
	hp = stats.HP
	hitbox.shape = hitbox.shape.duplicate()
