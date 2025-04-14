extends CharacterBody2D
class_name EnemyWorm

@export var stats: WormEnemyStats
@export var group_names: GroupNames
@export var animated_sprite_2d: AnimatedSprite2D
@export var right_wall_ray: RayCast2D
@export var left_wall_ray: RayCast2D
@export var max_distance: float
@export var hitbox: Area2D
@export var upgrades_array: Array[BaseBulletStrategy]

@onready var sfx_attack: AudioStreamPlayer2D = $Sfx/Attack
@onready var sfx_death: AudioStreamPlayer2D = $Sfx/Death

var has_bounds: bool = true
var right_bound: Vector2 = Vector2.ZERO
var left_bound: Vector2 = Vector2.ZERO

var direction: Vector2 = Vector2.RIGHT

var hp: float
var gravity: float = 12.0

var upgrade_scene: PackedScene = preload("res://Scenes/Weapons/Upgrades/upgrade.tscn")
var upgrades_parent: Node2D


func _ready() -> void:
	right_bound = global_position + Vector2(max_distance, 0)
	left_bound = global_position + Vector2(-max_distance, 0)
	
	hp = stats.HP
	
	upgrades_parent = get_tree().get_first_node_in_group(group_names.upgrades_parent_node)
	assert(upgrades_parent != null, "No upgrades node found")

func _physics_process(_delta: float) -> void:
	if !is_on_floor():
		velocity.x = 0
		velocity.y += gravity

func _on_visible_on_screen_enabler_2d_screen_entered() -> void:
	pass

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	pass
