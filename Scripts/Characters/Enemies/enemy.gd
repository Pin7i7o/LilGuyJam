extends CharacterBody2D
class_name Enemy

@export var enemy_stats: EnemyStats
@export var max_distance: float

@onready var right_ground_ray: RayCast2D = $RightGroundRay
@onready var left_ground_ray: RayCast2D = $LeftGroundRay
@onready var wall_ray: RayCast2D = $WallRay

var direction: Vector2 = Vector2.RIGHT
var right_bound: Vector2
var left_bound: Vector2

func _ready() -> void:
	right_bound = global_position + Vector2(max_distance, 0)
	left_bound = global_position + Vector2(-max_distance, 0)

func move() -> void:
	pass
