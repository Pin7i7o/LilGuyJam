extends CharacterBody2D
class_name EnemyWorm

@export var stats: WormEnemyStats
@export var animated_sprite_2d: AnimatedSprite2D

@export var right_ground_ray: RayCast2D
@export var left_ground_ray: RayCast2D
@export var wall_ray: RayCast2D
@export var vision_cone_ray: RayCast2D

@export var max_distance: float

var right_bound: Vector2 = Vector2.ZERO
var left_bound: Vector2 = Vector2.ZERO

func _ready() -> void:
	right_bound = global_position + Vector2(max_distance, 0)
	left_bound = global_position + Vector2(-max_distance, 0)
	vision_cone_ray.target_position = Vector2(stats.VISION_CONE_RANGE, 0)

func _physics_process(delta: float) -> void:
	pass
