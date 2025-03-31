extends CharacterBody2D
class_name EnemyBoss

@export var stats: BossEnemyStats
@export var group_names: GroupNames
@export var enemy_phase: Array[StringName]
@export var animated_sprite_2d: AnimatedSprite2D
@export var hitbox: Area2D
@export var worm_markers: Node
@export var turret_markers: Node

var hp: float
var slam_phase_counter: float

var hand_scene: PackedScene = preload("res://Scenes/Characters/Enemy/hand.tscn")
var hand_parent: Node2D

var worm_scene: PackedScene = preload("res://Scenes/Characters/Enemy/worm.tscn")
var worm_parent: Node2D

var turret_scene: PackedScene = preload("res://Scenes/Characters/Enemy/turret.tscn")
var turret_parent: Node2D

func _ready() -> void:
	hp = stats.HP
	slam_phase_counter = 0.0
	
	hand_parent = get_tree().get_first_node_in_group(group_names.hand_parent_node)
	assert(hand_parent != null, "No hand node found")
	
	worm_parent = get_tree().get_first_node_in_group(group_names.worm_parent_node)
	assert(worm_parent != null, "No worm node found")
	
	turret_parent = get_tree().get_first_node_in_group(group_names.turret_parent_node)
	assert(turret_parent != null, "No turret node found")
	
